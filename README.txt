Copyright (c) 2009-2016, Intel Corp.	All rights reserved.

1. Overview

Topology Enumeration Reference code for Intel 64 Architecture has been updated. It includes
Enhancement to use APIs supporting more than 64 logical processors under Windows*
Operating system. Support for Linux* Operating system remains the same with minor improvement.
Several coding issues have been corrected. 


2. Enhancement to enumerate topology for systems with more than 64 logical processors.
   a. 	If compiled under Windows* Platform SDK 7.0a or later, GROUP_AFFINITY API is supported.
	For detailed information on GROUP_AFFINITY, consult Windows* Platform SDK 7.0a documentation.
   b. 	If compiled under Windows* Platform SDK version prior to 7.0a, topology enumeration 
	under Windows is restricted to the active processor group, using legacy Win32 API.

3. Change Summary 2009
   a. mk_64.bat 		Compiler define "x86_64" is required
   b. cputopology.h::L73-79	Const define		
   c. cpu_topo.c::L64-70	defines 64-bit data type and const, "LNX_PTR2INT" and 
				"LNX_MY1CON"
   d. cpu_topo.c::L162		fixed previous coding error of counting only lower 32 bits 
				wnen in 64-bit Windows* OS.
   e. cpu_topo.c::L462-523	adds a formatting routine to handle long  
				generic affinity mask conversion to stdout without truncation
				error (when generic mask > 64 bits).
   f. cpu_topo.c::L2075-2117	Re-plumb stdout formatting utility to accommodate long
				generic affinity mask.
   g. cpu_topo.c::L2614-2619	Abort with error code if topology enumeration encountered 
				system configuration error.
   h. util_os.c::L24-32		Improves handling of distro-specific name space of Linux macro
   i. util_os.c::L41-47		defines 64-bit data type and const
   j. util_os.c::L72		scratch space declaration 
   k. util_os.c::L117-185	Modifed "BindContext(cpu_num)" that resolves at runtime whether 
				GROUP_AFFINITY API are available. If new Windows SDK 7.0a APIs
				are available, bind the current thread to the target processor
				group and target affinity mask bit corresponding to "cpu_num" 
   l. util_os.c::L206-226	Use new Windows SDK 7.0a APIs if available
   m. util_os.c::L266-386	Use new Windows SDK 7.0a APIs if available. Encode error code 
				if unable to resolve consistency issues between OS returned 
				ThreadGroupAffinityMask and our OS-independent generic mask. 
4. Change Summary 2014
   a. All source files		Updates to permit BSD license terms
   b. cputopology.h::L110	Updates Const define to provide headroom for growth of 
				leaf functions and sub-leaves
   c. cpu_topo.c::various	Harmonize variable type and casts used in strlen and loop iteration 
   d. cpu_topo.c::printCPUIDInfo	
				Print to screen of EAX/EBX/ECX/EDX hex dump of specified CPUID leaf.
				If specified leaf contain sub-leaves, print sub-leaf 1 and above 
				with indentation. 
   d. cpu_topo.c::L2695	
				Adds screen dump of known CPUID leaf functions per published CPUID
				reference pages of SDM.
5. Change Summary 2016
   a. util_os.c::L247-264	fixed Windows API usage error when there are two or more processor groups populated.
   b. cpu_topo.c::L2517		updated printCPUIDInfo() interface and implementation to query additional CPUID leaf functions.  
   c. cpu_topo.c::L2714-2750		Revised to invoke updated printCPUIDInfo() interface and dump additional CPUID leaf data.  


*Other names and brands may be claimed as properties of others.