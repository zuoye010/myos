.code16
.text
movw    %cs,%ax
movw    %ax,%ds
movw    %ax,%es
movl    $0,%edi

movw    $0x1a0, %ax
pushl   %eax
movl    $0x1a9,%eax
movw    %ds:0(%eax,%edi,1),%cx
popl    %eax
movb    $5,%dh
call    dispMessage

lret

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

.org 416

programMessage:                  .ascii "Program2!"
lenOfProgramMessage:             .short 9

.org 512
