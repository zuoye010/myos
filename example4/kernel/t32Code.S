.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

T32Begin:
movw    $(0x0+TIL),%ax
movw    %ax,%ss
movl    $0x200,%esp
pushl   $(0x10+TIL+RPL3)
pushl   $0x200
pushl   $(0x18+TIL+RPL3)
pushl   $0
retf                        #to demoCode rpl0 32

T32End:
Jump32  0x28,0x11           #offset of ToReal

.org 512
