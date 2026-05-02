class mem_one_wr_one_rd_seq extends mem_base_seq;
`uvm_object_utils(mem_one_wr_one_rd_seq);
`NEW_OBJ

task pre_body();
	`uvm_info("seq","pre_body",UVM_NONE)
endtask

task body();
	mem_tx req_wr;
	mem_tx req_rd;

	`uvm_do_with(req_wr, {req_wr.wr_rd == 1};)
	`uvm_do_with(req_rd ,{req_rd.wr_rd == 0};)
endtask

task post_body();
	`uvm_info("seq","post_body",UVM_NONE)
endtask

endclass
