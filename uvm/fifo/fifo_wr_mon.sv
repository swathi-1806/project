class fifo_wr_mon extends uvm_monitor;
  `uvm_component_utils(fifo_wr_mon)
  `NEW_COMP

  virtual fifo_interface vif;
  uvm_analysis_port #(fifo_tx) wr_mon_ap_port;

  function void build_phase(uvm_phase phase);
    wr_mon_ap_port = new("wr_mon_ap_port", this);
    if (uvm_config_db#(virtual fifo_interface)::get(this,
                                                    "", 
                                                    "vif",
                                                     vif) == 0) begin
      `uvm_error("WR_MON", "failed to retrive the virtual interface");
	end
  endfunction

  task run_phase(uvm_phase phase);
    fifo_tx tx;
    forever begin
      @(posedge vif.wr_clk);
      if(vif.wr_en && !vif.full) begin
        tx = fifo_tx::type_id::create("tx");
        tx.data = vif.wdata;
        
        /* `uvm_info("WR_MON",
    $sformatf("FIFO Accepted Write: WDATA=%0h", tx.data),
    UVM_LOW)*/
        
        wr_mon_ap_port.write(tx);
      end
    end
  endtask
endclass

