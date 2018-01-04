.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

movw        $0x48,%ax                           #toTestTssSel
movw        %ax,%ds
movl        $0,%ebx

movl        $(0x58+RPL1),%ds:80(,%ebx,1)        #ss test1Stack
movl        $0x400,%ds:56(,%ebx,1)              #esp
movl        $(0x60+RPL1),%ds:76(,%ebx,1)        #cs
movl        $0x06,%ds:32(,%ebx,1)               #offset of testBegin
movl        $IOPL1,%ds:36(,%ebx,1)              #eflag
CALL32      0xa8,0                              #jump to test task

movl        $(0x68+RPL2),%ds:80(,%ebx,1)        #ss
movl        $0x400,%ds:56(,%ebx,1)              #esp
movl        $(0x70+RPL2),%ds:76(,%ebx,1)        #cs
movl        $0x06,%ds:32(,%ebx,1)               #offset of testBegin
movl        $IOPL1,%ds:36(,%ebx,1)              #eflag
CALL32      0xa8,0                              #jump to test task

movw        $0x38,%ax                           #toGdtSel
movw        %ax,%fs
movw        $AT386TSS,%fs:0x55(,%ebx,1)

movl        $(0x78+RPL3),%ds:80(,%ebx,1)        #ss
movl        $0x400,%ds:56(,%ebx,1)              #esp
movl        $(0x80+RPL3),%ds:76(,%ebx,1)        #cs
movl        $0x00,%ds:32(,%ebx,1)               #offset of testBegin
movl        $IOPL2,%ds:36(,%ebx,1)              #eflag
CALL32      0xa8,0                              #jump to test task

movw        $0x38,%ax
movw        %ax,%fs
movw        $AT386TSS,%fs:0x55(,%ebx,1)

movl        $(0x78+RPL3),%ds:80(,%ebx,1)        #ss
movl        $0x400,%ds:56(,%ebx,1)              #esp
movl        $(0x80+RPL3),%ds:76(,%ebx,1)        #cs
movl        $0x00,%ds:32(,%ebx,1)               #offset of testBegin
movl        $IOPL3,%ds:36(,%ebx,1)              #eflag
CALL32      0xa8,0                              #jump to test task

JUMP32      0x30,0x21                   #jump to tempCode
.org 512
