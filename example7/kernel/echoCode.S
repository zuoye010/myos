.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

pushal
cld
movb        $7,%ah
movb        $0x20,%al
movl        $2000,%ecx
pushl       %edi
rep         stosw
popl        %edi
echo1:
lodsb
or          %al,%al
jz          echo2
stosw
jmp         echo1
echo2:
popal

iret

.org 512
