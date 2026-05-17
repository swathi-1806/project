interface mem_interface(input reg clk,rst);
	bit wr_rd;
	bit [`ADDR_WIDTH-1:0]addr;
	bit [`WIDTH-1:0]wdata;
	bit [`WIDTH-1:0]rdata;
	bit valid,ready;

	
	 clocking bfm_cb @(posedge clk);
	 	default input #0 output #1;
		input ready,rdata;//bfm inputs
		output wr_rd,addr,wdata,valid;//bfm outputs		
	endclocking   
	
	 clocking mon_cb @(posedge clk);
		default input  #1;
		input wr_rd,addr,wdata,rdata,valid,ready;
	endclocking

endinterface
