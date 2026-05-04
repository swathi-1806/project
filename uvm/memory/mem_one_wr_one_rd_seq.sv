class mem_one_wr_one_rd_seq extends mem_base_seq;
`uvm_object_utils(mem_one_wr_one_rd_seq);

mem_tx tx_t;
`NEW_OBJ

task pre_body();
	`uvm_info("seq","pre_body",UVM_NONE)
endtask

task body();
	mem_tx req_wr;
	mem_tx req_rd;
	 bit [`ADDR_WIDTH-1:0] saved_addr;

	`uvm_do_with(req_wr, {req_wr.wr_rd == 1;})
	 saved_addr = req_wr.addr;
	`uvm_do_with(req_rd ,{req_rd.wr_rd == 0;
						  req_rd.addr== saved_addr;})

endtask

task post_body();
	`uvm_info("seq","post_body",UVM_NONE)
endtask

endclass

