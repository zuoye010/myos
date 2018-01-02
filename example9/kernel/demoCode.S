.include "/home/xx/myos/include/386scd.h"

.code16
.section .text

movw        $0x48,%ax
movw        %ax,%ds
movl        $0,%ebx

movw        $0x58,%ds:80(,%ebx,1)       #ss
movl        $0x400,%ds:56(,%ebx,1)      #esp
movw        $0x60,%ds:76(,%ebx,1)       #cs
movl        $0x00,%ds:32(,%ebx,1)       #offset of testBegin
movl        $IOPL1,%ds:36(,%ebx,1)      #eflag
CALL32      0xa8,0 

movw        $0x68,%ds:80(,%ebx,1)       #ss
movl        $0x400,%ds:56(,%ebx,1)      #esp
movw        $0x70,%ds:76(,%ebx,1)       #cs
movl        $0x00,%ds:32(,%ebx,1)       #offset of testBegin
movl        $IOPL1,%ds:36(,%ebx,1)      #eflag
CALL32      0xa8,0 

movw        $0x38,%ax
movw        %ax,%fs
movw        $AT386TSS,%fs:0x55(,%ebx,1)

movw        $0x78,%ds:80(,%ebx,1)       #ss
movl        $0x400,%ds:56(,%ebx,1)      #esp
movw        $0x80,%ds:76(,%ebx,1)       #cs
movl        $0x00,%ds:32(,%ebx,1)       #offset of testBegin
movl        $IOPL2,%ds:36(,%ebx,1)      #eflag
CALL32      0xa8,0 

movw        $0x38,%ax
movw        %ax,%fs
movw        $AT386TSS,%fs:0x55(,%ebx,1)

movw        $0x78,%ds:80(,%ebx,1)       #ss
movl        $0x400,%ds:56(,%ebx,1)      #esp
movw        $0x80,%ds:76(,%ebx,1)       #cs
movl        $0x00,%ds:32(,%ebx,1)       #offset of testBegin
movl        $IOPL3,%ds:36(,%ebx,1)      #eflag

JUMP32      0x30,0                      #?
.org 512
