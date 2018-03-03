`include "C:/Users/YU-WEI/Desktop/DigitalDesignLab/mips32/define.v"
module if_id(
	input wire clk,
	input wire rst,
	input wire[5:0] stall,
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
		end else if (stall[1] == `Stop && stall[2] == `NoStop) begin
			id_pc <= `ZeroWord;
			id_inst <= `ZeroWord;
		end else if (stall[1] == `NoStop) begin
			id_pc <= if_pc;
			id_inst <= if_inst;
		end
	end
	
endmodule