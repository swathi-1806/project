//====================================================
// ALU Agent
//====================================================

class alu_agent extends uvm_agent;

    `uvm_component_utils(alu_agent)
	`NEW_COMP

    alu_drv drv_h;
    alu_mon mon_h;
    alu_sqr sqr_h;
	alu_coverage cov_h;
   
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        drv_h  = alu_drv::type_id::create("drv_h",  this);
        mon_h  = alu_mon::type_id::create("mon_h",  this);
        sqr_h  = alu_sqr::type_id::create("sqr_h", this);
		cov_h  = alu_coverage::type_id::create("cov_h",this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        // Connect driver to sequencer
        drv_h.seq_item_port.connect(sqr_h.seq_item_export);

		//monitor -> coverage
		mon_h.mon_ap_h.connect(cov_h.analysis_export);
    endfunction

endclass
