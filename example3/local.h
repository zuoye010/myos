.equ        dataLen,            16
.equ        gdtLen,             32
.equ        ldtLen,             48
.equ        stackLen,           255

.equ        ldtNum,             6

.equ        normalSel,          8
.equ        codeKSel,           16
.equ        ldtSel,             24

.equ        codeLSel,           0+TIL
.equ        codeCSel,           8+TIL
.equ        videoSel,           16+TIL
.equ        toLdtSel,           24+TIL
.equ        mDataSel,           32+TIL
.equ        stacksSel,          40+TIL

.equ        bufferAddress,      $0x7
.equ        dispMsgAddress,     $0x0
.equ        hToAsciiAddress,    $0x1e
.equ        vir3Address,        $0x14
.equ        vir2Address,        $0x0
.equ        vir1Address,        $0x0

.equ        kernelSeg,          0x2040
.equ        real,               0xaa
