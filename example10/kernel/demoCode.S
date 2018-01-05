.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

movw        $0x10,%ax               #init pdt
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
or          $0x202000,%ebx
movl        %ebx,%es:0(,%edi,1)

xor         %ebx,%ebx
movl        $USU,%ebx
addl        $RWW,%ebx
addl        $PL,%ebx
or          $0x201000,%ebx
movl        %ebx,%es:4(,%edi,1)

movw        $0x18,%ax                   #init pt0
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

movl        $0xb8000,%edi
shrl        $12,%edi
shll        $2,%edi
movl        $0x301000,%eax
addl        $USS,%eax
addl        $RWW,%eax
addl        $PL,%eax
movl        %eax,%es:0(,%edi,1)

movl        $0xf0000,%edi
shrl        $12,%edi
shll        $2,%edi
movl        $0xb8000,%eax
addl        $USU,%eax
addl        $RWR,%eax
addl        $PL,%eax
movl        %eax,%es:0(,%edi,1)

movw        $0x20,%ax                   #init pt1
movw        %ax,%es
xor         %edi,%edi
movl        $1024,%ecx
movl        $0x400000,%eax
demo2:
            stosl
addl        $0x1000,%eax
loop        demo2

movl        $0x402000,%edi
shrl        $12,%edi
andl        $0x3ff,%edi
shll        $2,%edi
movl        $0x303000,%eax
addl        $USU,%eax
addl        $RWR,%eax
addl        $PL,%eax
movl        %eax,%es:0(,%edi,1)

movl        $0x200000,%eax
movl        %eax,%cr3

movl        %cr0,%eax
or          $0x80000000,%eax
movl        %eax,%cr0

jmp         pageE
pageE:
movw        $0x50,%ax
movw        %ax,%ds
movl        $0,%esi
Jump16      0x30,0x0
demo3:
movl        %cr0,%eax
andl        $0x7fffffff,%eax
movl        %eax,%cr0
jmp         pageD
pageD:
movw        $0x8,%ax
Jump16      0x40,0x21               #?

.org 512
