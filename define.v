// ***** global define *****
`define RstEnable 1'b1 //enable reset signal
`define RstDiable 1'b0 //disable reset signal
`define ZeroWord 32'h00000000 //set 32-bits zero
`define WriteEnable 1'b1 //enable write
`define WriteDisable 1'b0 //disable write
`define ReadEnable 1'b1 //enable read
`define ReadDisable 1'b0 //diable read
`define AluOpBus 7:0 //length of operation code in instruction decode
`define AluSelBus 2:0 //length of selection code in instruction decode
`define InstValid 1'b0 //instruction valid
`define InstInvalid 1'b1 //instruction invalid
`define True_v 1'b1 //true logic
`define False_v 1'b0 //false logic
`define ChipEnable 1'b1
`define ChipDisable 1'b0

// ori
`define EXE_ORI 6'b001101
`define EXE_NOP 6'b000000

//AluOp
`define EXE_OR_OP 8'b00100101
`define EXE_NOP_OP 8'b00000000

//AluSel
`define EXE_RES_LOGIC 3'b001
`define EXE_RES_NOP 3'b000

// ***** ROM *****
`define InstAddrBus 31:0 //length of address
`define InstBus 31:0
`define InstMemNun 131071 //size of ROM is 128KB
`define InstMemNunLog2 17

// ***** Regfile *****
`define RegAddrBus 4:0 //length of address of Regfile
`define RegBus 31:0 //length of Regfile
`define RegWidth 32
`define DoubleRegWidth 64
`define DoubleRegBus 63:0
`define RegNum 32 //number of register
`define RegNumLog2 5
`define NOPRegAddr 5'b00000