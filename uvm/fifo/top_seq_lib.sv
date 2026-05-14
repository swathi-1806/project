/this only contains virtual sequences
class fifo_wr_rd_virtual_seq extends uvm_sequence;

fifo_wr_seq wr_seq;
fifo_rd_seq rd_seq;

`uvm_object_utils(fifo_wr_rd_virtual_seq)
`NEW_OBJ

`uvm_declare_p_sequencer(virtual_sqr)

task body();
	//wr_seq.wr_count = 10;
	//rd_seq.rd_count = 10;
`uvm_do_on_with(wr_seq, p_sequencer.wr_sqr_h, { wr_count == 10; })
`uvm_do_on_with(rd_seq, p_sequencer.rd_sqr_h, { rd_count == 10; })
	
endtask
endclass

//Write 5 → Read 3 → Write 7 → Read 9 → Write & Read parallel
class fifo_complex_v_seq extends uvm_sequence;
  `uvm_object_utils(fifo_complex_v_seq)
  `NEW_OBJ

  fifo_wr_seq  wr_seq;
  fifo_rd_seq  rd_seq;

  `uvm_declare_p_sequencer(virtual_sqr)

  task body();

    wr_seq = fifo_wr_seq::type_id::create("wr_seq");
    rd_seq = fifo_rd_seq::type_id::create("rd_seq");

    //-----------------------------------------
    // Write 5
    //-----------------------------------------
  
    wr_seq.wr_count = 5;
    wr_seq.start(p_sequencer.wr_sqr_h);

    //-----------------------------------------
    // Read 3
    //-----------------------------------------
    
    rd_seq.rd_count = 3;
    rd_seq.start(p_sequencer.rd_sqr_h);

    //-----------------------------------------
    // Write 7
    //-----------------------------------------
   
    wr_seq.wr_count = 7;
    wr_seq.start(p_sequencer.wr_sqr_h);

    //-----------------------------------------
    // Read 9
    //-----------------------------------------
    
    rd_seq.rd_count = 9;
    rd_seq.start(p_sequencer.rd_sqr_h);

    //-----------------------------------------
    // Parallel Write & Read
    //-----------------------------------------
   
    fork
      begin
        wr_seq.wr_count = 10;
        wr_seq.start(p_sequencer.wr_sqr_h);
      end
      begin
        rd_seq.rd_count = 10;
        rd_seq.start(p_sequencer.rd_sqr_h);
      end
    join

  endtask

endclass

