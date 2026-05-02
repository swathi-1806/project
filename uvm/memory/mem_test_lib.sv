class mem_base_test extends uvm_test;
	`uvm_component_utils(mem_base_test)
	`NEW_COMP
	
//instatiation env
mem_env env_h;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	env_h=mem_env::type_id::create("env_h",this)
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction

function void check_phase(uvm_phase phase);

endfunction

function void extract_phase(uvm_phase phase);

endfunction

function void report_phase(uvm_phase phase);

endfunction

endclass
