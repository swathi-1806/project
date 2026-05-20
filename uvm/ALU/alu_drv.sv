//====================================================
// ALU Driver
//====================================================

class alu_drv extends uvm_driver #(alu_tx);

    `uvm_component_utils(alu_drv)
	`NEW_COMP

    virtual alu_interface vif;


    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

      if (!uvm_config_db#(virtual alu_interface)::get(this,
												"",
												"vif",
												vif))
            `uvm_fatal("DRV", "Virtual interface not set")
    endfunction

    task run_phase(uvm_phase phase);
        alu_tx req;

        forever begin
          seq_item_port.get_next_item(req);
			drive_tx(req);
			req.print();
			seq_item_port.item_done();
		end
	endtask

		task drive_tx(alu_tx tx);

            // Drive inputs at clock edge using clocking block
            @(vif.drv_cb);
            vif.drv_cb.a      <= tx.a;
            vif.drv_cb.b      <= tx.b;
            vif.drv_cb.opcode <= tx.opcode;

         endtask

endclass
