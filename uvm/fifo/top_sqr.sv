class virtual_sqr extends uvm_sequencer;
fifo_wr_sqr wr_sqr_h;
fifo_rd_sqr rd_sqr_h;

`uvm_component_utils(virtual_sqr)
`NEW_COMP

//do not allocate memory for wr_sqr_h and rd_sqr_h 

endclass
