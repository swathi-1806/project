class fifo_wr_drv extends uvm_driver #(fifo_tx);

`uvm_component_utils(fifo_wr_drv)
`NEW_COMP

fifo_tx tx;

virtual fifo_interface vif;
  
  function void build_phase(uvm_phase phase);
    	super.build_phase(phase);
     	if (uvm_config_db#(virtual fifo_interface)::get(this,
                                                        "", 
                                                        "vif", 
                                                        vif)==0)begin
    	`uvm_error("WR_DRV", "failed to retrive the virtual interface");
  		end
  endfunction

task run_phase(uvm_phase phase);
  	vif.wr_en  <= 0;
	vif.wdata  <= 0;
	wait (vif.rst == 0);
	forever begin
      seq_item_port.get_next_item(tx);
		tx.print();
		drive_tx(tx);
		seq_item_port.item_done();
	end
endtask

task drive_tx(fifo_tx tx);

  // prepare data before clock edge
  @(posedge vif.wr_clk);
  vif.wdata  <= tx.data;
  vif.wr_en  <= 1;

  // FIFO samples here
  @(posedge vif.wr_clk);
  vif.wdata  <= 0;
  vif.wr_en  <= 0;

  @(posedge vif.wr_clk);

 // repeat(tx.wr_dly)@(posedge vif.wr_clk);//only for concurrent test

endtask
endclass


