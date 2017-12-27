.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

pushw       %ds
pushw       %es
pushw       %fs
pushw       %gs
pushl       %edi

movl        $0,%edi
movw        $0x8,%ax
movw        %ax,%ss

movl        %cr0,%eax
andb        $0xFE,%al
movl        %eax,%cr0

Jump16      0x21a0,0x20               #jump to getKey

getKey:
movw        $0x1040,%ax
movw        %ax,%ds
movw        %ax,%es
movl        %esp,%ebp
movw        $0x9980,%ax
movw        %ax,%ss
movw        $0x400,%sp
lidt        %ds:12(,%edi,1)
sti
movl        $22,%eax
movw        $24,%cx
movb        $3,%dh
call        dispMessage
getKey1:
movb        $0,%ah
int         $0x16
cmpb        $0x30,%al                   #cmp '0'
jz          getKey2
cmpb        $0x34,%al
jz          getKey2
andb        $0xdf,%al
cmpb        $0x42,%al
jb          getKey1
cmpb        $0x44,%al
ja          getKey1
getKey2:
movb        %al,%dl
movw        $0x10e0,%ax
movw        %ax,%es
movb        %dl,%es:0(,%edi,1)
movl        $0,%eax
movw        $1,%cx
movb        $4,%dh
call        dispMessage
cli
lidt        %ds:6(,%edi,1)

movl        %cr0,%eax
orl         $1,%eax
movl        %eax,%cr0

Jump16      TIL,0x97

movw        $(0x8+TIL),%ax
movw        %ax,%ss
movl        %ebp,%esp

popl        %edi
popw        %gs
popw        %fs
popw        %es
popw        %ax
movw        %ax,%ds

iret

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

.org 512
