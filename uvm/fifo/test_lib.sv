//base test

class fifo_base_test extends uvm_test;
`uvm_component_utils(fifo_base_test)
fifo_env env_h;
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	env_h = fifo_env::type_id::create("env_h",this);
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction

endclass

//functional test
class fifo_wr_rd_test extends fifo_base_test;
`uvm_component_utils(fifo_wr_rd_test)
`NEW_COMP

fifo_wr_seq wr_seq=new("wr_seq");
fifo_rd_seq rd_seq=new("rd_seq");

task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  phase.phase_done.set_drain_time(this,100);
	wr_seq.wr_count = 10;
    wr_seq.start(env_h.wr_agt_h.wr_sqr_h);
	rd_seq.rd_count = 10;
    rd_seq.start(env_h.rd_agt_h.rd_sqr_h);
  phase.drop_objection(this);
endtask
endclass

class fifo_underflow_test extends fifo_base_test;
`uvm_component_utils(fifo_underflow_test)
`NEW_COMP

fifo_wr_seq wr_seq=new("wr_seq");
fifo_rd_seq rd_seq=new("rd_seq");

task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  phase.phase_done.set_drain_time(this,100);
	wr_seq.wr_count = 10;
    wr_seq.start(env_h.wr_agt_h.wr_sqr_h);
	rd_seq.rd_count = wr_seq.wr_count + 1;
    rd_seq.start(env_h.rd_agt_h.rd_sqr_h);
  phase.drop_objection(this);
endtask
endclass

class fifo_overflow_test extends fifo_base_test;
`uvm_component_utils(fifo_overflow_test)
`NEW_COMP

fifo_wr_seq wr_seq=new("wr_seq");
fifo_rd_seq rd_seq=new("rd_seq");

task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  phase.phase_done.set_drain_time(this,100);
	wr_seq.wr_count = 16;
    wr_seq.start(env_h.wr_agt_h.wr_sqr_h);
	rd_seq.rd_count = 0;
    rd_seq.start(env_h.rd_agt_h.rd_sqr_h);
  phase.drop_objection(this);
endtask
endclass

//virtual seq
class fifo_wr_rd_v_test extends fifo_base_test;
fifo_wr_rd_virtual_seq wr_rd_seq = new("wr_rd_seq");
`uvm_component_utils(fifo_wr_rd_v_test)
`NEW_COMP


task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  phase.phase_done.set_drain_time(this,100);
    wr_rd_seq.start(env_h.v_sqr_h);
  phase.drop_objection(this);
endtask
endclass

//virtual sequence
class fifo_complex_v_test extends fifo_base_test;
  fifo_complex_v_seq wr_rd_seq = new("wr_rd_seq");
  `uvm_component_utils(fifo_complex_v_test)
`NEW_COMP

task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  phase.phase_done.set_drain_time(this,100);
    wr_rd_seq.start(env_h.v_sqr_h);
  phase.drop_objection(this);
endtask
endclass

class fifo_concurrent_wr_rd_test extends fifo_base_test;
`uvm_component_utils(fifo_concurrent_wr_rd_test)
`NEW_COMP

//for concurrent test only
fifo_wr_dly_seq wr_seq=new("wr_seq");
fifo_rd_dly_seq rd_seq=new("rd_seq");

task run_phase(uvm_phase phase);
  phase.raise_objection(this);
  phase.phase_done.set_drain_time(this,100);
	wr_seq.wr_count = 20;
	rd_seq.rd_count = 20;
	fork
    wr_seq.start(env_h.wr_agt_h.wr_sqr_h);
    rd_seq.start(env_h.rd_agt_h.rd_sqr_h);
	join
  phase.drop_objection(this);
endtask
  
endclass









