`include "define.v"

module mips32 (
	input wire clk,
	input wire rst,
	
	input wire[`RegBus] rom_data_i,
	output wire[`RegBus] rom_data_o,
	output wire rom_ce_o
);

	// connect IF/ID with ID
	wire[`InstAddrBus] pc;
	wire[`InstAddrBus] id_pc_i;
	wire[`InstBus] id_inst_i;
	
	// connect ID with ID/EX
	wire[`AluOpBus] id_aluop_o;
	wire[`AluSelBus] id_alusel_o;
	wire[`RegBus] id_reg1_o;
	wire[`RegBus] id_reg2_o;
	wire id_wreg_o;
	wire[`RegAddrBus] id_wd_o;
	
	// connect ID/EX with EX
	wire[`AluOpBus] ex_aluop_i;
	wire[`AluSelBus] ex_alusel_i;
	wire[`RegBus] ex_reg1_i;
	wire[`RegBus] ex_reg2_i;
	wire ex_wreg_i;
	wire[`RegAddrBus] ex_wd_i;
	
	// connect EX with EX/MEM
	wire ex_wreg_o;
	wire[`RegAddrBus] ex_wd_o;
	wire[`RegBus] mem_wdata_o;
	
	// connect EX/MEM with MEM
	wire mem_wreg_i;
	wire[`RegAddrBus] mem_wd_i;
	wire[`RegBus] mem_wdata_i;
	
	// connect MEM with MEM/WB
	wire mem_wreg_o;
	wire[`RegAddrBus] wb_wd_i;
	wire[`RegBus] wb_wdata_i;
	
	// connect ID with Regfile
	wire reg1_read;
	wire reg2_read;
	wire[`RegBus] reg1_data;
	wire[`RegBus] reg2_data;
	wire[`RegAddrBus] reg1_addr;
	wire[`RegAddrBus] reg2_addr;
	
	// pc_reg initial
	pc_reg pc_reg0 (
		.clk(clk), .rst(rst), .pc(pc), .ce(rom_ce_o)
	);
	
	assign rom_addr_o = pc; // save the value of PC
	
	// IF/ID initial
	if_id if_id0 (
		.clk(clk), .rst(rst), .if_pc(pc),
		.if_inst(rom_data_i), .id_pc(id_pc_i),
		.id_inst(id_inst_i)
	);
	
	// ID initial
	id id0 (
		.rst(rst), .pc_i(id_pc_i), .inst_i(id_inst_i),
		
		// input from regfile
		.reg1_data_i(reg1_data), .reg2_data_i(reg2_data),
		
		// messege sended to regfile
		.reg1_read_o(reg1_read), .reg2_read_o(reg2_read),
		.reg1_addr_o(reg1_addr), .reg2_addr_o(reg2_addr),
		
		// sending to ID/EX
		.aluop_o(id_aluop_o), .alusel_o(id_alusel_o),
		.reg1_o(id_reg1_o), .reg2_o(id_reg2_o),
		.wd_o(id_wd_o), .wreg_o(id_wreg_o)
	);
	
	// regfile initial
	regfile regfile1 (
		.clk(clk), .rst(rst),
		.we(wb_wreg_i), .waddr(wb_wd_i),
		.wdata(wb_wdata_i), .re1(reg1_data),
		.raddr1(reg1_addr), .rdata1(reg1_data),
		.re2(reg2_read), .raddr2(reg2_addr),
		.rdata2(reg2_data)
	);
	
	// ID/EX initial
	id_ex id_ex0 (
		.clk(clk), .rst(rst),
		
		// messege from ID
		.id_aluop(id_aluop_o), .id_alusel(id_alusel_o),
		.id_reg1(id_reg1_o), .id_reg2(id_reg2_o),
		.id_wd(id_wd_o), .id_wreg(id_wreg_o),
		
		// sending to EX
		.ex_aluop(ex_aluop_i), .ex_alusel(ex_alusel_i),
		.ex_reg1(ex_reg1_i), .ex_reg2(ex_reg2_i),
		.ex_wd(ex_wd_i), .ex_wreg(ex_wreg_i)
	);
	
	// EX initial
	ex ex0 (
		.rst(rst),
		
		// messege from ID/EX
		.aluop_i(ex_aluop_i), .alusel_i(ex_alusel_i),
		.reg1_i(ex_reg1_i), .reg2_i(ex_reg2_i),
		.wd_i(ex_wd_i), .wreg_i(ex_wreg_i),
		
		// sending to EX/MEM
		.wd_o(ex_wd_o), .wreg_o(ex_wreg_o),
		.wdata_o(ex_wdata_o)
	);
	
	// EX/MEM initial
	ex_mem ex_mem0 (
		.clk(clk), .rst(rst),
		
		// messege from EX
		.ex_wd(ex_wd_o), .ex_wreg(ex_wreg_o),
		.ex_wdata(ex_wdata_o),
		
		// sending to MEM
		.mem_wd(mem_wd_i), .mem_wreg(mem_wreg_i),
		.mem_wdata(mem_wdata_i)
	);
	
	// MEM initial
	mem mem0 (
		.rst(rst),
		
		// messege from EX/MEM
		.wd_i(mem_wd_i), .wreg_i(mem_wreg_i),
		.wdata_i(mem_wdata_i),
		
		// sending to MEM/WB
		.wd_o(mem_wd_o), .wreg_o(mem_wreg_o),
		.wdata_o(mem_wdata_o)
	);
	
	// MEM/WB initial
	mem_wb mem_wb0 (
		.clk(clk), .rst(rst),
		
		// messege from MEM
		.mem_wd(mem_wd_o), .mem_wreg(mem_wreg_o),
		.mem_wdata(mem_wdata_o),
		
		// sending to write
		.wb_wd(wb_wd_i), .wb_wreg(wb_wreg_i),
		.wb_wdata(wb_wdata_i)
	);
	
endmodule