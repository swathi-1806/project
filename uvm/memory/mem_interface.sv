interface mem_interface (input logic clk,input logic rst);
//ports
logic wr_rd;
logic valid;
logic [`ADDR_WIDTH-1:0]addr;
  logic [`DATA_WIDTH-1:0]wdata;
logic ready;
  logic [`DATA_WIDTH-1:0]rdata;

//clocking bloks
//for drv
clocking drv_cb@(posedge clk);
	default input #0 output #1;
	output wr_rd;
	output valid;
	output wdata;
	input rdata;
	output addr;
	input ready;
endclocking

//for monitor
clocking mon_cb@(posedge clk);
	default input #0;
	input wr_rd;
	input valid;
	input wdata;
	input rdata;
	input addr;
	input ready;
endclocking

endinterface


