.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

errMess:        .ascii          "Error!!!"

cld
movw            $0xa0,%ax           #errCodeSel
movw            %ax,%ds
movl            $0,%esi             #offset of errMess
movw            $0x10,%ax           #videoBufSel
movw            %ax,%es
movl            $1992,%edi
movl            $8,%ecx             #len of errMess
movb            $0x4e,%ah
err1:
lodsb
stosw
loop            err1
conErr:
loop            conErr

.org 512
