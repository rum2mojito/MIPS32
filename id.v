/*
*/
`include "define.v"

module id(
	input wire rst,
	input wire[`InstAddrBus] pc_i,
	input wire[`InstBus] inst_i,
	
	// read the value of Regfile
	input wire[`RegBus] reg1_data_i,
	input wire[`RegBus] reg2_data_i,
	
	// output to Regfile
	output reg reg1_read_o,
	output reg reg2_read_o,
	output reg[`RegAddrBus] reg1_addr_o,
	output reg[`RegAddrBus] reg2_addr_o,
	
	// output to execusion
	output reg[`AluOpBus] aluop_o,
	output reg[`AluSelBus] alusel_o,
	output reg[`RegBus] reg1_o,
	output reg[`RegBus] reg2_o,
	output reg[`RegAddrBus] wd_o,
	output reg wreg_o	
);

	// get function code and operation code
	// decide by instruction in (inst_i)
	wire[5:0] op = inst_i[31:26];
	wire[4:0] op2 = inst_i[10:6];
	wire[5:0] op3 = inst_i[5:0];
	wire[4:0] op4 = inst_i[20:16];
	
	// immediate number to save instruction
	reg[`RegBus] imm;
	
	// save instruction is valid or not
	reg instvalid;
	
	// step 1: decode the instruction
	always @ (*) begin
		if (rst == `RstEnable) begin
			aluop_o <= `EXE_NOP_OP;
			alusel_o <= `EXE_RES_NOP;
			wreg_o <= `WriteDisable;
			wd_o <= `NOPRegAddr;
			instvalid <= `InstValid;
			reg1_read_o <= 1'b0;
			reg2_read_o <= 1'b0;
			reg1_addr_o <= `NOPRegAddr;
			reg2_addr_o <= `NOPRegAddr;
			imm <= 32'h0;
		end else begin
			aluop_o <= `EXE_NOP_OP;
			alusel_o <= `EXE_RES_NOP;
			wd_o <= inst_i[15:11];
			wreg_o <= `WriteDisable;
			instvalid <= `InstInvalid;
			reg1_read_o <= 1'b0;
			reg2_read_o <= 1'b0;
			reg1_addr_o <= inst_i[25:21]; // read the register's address of port1
			reg2_addr_o <= inst_i[20:16]; // read the register's address of port2
			imm <= `ZeroWord;
			
			case (op)
				`EXE_ORI: begin //decide whthere op code is ori's instruction or not
				
				// ori's instruction needs to write into the destinate register
				wreg_o <= `WriteEnable;
				
				// operation is OR
				aluop_o <= `EXE_OR_OP;
				alusel_o <= `EXE_RES_LOGIC;
				
				// need to read the register1 via Regfile's port1
				reg1_read_o <= 1'b1;
				
				// do not read the register2 via Regfile's port2
				reg2_read_o <= 1'b0;
				
				// need immediate number
				imm <= {16'h0, inst_i[15:0]};
				
				// ori's instruction is valid
				instvalid <= `InstValid;
				
				end
				default:begin
				end
			endcase // case op
		end // if
	end // always

	// step 2: decide times of operate 1
	always @ (*) begin
		if (rst == `RstEnable) begin
			reg1_o <= `ZeroWord;
		end else if (reg1_read_o == 1'b1) begin
			reg1_o <= reg1_data_i;
		end else if (reg1_read_o == 1'b0) begin
			reg1_o <= imm;
		end else begin
			reg1_o <= `ZeroWord;
		end
	end
	
	// step 3: decide times of operate 2
	always @ (*) begin
		if (rst == `RstEnable) begin
			reg2_o <= `ZeroWord;
		end else if (reg2_read_o == 1'b1) begin
			reg2_o <= reg2_data_i;
		end else if (reg2_read_o == 1'b0) begin
			reg2_o <= imm;
		end else begin
			reg2_o <= `ZeroWord;
		end
	end
	
endmodule
