module mem_assert(clk,rst,wr_rd,addr,wdata,rdata,valid,ready);
input clk,rst,wr_rd,valid,ready;
input ['ADDR_WIDTH-1:0]addr;
input ['WIDTH-1:0]wdata,rdata;

property rst_high;
	@(posedge clk)(rst==1)|->(wr_rd==0 && addr==0 && wdata==0 && radat==0 && valid==0 && ready==0);
endproperty
RESET_LOW:assert property(rst_high);

property rst_low;
	@(posedge clk)(rst==0) |-> (!($isunknown(wr_rd)) &&
								!($isunknown(addr)) &&
								!($isunknown(wdata)) &&
								!($isunknown(rdata)) &&
								!($isunknown(valid)) &&
								!($isunknown(ready)));
endproperty
RESET_HIGH:assert property(rst_low);

property hand_shaking;
	@(posedge clk)(valid==1) |=>(ready==1);
endproperty
HAND_SHAKING:assert property(hand_shaking);

property writes;
	@(posedge clk)(wr_rd==1)|->(!($isunknown(addr))) &&
							   (!($isunknown(wdata)));
endproperty
WRITES:assert property(writes);

property reads;
	@(posedge clk)(wr_rd==0)|->(!($isunknown(addr))) &&
							   (!($isunknown(rdata)));
endproperty
READS:assert property(reads);

endmodule





