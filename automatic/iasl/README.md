# <img src="https://cdn.rawgit.com/warexify/chocolatey-edk2-buildtools/master/icons/iasl.png" width="48" height="48"/> [iASL: ACPI Source Language Optimizing Compiler and Disassembler](https://chocolatey.org/packages/iasl)

The iASL compiler/disassembler is a fully-featured translator for the ACPI Source Language (ASL) and ACPI binary data tables. As part of the Intel ACPI Component Architecture, the Intel ASL compiler implements translation for the ACPI Source Language (ASL) to the ACPI Machine Language (AML). The disassembler feature will disassemble compiled AML code back to (nearoriginal) ASL source code.

## The major features of the iASL compiler include:

- Full support for the ACPI 5.1 Specification including ASL grammar elements and operators.
- Extensive compiler syntax and semantic error checking, especially in the area of control methods. This reduces the number of errors that are not discovered until the AML code is actually interpreted (i.e., the compile-time error checking reduces the number of run-time errors.)
- An integrated preprocessor provides C-compatible preprocessor directives and conditional compilation directives such as #define, #if, #ifdef, #else, etc.
- Multiple types of output files. Besides binary ACPI tables, output options include formatted listing files with intermixed source, several types of AML files, and error messages.
- Automatic detection and compilation of either ASL source code or ACPI data table source code.
- Portable code (ANSI C) and source code availability allows the compiler to be easily ported and run on multiple execution platforms.
- Support for integration with the Microsoft Visual C++ (or similar) development environments.
- Disassembly of all ACPI tables, including tables that contain AML (DSDT, SSDT) as well as ACPI “data” tables such as the FADT, MADT, SRAT, etc.
- Support for compilation of non-AML data tables such as the FADT, MADT, SRAT, etc.
- Support for ASL language extensions that support symbolic math/logical operators and expressions.
