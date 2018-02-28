`include "C:/Users/YU-WEI/Desktop/DigitalDesignLab/mips32/define.v"

module inst_rom (
	input wire ce,
	input wire[`InstAddrBus] addr,
	output reg[`InstBus] inst
);

	// define a array size: InstMemNum length: InstBus
	reg[`InstBus] inst_mem[0:`InstMemNum-1];
	
	// use inst_rom.data to initial
	initial $readmemh ( "inst_rom.data", inst_mem);
	
	// when reset signal is invalid
	always @ (*) begin
		if (ce == `ChipDisable) begin
			inst <= `ZeroWord;
		end else begin
			inst <= inst_mem[addr[`InstMemNumLog2+1:2]];
		end
	end
	
endmodule