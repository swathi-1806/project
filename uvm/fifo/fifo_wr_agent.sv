class fifo_wr_agent extends uvm_agent;
`uvm_component_utils(fifo_wr_agent)
`NEW_COMP

fifo_wr_drv wr_drv_h;
fifo_wr_mon wr_mon_h;
fifo_wr_sqr wr_sqr_h;
//fifo_wr_cov wr_cov_h;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	wr_drv_h = fifo_wr_drv::type_id::create("wr_drv_h",this);
	wr_mon_h = fifo_wr_mon::type_id::create("wr_mon_h",this);
	wr_sqr_h = fifo_wr_sqr::type_id::create("wr_sqr_h",this);
//	wr_cov_h = fifo_wr_cov::type_id::create("wr_cov_h",this);
endfunction

function void connect_phase(uvm_phase phase);
	wr_drv_h.seq_item_port.connect(wr_sqr_h.seq_item_export);
//	wr_mon_h.wr_mon_ap_port.connect(wr_cov_h.analysis_export);
endfunction

endclass

