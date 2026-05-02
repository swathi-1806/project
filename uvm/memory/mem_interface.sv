interface mem_interface (logic clk,rst);
//ports
logic wr_rd;
logic valid;
logic [`ADDR_WIDTH-1:0]addr;
logic [`WIDTH-1:0]wdata;
logic ready;
logic [`WIDTH-1:0]rdata;

//clocking bloks
//for drv
clocking drv_cb@(posedge clk);
	default input #1 output #0;
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
