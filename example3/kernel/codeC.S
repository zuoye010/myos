.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

dispMsg:
movb    $0x4e,%ah
disp1:
movb    %fs:(,%esi,1),%al
inc     %si
or      %al,%al
jz      disp2
movw    %ax,%es:(,%edi,1)
inc     %di
inc     %di
jmp     disp1
disp2:
lret

hToASCII:
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
