.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

DemoBegin:
movl        $0x30,%eax
movl        $0x0,%esi
movb        $0x2,%fs:4(%eax,%esi,1)
movl        $0x0,%eax
pushl       %gs:36(%eax,%esi,1)
pushl       $0x0    
CALL32      (0x30+TIL+RPL2),0            #to echoSub1 rpl1

movl        $0x28,%eax
movw        %ax,%ds
pushl       %gs
popl        %ds
movl        $0x4c,%eax
movl        $0x0,%esi
movl        $0x8,%ebx
movl        %ebx,%ds:0(%eax,%esi,1)
movl        %ebx,%ds:8(%eax,%esi,1)
movl        %ebx,%ds:12(%eax,%esi,1)
movl        %ebx,%ds:16(%eax,%esi,1)
movl        %ebx,%ds:20(%eax,%esi,1)
Jump32      (0x38+TIL),0
jmp         DemoBegin

.org 512
