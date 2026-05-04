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

