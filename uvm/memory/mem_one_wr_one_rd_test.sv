class mem_one_wr_one_rd_test extends mem_base_test;
  `uvm_component_utils(mem_one_wr_one_rd_test)
	`NEW_COMP

task run_phase(uvm_phase phase);
	//create and instantiate the seq
	mem_one_wr_one_rd_seq seq_h = mem_one_wr_one_rd_seq::type_id::create("seq_h");
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


endclass
