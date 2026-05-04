`timescale 1ns/1ps
//`include "uvm_pkg.sv"
import uvm_pkg::*;
//just for eda
`include "uvm_macros.svh"

//files
`include "common.sv"
`include "memory.v"

`include "mem_interface.sv"

`include "mem_tx.sv"
`include "mem_base_seq.sv"
`include "mem_one_wr_one_rd_seq.sv"

`include "mem_mon.sv"
`include "mem_drv.sv"
`include "mem_sqr.sv"
`include "mem_cov.sv"

`include "mem_agent.sv"
`include "mem_sbd.sv"

`include "mem_env.sv"

`include "mem_test_lib.sv"
`include "mem_one_wr_one_rd_test.sv"


//1. clk and rst declaration
//2. clk and rst generation
//3. interface instantiation
//4. dut instantiation
//5. assertion instantiation
//6. pass the interface handle to drv and mon
//7. call the run_test method

module tb;
//import uvm_pkg::*;  
bit clk,rst;

//clk generation
initial clk = 0;
always #5 clk= ~clk;

//interface instantiation
mem_interface pif(clk,rst);


//apply and relaese rst
initial begin
	rst = 1;
	//rst the dut inputs
	pif.addr =0;
	pif.wdata =0;
	pif.wr_rd =0;
	pif.valid =0;
	repeat(2)@(posedge clk);
	rst = 0;
end

//dut instantiation
memory dut(.clk(pif.clk),
		   .rst(pif.rst),
		   .wr_rd(pif.wr_rd),
		   .addr(pif.addr),
		   .wdata(pif.wdata),
		   .rdata(pif.rdata),
		   .valid(pif.valid),
		   .ready(pif.ready)
		   );

//assertion instantiation

//pass the interface handle to drv and mon
initial begin
	uvm_config_db#(virtual mem_interface)::set(null,
												"*.agt_h.*",
												"MEM_PIF",
												pif);
end


//call the run_test
initial begin
  run_test("mem_one_wr_one_rd_test");//UVM_TB EXECUTION STARTS
end

//waveform
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0, tb);   // tb = your top module name
end

endmodule






