/*
port*****bit*****input/output*****function
rst      1       input            reset signal
clk      1       input            clock signal
pc       32      output           fetching the address
ce       1       output           enable register of program counter
*/
`include "define.v"

module pc_reg (
	input wire clk, //clock signal
	input wire rst, //reset signal
	
	output reg[`InstAddrBus] pc, //program counter
	output reg ce // !!!???
);

	always @ (posedge clk) begin
		if (rst == `RstEnable) begin
			ce <= `ChipDisable;
		end else begin
			ce <= `ChipEnable;
		end
	end
	
	always @ (posedge clk) begin
		if (ce == `ChipDisable) begin
			pc <= 32'h00000000;
		end else begin
			pc <= pc + 4'h4;
		end
	end
	
endmodule			
