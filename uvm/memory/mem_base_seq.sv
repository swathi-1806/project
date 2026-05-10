class mem_base_seq extends uvm_sequence#(mem_tx);
`uvm_object_utils(mem_base_seq);
`NEW_OBJ
mem_tx req;

task pre_body();
endtask

task body();
	`uvm_do(req)

endtask

task post_body();
endtask

endclass

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


//generate tx with addr for compleate DEPTH location of memory
//addr to be generated should be unique and random

class mem_full_wr_full_rd_seq extends mem_base_seq;
`uvm_object_utils(mem_full_wr_full_rd_seq);

mem_tx tx_t;

//declare a addr local th this seq
rand bit [`ADDR_WIDTH-1:0]addr_DA[];

//constraints
//1.size of the DA size
constraint addr_DA_size{
	addr_DA.size == 16;//16 is depth of memory
}

constraint addr_DA_unique{
	unique {addr_DA};
}

//2.UNIQUE VALIES od addr
`NEW_OBJ

task pre_body();
	`uvm_info("seq","pre_body",UVM_NONE)
	//randomize this propertys i.e addr
	this.randomize();
	`uvm_info("seq",$sformatf("RND_UNQ_ADDR =%p",this.addr_DA),UVM_NONE)
endtask

task body();
	//WR
	for(int i=0;i<`DEPTH; i++)begin
	//`uvm_do_with(req ,{inline_constraint_1;
						//inline_constraint_2;...})
		`uvm_do_with(req, {req.wr_rd == 1;
							req.addr == addr_DA[i];})
      
	end

	//RD
	for(int i=0;i<`DEPTH; i++)begin
	//`uvm_do_with(req ,{inline_constraint_1;
						//inline_constraint_2;...})
		`uvm_do_with(req, {req.wr_rd == 0;
							req.addr == addr_DA[i];
							req.wdata == 0;})
	end

endtask

task post_body();
	`uvm_info("seq","post_body",UVM_NONE)
endtask

endclass


