REM Copyright 2008-2016 Intel Corporation 
REM batch file to compile cpu topology reference code
REM 
REM  Assemble  asm source file for 32-bit environment
ml  /c get_cpuid.asm
REM  Compile OS/API-specific module
cl /c  util_os.c
REM Compile/Link main topology enumeration code with support modules
cl  /Fecpu_topo32.exe /DBUILD_MAIN cpu_topo.c get_cpuid.obj util_os.obj 
