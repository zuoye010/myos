.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

movw            $0x28,%ax
movw            %ax,%es
movl            $0,%edi
movb            $0x17,%ah
movl            $11,%ecx
s1:
lodsb
stosw
loop            s1
Jump16          0x48,0x14e             #?

.org 512
