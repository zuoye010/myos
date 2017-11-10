.code16
.text
movw %cs,%ax
movw %ax,%ds
movw %ax,%es
movw $0x880,%ax
movw %ax,%ss
movw $0x100,%sp

movw $bootMessage, %ax
movw lenOfBootMessage,%cx
movb $0,%dh
call dispMessage

movw $0x800,%ax
movb $2,%cl
call readToRam

movw $0x820,%ax
movb $3,%cl
call readToRam

movw $bootMessageFinish, %ax
movw lenOfBootMessageFinish,%cx
movb $1,%dh
call dispMessage

ljmp $0x800,$0x0

wrong:
movw $test, %ax
movw lenOfTest,%cx
movb $10,%dh
call dispMessage

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

bootMessage:                .ascii "Now,Loading kernel!"
lenOfBootMessage:           .short 19
bootMessageFinish:          .ascii "Loading has finished!"
lenOfBootMessageFinish:     .short 21
test:                       .ascii "Wrong!"
lenOfTest:                  .short 6

.org 510
.word 0xaa55
