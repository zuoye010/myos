.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

movb        $0xFE,%al
outb        %al,$0x21

cld

movw        $0x18,%ax                   #init pdt
movw        %ax,%es
xor         %edi,%edi
movl        $1024,%ecx
xor         %eax,%eax
rep         stosl

xor         %edi,%edi

xor         %ebx,%ebx
movl        $USU,%ebx
addl        $RWW,%ebx
addl        $PL,%ebx
or          $0x201000,%ebx
movl        %ebx,%es:0(,%edi,1)

movw        $0x20,%ax                   #init pt0
movw        %ax,%es
xor         %edi,%edi
movl        $1024,%ecx
xor         %eax,%eax
movl        $USU,%eax
addl        $RWW,%eax
addl        $PL,%eax
demo1:
            stosl
addl        $0x1000,%eax
loop        demo1

movl        $0x200000,%eax
movl        %eax,%cr3

movl        %cr0,%eax
or          $0x80000000,%eax
movl        %eax,%cr0

jmp         pageE
pageE:

CALL32      0x48,0x0                #to demoCode

.org 512
