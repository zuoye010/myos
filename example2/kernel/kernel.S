.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

movw        $0x1040,%ax
movw        %ax,%ds
movw        $16,%bx
mul         %bx

movl        $0,%edi
movw        %ax,%ds:58(,%edi,1)
movw        %dx,%ds:60(,%edi,1)

movw        $0x2060,%ax
movw        $16,%bx
mul         %bx
movl        $0,%edi
movw        %ax,%bx
movl        $16,%eax
movw        %bx,%ds:desc.baseL(%eax,%edi,1 )
movb        %dl,%ds:desc.baseM(%eax,%edi,1 )
movb        %dh,%ds:desc.baseH(%eax,%edi,1 )

movw        $0x2080,%ax
movw        $16,%bx
mul         %bx
movl        $0,%edi
movw        %ax,%bx
movl        $24,%eax
movw        %bx,%ds:desc.baseL(%eax,%edi,1 )
movb        %dl,%ds:desc.baseM(%eax,%edi,1 )
movb        %dh,%ds:desc.baseH(%eax,%edi,1 )

movw        $0x9800,%ax
movw        $16,%bx
mul         %bx
movl        $0,%edi
movw        %ax,%bx
movl        $48,%eax
movw        %bx,%ds:desc.baseL(%eax,%edi,1 )
movb        %dl,%ds:desc.baseM(%eax,%edi,1 )
movb        %dh,%ds:desc.baseH(%eax,%edi,1 )

movl        $0,%edi
lgdt        %ds:56(,%edi,1)
cli

EnableA20

movl        %cr0,%eax
orl         $1,%eax
movl        %eax,%cr0

Jump16      0x10,0x0

movw        $0x1040,%ax
movw        %ax,%ds
movl        $62,%eax
movl        $0,%edi
movw        %ds:0(%eax,%edi,1),%sp
addl        $2,%eax
movw        %ds:0(%eax,%edi,1),%ss
        
DisableA20
sti
inf:jmp inf

.org 512
