class fifo_env extends uvm_env;
`uvm_component_utils(fifo_env)

fifo_wr_agent wr_agt_h;
fifo_rd_agent rd_agt_h;
//fifo_sbd sbd_h;
virtual_sqr v_sqr_h;

`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	wr_agt_h = fifo_wr_agent::type_id::create("wr_agt_h",this);
	rd_agt_h = fifo_rd_agent::type_id::create("rd_agt_h",this);
	//sbd_h = fifo_sbd::type_id::create("sbd_h",this);
	v_sqr_h = virtual_sqr::type_id::create("v_sqr_h",this);

endfunction

 
function void connect_phase(uvm_phase phase);
//integeration virtual sqr into tb
v_sqr_h.wr_sqr_h = wr_agt_h.wr_sqr_h;
v_sqr_h.rd_sqr_h = rd_agt_h.rd_sqr_h;

//wr_agt -mon to sbd connection
//wr_agt_h.wr_mon_h.wr_mon_ap_port.connect(sbd_h.wr_imp);
//rd_agt -mon to sbd connection
//rd_agt_h.rd_mon_h.rd_mon_ap_port.connect(sbd_h.rd_imp);
endfunction

endclass

