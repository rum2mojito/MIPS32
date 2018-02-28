`include "define.v"

module mips32_min_sopc (
	input wire clk,
	input wire rst
);

	wire[`InstAddrBus] inst_addr;
	wire[`InstBus] inst;
	wire rom_ce;
	
	// initial MIPS32
	mips_32 mips32_0 (
		.clk(clk), 
		.rst(rst),
		
		.rom_addr_o(inst_addr), 
		.rom_data_i(inst),
		.rom_ce_o(rom_ce)
	);
	
	// initial instruction ROM
	inst_rom inst_rom0 (
		.addr(inst_addr), 
		.inst(inst),
		.ce(rom_ce)
	);
	
endmodule