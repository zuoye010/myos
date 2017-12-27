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
Jump16      $0x21a0,$0x0
getkey:
movw        $0x1040,%ax
movw        %ax,%ds
movw        %esp,%ebp
lss         %ds:6(,%edi,1),%sp
lidt        %ds:12(,%edi,1)
sti
movw        $22,%dx
call16      showIt
getKey1:
movb        $0,%ah
int         


movw        $0x10,%ax
movw        %ax,%es
movw        %ds:0(,%edi,1),%ax
movw        %ax,%es:0(,%edi,1)

popl        %edi
popw        %gs
popw        %fs
popw        %es
popw        %ax
movw        %ax,%ds

iret

.org 512
