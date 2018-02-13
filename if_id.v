/*
port*****bit*****input/output*****function
rst      1       input            reset signal
clk      1       input            clock signal
if_pc    32      input            address of the instruction
if_inst  32      input            fetched instruction
id_pc    32      output           address of the instruction
id_inst  32      output           instruction for decoding
*/
`include "define.v"

module if_id(
	input wire clk,
	input wire rst,
	// fetching address and InstBus is 32 bits
	input wire[`InstAddrBus] if_pc,
	input wire[`InstBus] if_inst,
	// decoding
	output reg[`InstAddrBus] id_pc,
	output reg[`InstBus] id_inst
);

	always @ (posedge clk) begin
		if (rst == `RstEnable) begin
			id_pc <= `ZeroWord;
			id_inst <= `ZeroWord;
		end else begin
			id_pc <= if_pc;
			id_inst <= if_inst;
		end
	end
	
endmodule
