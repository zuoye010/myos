.macro          EnableA20       
                pushw    %ax
                inb      $0x92,%al
                orb      $0x2,%al
                outb     %al,$0x92
                popw     %ax
.endm

.macro          DisableA20
                pushw    %ax
                inb      $0x92,%al
                andb     $0x0fd,%al
                outb     %al,$0x92
                popw     %ax
.endm

.macro          Jump16  Selector,Offset
                .byte      0x0ea     
                .word      \Offset   
                .word      \Selector 
.endm

.macro          Jump32  Selector,Offset
                .byte      0x0ea     
                .word        \OFFSET
                .word       0
                .word      \Selector 
.endm

.macro          CALL16  Selector,Offset
                .byte      0x9a      
                .word      \Offset   
                .word      \Selector 
.endm

.macro          CALL32  Selector,Offset
                .byte      0x9a      
                .word      \Offset
                .word      0
                .word      \Selector 
.endm

.equ                descSize,           0x08
.equ                desc.limitL,        0x00
.equ                desc.baseL,         0x02
.equ                desc.baseM,         0x04
.equ                desc.attrib,        0x05
.equ                desc.limitH,        0x06
.equ                desc.baseH,         0x07

.equ                gateSize,           0x08
.equ                gate.offsetL,       0x00
.equ                gate.selector,      0x02
.equ                gate.dCount,        0x04
.equ                gate.gType,         0x05
.equ                gate.offsetH,       0x06

.equ                pDescSize,          0x06
.equ                pDesc.limit,        0x00
.equ                pDesc.base,         0x02

.equ                tssSize,        0x66
.equ                tss.trLink,     0x00
.equ                tss.trEsp0,     0x04
.equ                tss.trSs0,      0x08
.equ                tss.trEsp1,     0x0c
.equ                tss.trSs1,      0x10
.equ                tss.trEsp2,     0x14
.equ                tss.trSs2,      0x18
.equ                tss.trCr3,      0x1c
.equ                tss.trEip,      0x20
.equ                tss.trEflag,    0x24
.equ                tss.trEax,      0x28
.equ                tss.trEcx,      0x2c
.equ                tss.trEdx,      0x30
.equ                tss.trEbx,      0x34
.equ                tss.trEsp,      0x38
.equ                tss.trEbp,      0x3c
.equ                tss.trEsi,      0x40
.equ                tss.trEdi,      0x44
.equ                tss.trEs,       0x48
.equ                tss.trCs,       0x4c
.equ                tss.trSs,       0x50
.equ                tss.trDs,       0x54
.equ                tss.trFs,       0x58
.equ                tss.trGs,       0x5c
.equ                tss.trLdtr,     0x60
.equ                tss.trTrip,     0x64
.equ                tss.trIoMap,    0x66


.equ            ATDR,           0x90 
.equ            ATDW,           0x92 
.equ            ATDWA,          0x93 
.equ            ATCE,           0x98 
.equ            ATCER,          0x9a 
.equ            ATCCO,          0x9c 
.equ            ATCCOR,         0x9e 

.equ            ATLDT,          0x82 
.equ            ATTaskGate,     0x85 
.equ            AT386TSS,       0x89 
.equ            AT386CGate,     0x8c 
.equ            AT386IGate,     0x8e 
.equ            AT386TGate,     0x8f 

.equ            DPL0,           0x00 
.equ            DPL1,           0x20 
.equ            DPL2,           0x40 
.equ            DPL3,           0x60 

.equ            RPL0,           0x00 
.equ            RPL1,           0x01 
.equ            RPL2,           0x02 
.equ            RPL3,           0x03 

.equ            IOPL0,          0x0000 
.equ            IOPL1,          0x1000 
.equ            IOPL2,          0x2000 
.equ            IOPL3,          0x3000 

.equ            D32,            0x40       
.equ            GL,             0x80       
.equ            TIL,            0x04       
.equ            VMFL,           0x00020000 
.equ            VMFLW,          0x0002
.equ            IFL,            0x00000200 
.equ            RFL,            0x00010000 
.equ            RFLW,           0x0001
.equ            NTL,            0x00004000 

.equ            PL,             0x1     
.equ            RWR,            0x0     
.equ            RWW,            0x2     
.equ            USS,            0x0     
.equ            USU,            0x4     
