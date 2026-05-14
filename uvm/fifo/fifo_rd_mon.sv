class fifo_rd_mon extends uvm_monitor;
  `uvm_component_utils(fifo_rd_mon)
  `NEW_COMP

  virtual fifo_interface vif;
  uvm_analysis_port #(fifo_tx) rd_mon_ap_port;

  function void build_phase(uvm_phase phase);
    rd_mon_ap_port = new("rd_mon_ap_port", this);
    if (uvm_config_db#(virtual fifo_interface)::get(this, "", "vif", vif) == 0) begin
      `uvm_error("RD_MON", "failed to retrive the virtual interface");
end
  endfunction

  task run_phase(uvm_phase phase);
    fifo_tx tx;
    forever begin
      @(posedge vif.rd_clk);
      if(vif.rd_en && !vif.empty) begin
        tx = fifo_tx::type_id::create("tx");
        tx.data = vif.rdata;
        
     /*  `uvm_info("RD_MON",
    $sformatf("FIFO Returned Data: RDATA=%0h", tx.data),
    UVM_LOW)*/
        
        rd_mon_ap_port.write(tx);
      end
    end
  endtask
endclass

