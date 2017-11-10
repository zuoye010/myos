.include "/home/ml/myos/include/386scd.h"

.code16
.section .text

movw        $0x820,%ax
movw        %ax,%ds
movw        $16,%bx
mul         %bx

movl        $0,%edi
movw        %ax,%ds:34(,%edi,1)
movw        %dx,%ds:36(,%edi,1)

movw        $0x800,%ax
movw        $16,%bx
mul         %bx
movl        $0,%edi
movw        %ax,%bx
movl        $8,%eax
movw        %bx,%ds:desc.baseL(%eax,%edi,1 )
movb        %dl,%ds:desc.baseM(%eax,%edi,1 )
movb        %dh,%ds:desc.baseH(%eax,%edi,1 )

movw        $0x820,%ax
movw        $16,%bx
mul         %bx
movl        $0,%edi
addw        $38,%ax
adcw        $0,%dx
movw        %ax,%bx
movl        $24,%eax
movw        %bx,%ds:desc.baseL(%eax,%edi,1 )
movb        %dl,%ds:desc.baseM(%eax,%edi,1 )
movb        %dh,%ds:desc.baseH(%eax,%edi,1 )

movl        $0,%edi
lgdt        %ds:32(,%edi,1)
cli

EnableA20

movl        %cr0,%eax
orl         $1,%eax
movl        %eax,%cr0

Jump16      0x8,0x97

movw        $16,%ax
movw        %ax,%ds
movw        $24,%ax
movw        %ax,%es
cld
xor         %si,%si
xor         %di,%di
movw        $64,%cx
repz        movsd

movl        %cr0,%eax
andl        $0xFFFE,%eax
movl        %eax,%cr0

Jump16      0x800,0x0bd
        
DisableA20
sti
movw        $0x820,%ax
movw        %ax,%ds
movw        $38,%si
movl        $0,%edi
movl        $294,%ebx
cld
movw        $256,%cx
NextCh:
lodsb
pushw       %ax
shr         $1,%al
call        ToASCII
movb        %al,%dl
movl        %ebx,%eax
movb        %dl,%ds:0(%eax,%edi,1)
incl        %ebx
popw        %ax
call        ToASCII
movb        %al,%dl
movl        %ebx,%eax
movb        %dl,%ds:0(%eax,%edi,1)
incl        %ebx
movb        $32,%dl
movl        %ebx,%eax
movb        %dl,%ds:0(%eax,%edi,1)
incl        %ebx
loop NextCh
movw        $0x820,%ax
movw        %ax,%es
movw        $294,%ax
movw        $768,%cx
movb        $2,%dh
call dispMessage
inf:jmp inf

ToASCII:
#addb    $48,%al
andb        $0x0f,%al
addb        $0x90,%al
daa
adcb        $0x40,%al
daa
ret

dispMessage:
    pushw %ax
    pushw %bx
    pushw %dx
    pushw %bp

    movw %ax,%bp
    movw $0x1301,%ax
    movw $0x00c,%bx
    movb $0,%dl
    int $0x10

    popw %bp
    popw %dx
    popw %bx
    popw %ax

    ret

