.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

otherBegin:
movw        $0x10,%ax
movw        %ax,%ds
movb        $0x17,%ah
movb        $0x21,%al
xorl        %edi,%edi
movw        %ax,%ds:0(,%edi,1)
jmp         otherBegin

.org 512
