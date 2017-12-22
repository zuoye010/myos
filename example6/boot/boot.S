.code16
.text
movw    $0x7c0,%ax
movw    %ax,%ds
movw    %ax,%es
movw    $0x9880,%ax
movw    %ax,%ss
movw    $0x200,%sp
movl    $0,%edi

movw    $0x1a0, %ax
pushl   %eax
movl    $0x1b3,%eax
movw    %ds:0(%eax,%edi,1),%cx
popl    %eax
movb    $0,%dh
call    dispMessage

movb    $2,%cl
movw    $0x1040,%ax
call    readToRam

movb    $3,%cl
movw    $0x1060,%ax
call    readToRam

movb    $4,%cl
movw    $0x1080,%ax
call    readToRam

movb    $5,%cl
movw    $0x10a0,%ax
call    readToRam

movb    $6,%cl
movw    $0x2040,%ax
call    readToRam

movb    $7,%cl
movw    $0x2060,%ax
call    readToRam

movb    $8,%cl
movw    $0x2080,%ax
call    readToRam

movb    $9,%cl
movw    $0x20a0,%ax
call    readToRam

movb    $10,%cl
movw    $0x20c0,%ax
call    readToRam

movw    $0x1b5, %ax
pushl   %eax
movl    $0x1ca,%eax
movw    %ds:0(%eax,%edi,1),%cx
popl    %eax
movb    $1,%dh
call    dispMessage

ljmp    $0x2040,$0x0

wrong:
movw    $0x1cc, %ax
pushl   %eax
movl    $0x1d2,%eax
movw    %ds:0(%eax,%edi,1),%cx
popl    %eax
movb    $10,%dh
call    dispMessage

inf:jmp inf

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

readToRam:
   pushw %ax
   pushw %bx
   pushw %cx
   pushw %dx
   pushw %es

   movw $0,%bx
   movw %ax,%es
   
   movb $2,%ah
   movb $1,%al
   movb $0,%ch
   
   movb $0,%dh
             
   mov $0,%dl
   int $0x13

   popw %es
   popw %dx
   popw %cx
   popw %bx
   popw %ax

   ret

.org 416

bootMessage:                .ascii "Now,Loading kernel!"
lenOfBootMessage:           .short 19
bootMessageFinish:          .ascii "Loading has finished!"
lenOfBootMessageFinish:     .short 21
test:                       .ascii "Wrong!"
lenOfTest:                  .short 6

.org 510
.word 0xaa55
