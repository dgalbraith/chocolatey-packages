
function Get-FileAndVersion {
param(
	[string]$package,
    [string]$release,
    [string]$zip,
    [switch]$cleanup
)

$name = [io.path]::GetFileNameWithoutExtension($zip)
$temp_dir = "${env:temp}"; $zip = "$temp_dir\$name\$zip"
$str = (($package -replace("\-"," ") ) -split("\."))
if (!(Test-Path "$temp_dir\$name")) { new-item -path $temp_dir -name $name -type directory  }
if (!(Test-Path $zip)) {
Invoke-WebRequest -UseBasicParsing -Uri $release -Headers $headers -OutFile $zip
cmd /c 7z x "$zip" -o"$temp_dir\$name" "*.exe" -r | Out-Null
}
$jump = ( Get-ChildItem -Path "$temp_dir\$name" )[-1]
$version = ($jump | Foreach { $_.VersionInfo.ProductVersion -replace '^(\d+(\.[\d]+){1,3}).*', '$1' })
$checksum = ( Get-FileHash -Path $zip ).hash; $checksum_exe = ( Get-FileHash "$temp_dir\$name\$jump" ).hash;
$checksumtype = "SHA256"
 
$hash = @{
	PackageName    = $package.ToLower()
	Url32          = $release
	Version        = $version
	Checksum32     = $checksum
	ChecksumType32 = $checksumtype
	Checksum64     = $checksum_exe
	ChecksumType64 = $checksumtype
}
if ( $package -ne ($package -replace(".install|.portable")) ) {
$hash.Add( "Title" ,  ( -join ( $str[0], " (" , $str[-1] , ")" ) ) )
$hash.Add( "WindowsKB" , 'kb2919355' )
$hash.Add( "WindowKBVer" , '1.0.20160915' )
} else {
$hash.Add( "Title" , ( $str[0] ) )
$hash.Add( "WindowsKB" , 'winaero-tweaker.install' )
$hash.Add( "WindowKBVer" , "$version" )
}
if ($cleanup) {
Remove-Item  "$temp_dir\$name\*" -Force
}

return $hash
}

function Update-MetadataRB {
    param(
        [Parameter(Mandatory = $true, ParameterSetName = "Single")]
        [string]$key,
        [Parameter(Mandatory = $true, ParameterSetName = "Single")]
        [string]$value,
        [Parameter(Mandatory = $true, ParameterSetName = "Multiple", ValueFromPipeline = $true)]
        [hashtable]$data = @{$key = $value},
        [ValidateScript( { Test-Path $_ })]
        [SupportsWildcards()]
        [string]$NuspecFile = "$pwd\*.nuspec"
    )

    $NuspecFile = Resolve-Path $NuspecFile
    $nu = New-Object xml
    $nu.PSBase.PreserveWhitespace = $true
    $nu.Load($NuspecFile)
    $data.Keys | ForEach-Object {
    if ($_ -eq "file") {
        if (!([string]::IsNullOrEmpty($value)) ) {
            $src,$target = $value -split(",")
        } else {
            $src,$target = $data[$_] -split(",")
        }		write-host "src -$src- target -$target-"
            $nu.package.files.file.src = $src
            $nu.package.files.file.target = $target
    } elseif ($_ -eq "dependency") {
            if (!([string]::IsNullOrEmpty($value)) ) {
                $id,$version = $value -split(",")
            } else {
                $id,$version = $data[$_] -split(",")
            }
        		write-host "id -$id- version -$version-"
            $nu.package.metadata.dependencies.dependency.id = $id
            $nu.package.metadata.dependencies.dependency.version = $version
        } else {
            if ($nu.package.metadata."$_") {
                $nu.package.metadata."$_" = $data[$_]
            } else {
                throw "$_ does not exist on the metadata element in the nuspec file"
            }
        }
    }
    $utf8NoBom = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllLines($NuspecFile, $nu.InnerXml, $utf8NoBom)
    write-host "nuspec -$NuspecFile- written"
}

function Set-ReadMeFile {
[CmdletBinding()]
param(
    [string]$file = "$pwd\README.tmp",
    [string[]]$keys,
    [string[]]$new_info
)
$me = ( $MyInvocation.MyCommand );

$keys = $keys.split(" |,")
$new_info = $new_info.split(" |,")
$data = Get-Content -Path $file
$i=0
foreach( $item in $keys ) {

$data = $data  -replace( "<$item>" , $($new_info[$i]) )
$i++
}

Write-Verbose "data -$data-"
$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllLines("$pwd/README.md", $data, $Utf8NoBomEncoding)

}
