.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

pushl       %eax
pushl       %ecx
pushl       %edx
pushl       %esi
pushl       %edi

movl        $175,%esi
movl        %eax,%edx
movl        $4,%ecx
subR1:      
rol         $4,%dx
movb        %dl,%al
andb        $0xf,%al
addb        $0x30,%al
cmpb        $0x39,%al
jbe         subR2
addb        $7,%al
subR2:
movb        %al,%ds:0(,%esi,1)
inc         %esi
loop        subR1
movl        $164,%esi
movl        $800,%edi
int         $0xfe

popl        %edi
popl        %esi
popl        %edx
popl        %ecx
popl        %eax

lret

.org 512
