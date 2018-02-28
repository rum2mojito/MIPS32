`include "C:/Users/YU-WEI/Desktop/DigitalDesignLab/mips32/define.v"

`timescale 1ns/1ps

module mips32_min_sopc_tb ();

	reg CLOCK_50;
	reg rst;
	
	initial begin
		CLOCK_50 = 1'b0;
		forever #10 CLOCK_50 = ~CLOCK_50;
	end
	
	initial begin
		rst = `RstEnable;
		#195 rst = `RstDisable;
		#1000 $stop;
	end
	
	mips32_min_sopc mips32_min_sopc_0 (
		.clk(CLOCK_50),
		.rst(rst)
	);
	
endmodule