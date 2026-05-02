class mem_agent extends uvm_agent;
	`uvm_component_utils(mem_agent)
	`NEW_COMP

//instantiate sub classes
mem_mon mon_h;
mem_drv drv_h;
mem_sqr sqr_h;
mem_cov cov_h;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	mon_h=mem_mon::type_id::create("mon_h",this);
	drv_h=mem_drv::type_id::create("drv_h",this);
	sqr_h=mem_sqr::type_id::create("sqr_h",this);
	cov_h=mem_cov::type_id::create("cov_h",this);
endfunction

function void connect_phase(uvm_phase phase);

endfunction
endclass

