REM Copyright 2008-2016 Intel Corporation
REM batch file to compile cpu topology reference code
REM 
REM  Assemble  asm source file for 32-bit environment
ml64  /c /DX86_64 get_cpuid.asm
REM  Compile OS/API-specific module
cl /c  /Zi /D_x86_64 util_os.c
REM Compile/Link main topology enumeration code with support modules
cl /Zi /Fecpu_topo64.exe /D_x86_64 /DBUILD_MAIN cpu_topo.c get_cpuid.obj util_os.obj /link kernel32.lib /debug /map
