.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

test3Begin:
cli
clts
iret

jmp test3Begin

testBegin:

movb    $0xb6,%al
outb    %al,$0x43

movb    $2,%al
outb    %al,$0x42

movb    $0x34,%al
outb    %al,$0x42

inb     $0x61,%al
movb    %al,%ah
orb     $3,%al
outb    %al,$0x61
movl    $0x1234567,%ecx
conSound:
loop    conSound
mov     %ah,%al
outb    %al,$0x61
iret
jmp     testBegin

.org 512
