#   Copyright 2008-2016 Intel Corporation
#All rights reserved.
#Redistribution and use in source and binary forms, with or without modification,
#are permitted provided that the following conditions are met:

 #   Redistributions of source code must retain the above copyright notice,
 #   this list of conditions and the following disclaimer.
 #   Redistributions in binary form must reproduce the above copyright notice,
 #   this list of conditions and the following disclaimer in the documentation
 #   and/or other materials provided with the distribution.
 #   Neither the name of the Intel Corp. nor the names of its contributors
 #   may be used to endorse or promote products derived from this software
 #   without specific prior written permission.


#THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
#IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
#ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
#LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
#CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
#SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
#INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
#STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
#WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#   get_cpuid.asm
#   wrapper function to retrieve CPUID leaf and subleaf data,
#   returns CPUID leaf/subleaf raw data in a data structure
#
#  Written by Patrick Fay
#
#
#  caller supplies three parameters;
#  pointer to a data structure
#  leaf index
#  sub leaf index
#
.intel_syntax noprefix

# -------------------------- 64bit ----------------------
#          .686P
#          .XMM
#          .model      flat
#INCLUDELIB LIBCMT
#INCLUDELIB OLDNAMES

# Function compile flags: /Ogtpy
           .text
#_get_cpuid_info PROC
           .global     get_cpuid_info
get_cpuid_info:
           mov  edx, DWORD PTR 8[esp-4]   # addr of start of output array
           mov  eax, DWORD PTR 12[esp-4]  # leaf
           mov  ecx, DWORD PTR 16[esp-4]  # subleaf
           push        edi
           push        ebx
           mov         edi, edx         # edi has output addr
           cpuid
           mov         DWORD PTR [edi], eax
           mov         DWORD PTR [edi+4], ebx
           mov         DWORD PTR [edi+8], ecx
           mov         DWORD PTR [edi+12], edx
           pop         ebx
           pop         edi
           ret
#_get_cpuid_info ENDP
#_TEXT     ENDS

#          END
