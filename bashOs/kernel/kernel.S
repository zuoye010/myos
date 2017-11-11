.code16
.text
movw    %cs,%ax
movw    %ax,%ds
movw    %ax,%es
movw    $0x9800,%ax
movw    %ax,%ss
movw    $0x100,%sp
movl    $0,%edi

movw    $0x1a0, %ax
pushl   %eax
movl    $0x1ad,%eax
movw    %ds:0(%eax,%edi,1),%cx
popl    %eax
movb    $2,%dh
call    dispMessage

movb    $3,%cl
movw    $0x2060,%ax
call    readToRam

pushw   %es
pushw   %cs
pushw   $0x3b
ljmp    $0x2060,$0

popw    %es
movw    %cs,%ax
movw    %ax,%ds
movl    $0,%edi
movw    $0x1af, %ax
pushl   %eax
movl    $0x1bf,%eax
movw    %ds:0(%eax,%edi,1),%cx
popl    %eax
movb    $4,%dh
call    dispMessage

movb    $4,%cl
movw    $0x2060,%ax
call    readToRam

pushw   %es
pushw   %cs
pushw   $0x6d
ljmp    $0x2060,$0

pro2Ret:
popw    %es
movw    %cs,%ax
movw    %ax,%ds
movl    $0,%edi
movw    $0x1c1,%ax
pushl   %eax
movl    $0x1d1,%eax
movw    %ds:0(%eax,%edi,1),%cx
popl    %eax
movb    $6,%dh
call    dispMessage

movw    $0x1d3, %ax
pushl   %eax
movl    $0x1e1,%eax
movw    %ds:0(%eax,%edi,1),%cx
popl    %eax
movb    $7,%dh
call    dispMessage

xx: jmp xx

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

kernelMessage:                  .ascii "Enter kernel!"
lenOfKernelMessage:             .short 13
program1:                       .ascii "Finish program1!"
lenOfProgram1:                   .short 16
program2:                       .ascii "Finish program2!"
lenOfProgram2:                   .short 16
finish:                       .ascii "Finish kernel!"
lenOfFinish:                   .short 14

.org 512
