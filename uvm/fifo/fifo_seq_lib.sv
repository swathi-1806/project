class fifo_base_seq extends uvm_sequence #(fifo_tx);
uvm_phase phase;
`uvm_object_utils(fifo_base_seq)
`NEW_OBJ

task pre_body();
	phase = get_starting_phase();
	if(phase !=null)begin
		phase.raise_objection(this);
		phase.phase_done.set_drain_time(this,100);
	end
endtask

task post_body();
	phase = get_starting_phase();
	if(phase !=null)begin
		phase.drop_objection(this);
	end
endtask

endclass


class fifo_wr_seq extends fifo_base_seq;
rand int wr_count;
`uvm_object_utils(fifo_wr_seq)
`NEW_OBJ

task body();
  fifo_tx req;
  repeat(wr_count) begin
    req = fifo_tx::type_id::create("req");
    start_item(req);
    req.wr_en = 1;
    req.data  = $urandom;
    
   /* `uvm_info("WR_SEQ",
      $sformatf("Generated Write TX: data=%0h", req.data),
      UVM_LOW)*/
    
    finish_item(req);
  end
endtask
endclass


class fifo_rd_seq extends fifo_base_seq;
rand int rd_count;
`uvm_object_utils(fifo_rd_seq)
`NEW_OBJ

task body();
  fifo_tx req;
  repeat(rd_count) begin
    req = fifo_tx::type_id::create("req");
    start_item(req);
    req.rd_en = 1;
    finish_item(req);
  end
endtask
endclass


class fifo_wr_dly_seq extends fifo_base_seq;
rand int wr_count;
rand int rd_count;
`uvm_object_utils(fifo_wr_dly_seq)
`NEW_OBJ

task body();
  fifo_tx req;
  repeat(wr_count) begin   
   	`uvm_do_with(req , {req.wr_dly inside {[1:15]};})      
   end
endtask
endclass

class fifo_rd_dly_seq extends fifo_base_seq;
rand int wr_count;
 rand int rd_count;
`uvm_object_utils(fifo_rd_dly_seq)
`NEW_OBJ

task body();
  fifo_tx req;
  repeat(rd_count) begin   
   	`uvm_do_with(req , {req.rd_dly inside {[1:15]};})      
   end
endtask
endclass







