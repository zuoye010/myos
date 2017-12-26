.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

pushw       %ax
pushw       %cx
pushw       %dx
pushl       %esi
pushl       %edi

movl        $179,%esi
movw        %ax,%dx
movw        $4,%cx
subR1:      
rol         $4,%dx
movb        %dl,%al
andb        $0xf,%al
addb        $0x30,%al
cmpb        %al,$0x39
jbe         subR2
addb        $7,%al
subR2:
movb        %al,%ds:0(,%esi,1)
inc         %esi
loop        subR1
movl        $167,%esi
movl        $160,%edi

popl        %edi
popl        %esi
popw        %dx
popw        %cx
popw        %ax

iret

.org 512
