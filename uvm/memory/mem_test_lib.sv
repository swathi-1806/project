class mem_base_test extends uvm_test;
	`uvm_component_utils(mem_base_test)
	`NEW_COMP
	
//instatiation env
mem_env env_h;
  
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	env_h=mem_env::type_id::create("env_h",this);
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction

endclass

//==========================================================================================================================================

//MEM_1WR_1RD
class mem_1wr_1rd_test extends mem_base_test;
  `uvm_component_utils(mem_1wr_1rd_test);
`NEW_COMP

mem_wr_seq wr_seq_h;
mem_rd_seq rd_seq_h;


task run_phase(uvm_phase phase);
	

  phase.raise_objection(this);
 
 
  wr_seq_h = mem_wr_seq::type_id::create("wr_seq_h");
  rd_seq_h = mem_rd_seq::type_id::create("rd_seq_h");

  wr_seq_h.wr_count = 1;
  rd_seq_h.rd_count = 1;

  // Write first
  wr_seq_h.start(env_h.agt_h.sqr_h);

  // Then Read
  rd_seq_h.start(env_h.agt_h.sqr_h);

  phase.drop_objection(this);
endtask

endclass


//==========================================================================================================================================

//MEM_5WR_5RD
class mem_5_wr_rd_test extends mem_base_test;
  `uvm_component_utils(mem_5_wr_rd_test);
`NEW_COMP

mem_wr_seq wr_seq_h;
mem_rd_seq rd_seq_h;


task run_phase(uvm_phase phase);

  
  phase.raise_objection(this); 

  wr_seq_h = mem_wr_seq::type_id::create("wr_seq_h");
  rd_seq_h = mem_rd_seq::type_id::create("rd_seq_h");

  wr_seq_h.wr_count = 5;
  rd_seq_h.rd_count = 5;

  // Write first
  wr_seq_h.start(env_h.agt_h.sqr_h);

  // Then Read
  rd_seq_h.start(env_h.agt_h.sqr_h);

  phase.drop_objection(this);
endtask
endclass

//1WR_1RD_1WR_1RD
class mem_1wr_1rd_1wr_1rd_test extends mem_base_test;
`uvm_component_utils(mem_1wr_1rd_1wr_1rd_test);
`NEW_COMP

mem_wr_seq wr_seq_h;
mem_rd_seq rd_seq_h;

  
task run_phase(uvm_phase phase);
	
	phase.raise_objection(this);
  
		// Repeat: 1 write -> 1 read -> 1 write -> 1 read  
		repeat(2)begin

  		wr_seq_h = mem_wr_seq::type_id::create("wr_seq_h");
 		rd_seq_h = mem_rd_seq::type_id::create("rd_seq_h");

 		wr_seq_h.wr_count = 1;
 		rd_seq_h.rd_count = 1;

  		// Write first
  		wr_seq_h.start(env_h.agt_h.sqr_h);

  		// Then Read(gets same address from mailbox)
  		rd_seq_h.start(env_h.agt_h.sqr_h);
  end

  phase.drop_objection(this);
endtask
endclass

//==========================================================================================================================================
//parallel wr_rd
class mem_parallel_wr_rd_test extends mem_base_test;
`uvm_component_utils(mem_parallel_wr_rd_test);
`NEW_COMP

mem_wr_seq wr_seq_h;
mem_rd_seq rd_seq_h;

task run_phase(uvm_phase phase);

  phase.raise_objection(this);

  wr_seq_h = mem_wr_seq::type_id::create("wr_seq_h");
  rd_seq_h = mem_rd_seq::type_id::create("rd_seq_h");

   wr_seq_h.wr_count = 10;
   rd_seq_h.rd_count = 10;


	 fork
  		begin
    		wr_seq_h.start(env_h.agt_h.sqr_h);
  		end
  		begin
    		rd_seq_h.start(env_h.agt_h.sqr_h);
  		end
	join

  phase.drop_objection(this);
endtask
endclass

//==========================================================================================================================================


//MEM_FULL_WR_FULL_RD
class mem_full_wr_full_rd_test extends mem_base_test;
  `uvm_component_utils(mem_full_wr_full_rd_test)
	`NEW_COMP
	int match_count;
	int miss_match_count;
	bit test_sts;

task run_phase(uvm_phase phase);
	//create and instantiate the seq
	mem_full_wr_full_rd_seq seq_h = mem_full_wr_full_rd_seq::type_id::create("seq_h");
	//raise objection
	phase.raise_objection(this);
	#20;
	//map the seq
	seq_h.start(env_h.agt_h.sqr_h);

	//drain time
	phase.phase_done.set_drain_time(this,100);
	#200;
	//drop objection
	phase.drop_objection(this);

endtask

function void extract_phase(uvm_phase phase);
	match_count =  env_h.sbd_h.match_count;
	miss_match_count = env_h.sbd_h.miss_match_count;
endfunction

function void check_phase(uvm_phase phase);
	if(`DEPTH == match_count && miss_match_count == 0)begin
		test_sts = 1;
	end
	else begin
		test_sts = 0;
	end
endfunction

function void report_phase(uvm_phase phase);
	if(test_sts == 1)begin
		`uvm_info("mem_full_wr_rd_test","####### test passed #######",UVM_NONE)
	end
	else begin
		`uvm_error("mem_full_wr_rd_test",$sformatf("match_count =%h  | miss_match_count = %h",match_count,miss_match_count))
		`uvm_error("mem_full_wr_rd_test","####### test failed ######")
	end
endfunction

endclass


