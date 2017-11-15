.include "/home/ml/myos/include/386scd.h"

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
ret

hToASCII:
andb        $0x0f,%al
addb        $0x90,%al
daa
adcb        $0x40,%al
daa
ret

.org 512
