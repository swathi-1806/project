//====================================================
// ALU Monitor
//====================================================

class alu_mon extends uvm_monitor;

    `uvm_component_utils(alu_mon)
	`NEW_COMP

    virtual alu_interface vif;
    uvm_analysis_port #(alu_tx) mon_ap_h;

    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        mon_ap_h = new("mon_ap_h", this);

      if (!uvm_config_db#(virtual alu_interface)::get(this,
												"",
												"vif",
												 vif))
            `uvm_fatal("MON", "Virtual interface not set")
    endfunction

    task run_phase(uvm_phase phase);
        alu_tx tx;

        forever begin
            @(vif.mon_cb);  // sample at clock edge

            tx = alu_tx::type_id::create("tx");

            tx.a      = vif.mon_cb.a;
            tx.b      = vif.mon_cb.b;
            tx.opcode = vif.mon_cb.opcode;
            tx.result = vif.mon_cb.result;

            mon_ap_h.write(tx);   // send to scoreboard
        end
    endtask

endclass

