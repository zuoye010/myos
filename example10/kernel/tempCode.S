.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

cld
movw        $0x58,%ax
movw        %ax,%ds
movw        $0x38,%ax
movw        %ax,%es
movl        $0,%esi
movl        %esi,%edi
movl        $0x0,%ecx           #?
rep         movsb

Jump16      0x48,0        #to demoCode

ToReal:
#movw        $0x8,%ax
movw        %ax,%ds
movw        %ax,%es

movl        %cr0,%eax
andb        $0xFE,%al
movl        %eax,%cr0
Jump16      0x2040,0x0          #?

.org 512
