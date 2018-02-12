module pc_reg (
	input wire clk, //clock signal
	input wire rst, //reset signal
	
	output reg[5:0] pc, //program counter
	output reg ce // !!!???
);

	always @ (posedge clk) begin
		if (rst == 1'b0) begin
			ce <= 1'b0;
		end else begin
			ce <= 1'b1;
		end
	end
	
	always @ (posedge clk) begin
		if (ce == 1'b0) begin
			pc <= 6'h00;
		end else begin
			pc <= pc + 1'b1;
		end
	end
	
endmodule
				