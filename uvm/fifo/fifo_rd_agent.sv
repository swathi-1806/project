class fifo_rd_agent extends uvm_agent;
`uvm_component_utils(fifo_rd_agent)
`NEW_COMP

fifo_rd_drv rd_drv_h;
fifo_rd_mon rd_mon_h;
fifo_rd_sqr rd_sqr_h;
//fifo_rd_cov rd_cov_h;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	rd_drv_h = fifo_rd_drv::type_id::create("rd_drv_h",this);
	rd_mon_h = fifo_rd_mon::type_id::create("rd_mon_h",this);
	rd_sqr_h = fifo_rd_sqr::type_id::create("rd_sqr_h",this);
//	rd_cov_h = fifo_rd_cov::type_id::create("rd_cov_h",this);
endfunction

function void connect_phase(uvm_phase phase);
	rd_drv_h.seq_item_port.connect(rd_sqr_h.seq_item_export);
//	rd_mon_h.rd_mon_ap_port.connect(rd_cov_h.analysis_export);

endfunction

endclass

