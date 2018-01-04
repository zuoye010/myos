.include "/home/xx/myos/include/386scd.h"

.code32
.section .text

gpBegin:
xor         %edi,%edi
movl        $0,%ebx
movl        %ds:76(,%ebx,1),%edx        #testTss.cs to edx
call        echoEdx

movw        $0x17,%dx
shlw        $8,%dx
addw        $0x3a,%dx                   # 0x4a == ':'
movw        %dx,%ax
stosw
movl        %ds:32(,%ebx,1),%edx        #testTss.eip to edx
call        echoEdx

movl        $0x1234567,%ecx             #delay some times
conShow:
loop        conShow

movl        $0,%ebx
movw        $0x18,%ax                   #demoTssSel
movw        %ax,%fs:0(,%ebx,1)
add         $4,%esp

iret

jmp         gpBegin

echoEdx:
movb        $0x17,%ah
movl        $8,%ecx
echoEdx1:
rol         $4,%edx
movb        %dl,%al
call        hToAscii
stosw
loop        echoEdx1
ret

hToAscii:           
pushw       %bx
andb        $0x0f,%al
movb        %al,%bl
addb        $0x30,%al
cmpb        $0x9,%bl
popw        %bx
jb          Next
addb        $0x07,%al
Next:
ret
.org 512
