.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

movw        $48,%ax
movw        %ax,%ss
movl        $0x100,%esp

movw        $32,%ax
movw        %ax,%ds

movw        $40,%ax
movw        %ax,%es

xor         %esi,%esi
xor         %edi,%edi
movl        $16,%ecx
cld

Next:
lodsb
pushw       %ax
call        ToASCII
movb        $7,%ah
shll        $16,%eax
popw        %ax
shrb        $4,%al
call        ToASCII
movb        $7,%ah
stosl
movb        $0x20,%al
stosw
loop        Next
Jump32      0x18,0x0

ToASCII:
andb        $0x0f,%al
addb        $0x30,%al
cmpb        $0x39,%al
jbe         IsDig
addb        $7,%al
IsDig:
ret

.org 512
