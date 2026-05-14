//`include "uvm_pkg.sv"
import uvm_pkg::*;
`include "uvm_macros.svh"

`include "common.sv"
`include "async_fifo1.v"
`include "fifo_interface.sv"
`include "fifo_tx.sv"
`include "fifo_seq_lib.sv"

`include "fifo_wr_drv.sv"
`include "fifo_rd_drv.sv"
`include "fifo_wr_sqr.sv"
`include "fifo_rd_sqr.sv"
`include "fifo_wr_mon.sv"
`include "fifo_rd_mon.sv"

`include "fifo_wr_agent.sv"
`include "fifo_rd_agent.sv"

`include "top_sqr.sv"
`include "top_seq_lib.sv"

`include "fifo_env.sv"
`include "test_lib.sv"

module tb;

reg wr_clk,rd_clk,rst;

fifo_interface pif(wr_clk,rd_clk,rst);

	initial begin
		wr_clk =0;
		forever #5 wr_clk = ~wr_clk;
	end

	initial begin
		rd_clk =0;
		forever #7 rd_clk = ~rd_clk;
	end

	initial begin
		rst = 1;
		repeat(2)@(posedge wr_clk );
		rst = 0;
	end

	 async_fifo dut(
	 			.wr_clk(pif.wr_clk),
				.rd_clk(pif.rd_clk),
				.rst(pif.rst),
				.wr_en(pif.wr_en),
				.wdata(pif.wdata),
				.full(pif.full),
				.overflow(pif.overflow),
				.rd_en(pif.rd_en),
				.rdata(pif.rdata),
				.empty(pif.empty),
				.underflow(pif.underflow));


	initial begin
  uvm_config_db#(virtual fifo_interface)::set(
      null,        // from top
      "*",         // visible to all UVM components
      "vif",       // key name
      pif          // physical interface
  );

end
  initial begin
		run_test(" fifo_wr_rd_v_test");
	end

	initial begin
		$dumpfile("fifo.vcd");
		$dumpvars(0,tb);
	end
endmodule

