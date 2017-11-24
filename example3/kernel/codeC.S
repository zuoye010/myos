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
lret

hToASCII:
andb        $0x0f,%al
cmpb        $0x9,%al
jb          useAscii
addb        $0x30,%al
jmp         myRet
nop
useAscii:
addb        $0x57,%al
nop
myRet:
lret

.org 512
