class fifo_tx extends uvm_sequence_item;

 rand bit wr_en, rd_en;
 rand bit [11:0] data;
 rand bit [3:0]wr_dly;
 rand bit [3:0]rd_dly;

`uvm_object_utils_begin(fifo_tx)
	`uvm_field_int(data,UVM_ALL_ON)
	`uvm_field_int(wr_en,UVM_ALL_ON)
	`uvm_field_int(rd_en,UVM_ALL_ON)
`uvm_object_utils_end

`NEW_OBJ

constraint dly_c{
	soft wr_dly == 0;
	soft rd_dly == 0;
}

endclass
