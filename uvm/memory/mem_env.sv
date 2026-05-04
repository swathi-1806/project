class mem_env extends uvm_env;
	`uvm_component_utils(mem_env)
	`NEW_COMP

//instatiate sub class
mem_agent agt_h;
mem_sbd sbd_h;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	agt_h=mem_agent::type_id::create("agt_h",this);
	sbd_h=mem_sbd::type_id::create("sbd_h",this);
endfunction

function void connect_phase(uvm_phase phase);
	//connect mon to sbd
	agt_h.mon_h.mon_ap_h.connect(sbd_h.analysis_export);
endfunction


endclass



