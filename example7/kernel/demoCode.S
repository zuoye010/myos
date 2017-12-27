.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

movw        $0x28,%ax
lldt        %ax
movw        $(0x8+TIL),%ax 
movw        %ax,%ss
movl        $0x400,%esp
movw        $(0x0+TIL),%ax
movw        %ax,%gs
movl        $0,%edi
movw        $0x28,%gs:96(,%edi,1)
movw        $0x30,%ax
ltr         %ax
movw        $(0x10+TIL),%ax         #demoDataSel
movw        %ax,%ds
movw        $0x10,%ax               #videoBufSel
movw        %ax,%es
movw        $0x38,%ax               #bufferSel
movw        %ax,%fs
movw        %ax,%gs
int         $0xff
movl        $0,%edi
movb        %fs:0(,%edi,1),%al
cmpb        $0x30,%al                #cmp with '0'
jnz         demo4
movw        $2000,%ax
movb        $2,%cl
div         %cl
jmp         over
demo4:
cmpb        $0x34,%al                #cmp with '4'
jnz         demo11
movb        $100,%al
add         $50,%al
into
jmp         over
demo11:     
cmpb        $0x42,%al                #cmp with 'B'
jnz         demo12
movw        $(0x40+TIL),%ax
movw        %ax,%gs
jmp         over
demo12:
cmpb        $0x43,%al
jnz         demo13
movl        %esp,%ebp
movb        %ss:0(,%ebp,1),%al
jmp         over
demo13:
movw        $0x30,%ax
movw        %ax,%gs
over:
Jump16      0x18,0x5
.org 512
