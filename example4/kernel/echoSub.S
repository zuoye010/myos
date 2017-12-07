.include "/home/xx/myos/include/386scd.h"

.code32
.section .text
Message:    .ascii          "CPL="
            .byte           0

cld
pushl   %ebp
movl    %esp,%ebp
movw    $(0x28+TIL+RP1),%ax
movw    %ax,%ds
movw    $0x10,%ax
movw    %ax,%es
movl    $1996,%edi
movl    $0,%esi

movb    $0x4e,%ah
echoSub1:
lodsb
or      %al,%al
jz      echoSub2
stosw
jmp     echoSub1
movl    $ss:8(,%ebp,1),%eax
andb    $3,%al
addb    $0x30,%al
movb    $0x4e,%ah
stosw
popl    %ebp
retf

.org 512
