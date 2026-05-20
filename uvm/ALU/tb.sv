//https://www.edaplayground.com/x/FYh7
//`include "uvm_pkg.sv"
import uvm_pkg::*;
`include "uvm_macros.svh"

//files
`include "common.sv"
`include "alu.v"

`include "alu_interface.sv"

`include "alu_tx.sv"
`include "alu_seq.sv"

`include "alu_mon.sv"
`include "alu_drv.sv"
`include "alu_sqr.sv"
//`include "alu_cov.sv"

`include "alu_agent.sv"
`include "alu_sbd.sv"

`include "alu_env.sv"

`include "alu_test.sv"

module tb;
logic clk;

initial clk=0;
always #5 clk = ~clk;

alu_interface vif(clk);

//dut
alu_4bit dut (.a(vif.a),
			  .b(vif.b),
   			  .opcode(vif.opcode),
              .result(vif.result));

//run_test
initial begin
  uvm_config_db #(virtual alu_interface)::set(null, "*", "vif", vif);
	run_test("alu_test");
end

//waveform
initial begin
  $dumpfile("dump.vcd");
  $dumpvars(0,tb);   // tb = your top module name
end

endmodule


