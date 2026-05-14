class fifo_rd_drv extends uvm_driver #(fifo_tx);
  `uvm_component_utils(fifo_rd_drv)
  `NEW_COMP

  virtual fifo_interface vif;
  fifo_tx tx;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (uvm_config_db#(virtual fifo_interface)::get(this,
                                                    "", 
                                                    "vif", 
                                                     vif) == 0) begin
     `uvm_error("RD_DRV", "failed to retrive the virtual interface");
	end
  endfunction

  task run_phase(uvm_phase phase);
   vif.rd_en <= 0;
	wait (vif.rst == 0);

    forever begin
      seq_item_port.get_next_item(tx);
	  	tx.print();
		drive_tx(tx);
       seq_item_port.item_done();
    end
  endtask

 task drive_tx(fifo_tx tx);

  @(posedge vif.rd_clk);
  vif.rd_en <= 1;

  @(posedge vif.rd_clk);
  tx.data = vif.rdata;
  vif.rd_en <= 0;

  @(posedge vif.rd_clk);

  //only for concurrent test
  //repeat(tx.rd_dly) @(posedge vif.rd_clk);

endtask
endclass



