.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

movl        $0,%edi
movw        $0x18,%ax
movw        %ax,%ds

movl        %cr0,%eax                   #save cr0
movl        %eax,%ds:24(,%edi,1)

movl        %cr3,%eax                   #save cr3
movl        %eax,%ds:28(,%edi,1)

movl        %dr7,%eax                   #save cr3
movl        %eax,%ds:32(,%edi,1)

str         %ds:22(,%edi,1)
sldt        %ds:20(,%edi,1)

movw        $0x20,%ds:36(,%edi,1)
movw        $(0x20+RPL3),%ax
arpl        %ax,%ds:36(,%edi,1)

movl        $0,%ebx
movw        $0x20,%ax
lab1:
movl        $0,%edx
movl        $0,%ecx
lsl         %eax,%edx
lsl         %ax,%cx
movl        %edx,%ds:38(%ebx,%edi,1)
movw        %cx,%ds:46(%ebx,%edi,1)
movl        $0,%edx
movw        $0,%cx
lar         %eax,%edx
lar         %ax,%cx
movl        %edx,%ds:42(%ebx,%edi,1)
movw        %cx,%ds:48(%ebx,%edi,1)
movw        $0,%ds:50(%ebx,%edi,1)
verr        %ax
jnz         lab2
movw        $1,%ds:50(%ebx,%edi,1)
lab2:
movw        $0,%ds:52(%ebx,%edi,1)
verw        %ax
jnz         lab3
movw        $1,%ds:52(%ebx,%edi,1)
lab3:
addw        $16,%bx
movw        $0x28,%ax
cmp         $32,%bx
jb          lab1

movw        $0x8,%ax
movw        %ax,%ds

movl        %cr0,%eax
andl        $0xFFFE,%eax
movl        %eax,%cr0

Jump16      0x2040,0x43

.org 512
