import-module au
 . "$PSScriptRoot\update_helper.ps1"

$release = 'https://winaero.com/e107_files/downloads/winaerotweaker.zip'
$headers = @{ referer = "http://winaero.com/download.php?view.1796" }
$zip = "winaero.zip"
 
function global:au_BeforeUpdate {
	cp "$PSScriptRoot\README.tmp" "$PSScriptRoot\README.md" -Force
	Set-ReadMeFile -keys "PackageName" -new_info "$($Latest.PackageName)"	
}

function global:au_AfterUpdate {
	# if ($($Latest.PackageName) -ne "Winaero-Tweaker" ) {
	# cp "$PSScriptRoot\$($Latest.PackageName).tmp" "$PSScriptRoot\winaero-tweaker.nuspec" -Force
	# }
	if (($($Latest.Title) -eq "Winaero Tweaker")) {
	write-host "changing nuspec A $($Latest.PackageName).install,$($Latest.Version)"
	Update-MetadataRB -data @{"dependency" = "$($Latest.PackageName).install,$($Latest.Version)"; "file" = "*.nuspec, "; "title" = "$($Latest.Title)"}
	write-host "changed nuspec A $($Latest.PackageName).install,$($Latest.Version)"
	} else {
	write-host "changing nuspec B $($Latest.WindowsKB),$($Latest.WindowKBVer)"
	Update-MetadataRB -data @{"dependency" = "$($Latest.WindowsKB),$($Latest.WindowKBVer)"; "file" = "tools\**,tools"; "title" = "$($Latest.Title)"}
	write-host "changed nuspec B $($Latest.WindowsKB),$($Latest.WindowKBVer)"
	}
	Remove-Item "$PSScriptRoot\README.md" -Force
}

function global:au_SearchReplace {
	@{
		".\tools\chocolateyInstall.ps1" = @{
			"(^[$]packageName\s*=\s*)('.*')"      = "`${1}'$($Latest.PackageName)'"
			"(?i)^(\s*url\s*=\s*)'.*'"            = "`${1}'$($Latest.URL32)'"
			"(^[$]checksum_zip\s*=\s*)('.*')"     = "`${1}'$($Latest.Checksum32)'"
			"(?i)^(\s*checksumType\s*=\s*)'.*'"   = "`${1}'$($Latest.ChecksumType32)'"
			"(^[$]checksum_exe\s*=\s*)('.*')"     = "`${1}'$($Latest.Checksum64)'"
		}
	}
}

function global:au_GetLatest {	
  $streams = [ordered] @{
	install  = ( Get-FileAndVersion -release $release -zip $zip -package "Winaero-Tweaker.install" )
	portable = ( Get-FileAndVersion -release $release -zip $zip -package "Winaero-Tweaker.portable" )
	zeta = ( Get-FileAndVersion -release $release -zip $zip -package "Winaero-Tweaker" )
  }
  return @{ Streams = $streams }
}

update -NoCheckUrl -ChecksumFor none
