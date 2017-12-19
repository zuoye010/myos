.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

pushl       %ebp
movl        %esp,%ebp
pushal
movl        %ss:12(,%ebp,1),%esi
movb        $0x4a,%ah
jmp         subR2
subR1:
            stosw
subR2:  
            lodsb
or          %al,%al
jnz         subR1
movl        %ss:16(,%ebp,1),%edx
movl        $8,%ecx
subR3:
rol         $4,%edx
movb        %dl,%al
call        hToAscii
stosw
loop        subR3
popal
pop         %ebp
ret         $8                  #may be retf ?  or lret  ?

hToAscii:
pushw       %bx
andb        $0x0f,%al
movb        %al,%bl
addb        $0x30,%al
cmpb        $0x9,%bl
popw        %bx
jb          Next
addb        $0x07,%al
Next:
lret

.org 512
