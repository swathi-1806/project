class mem_base_seq extends uvm_sequence#(mem_tx);
`uvm_object_utils(mem_base_seq);
`NEW_OBJ
mem_tx req;

task pre_body();
endtask

task body();
//	`uvm_do(req)
endtask

task post_body();
endtask

endclass

//1WR
class mem_wr_seq extends mem_base_seq;
  `uvm_object_utils(mem_wr_seq)
  `NEW_OBJ
  
  // number of writes you want to perform
  int wr_count = 10;

  task body();
    mem_tx req;

    repeat (wr_count) begin
      req = mem_tx::type_id::create("req");

      start_item(req);

    	  // Randomize for WRITE operation
	      assert(req.randomize() with {wr_rd == 1;});
      finish_item(req);
       //store written address
      addr_mb.put(req.addr);
    end
  endtask
endclass
//================================================================

//RD
class mem_rd_seq extends mem_base_seq;
  `uvm_object_utils(mem_rd_seq)
	`NEW_OBJ
  // number of writes you want to perform
  int rd_count = 10;
  bit [`ADDR_WIDTH-1:0] rd_addr;

   task body();
    mem_tx req;

     repeat (rd_count) begin

      //Get only written address
      addr_mb.get(rd_addr);

      req = mem_tx::type_id::create("req");

      start_item(req);
      req.wr_rd = 0;
      req.addr  = rd_addr;
      finish_item(req);

	  /*
	  - if we want to retrive from same addr where writes are done 
	  - then we should not randomize read operation
      // Randomize for read operation
      assert(req.randomize() with {wr_rd == 0;});
	  - instead of it we have assign the same addr
      */
		
    end
  endtask
endclass

//================================================================
//1WR_1RD--ANOTHER METHOD
class mem_1_wr_1_rd_seq extends mem_base_seq;
`uvm_object_utils(mem_1_wr_1_rd_seq);

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
//================================================================================

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
	void'(this.randomize());
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

