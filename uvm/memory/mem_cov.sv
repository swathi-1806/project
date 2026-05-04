/*
-->uvm_subscriber class already has a export defined in it 
i.e uvm_analysis_imp#(T,this_type analysis_export)
--> and also has a pure virtual method
	i.e function write()

	- a pure virtual method that must be defined in each subclass. 
	- access to this method by outside componenets should be done via the "analysis_export"
*/

class mem_cov extends uvm_subscriber#(mem_tx);
	`uvm_component_utils(mem_cov)

mem_tx tx;

covergroup mem_cg;
	WR_RD_CP:coverpoint tx.wr_rd;
	ADDR_CP: coverpoint tx.addr;
	WR_RD_X_ADDR:cross WR_RD_CP,ADDR_CP;
endgroup
/*
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	//allocate memory for covergroup
	mem_cg  = new();//we should not allocate like this
endfunction
*/
function new(string name="", uvm_component parent);
    super.new(name, parent);
  	mem_cg = new();   //ONLY PLACE allowed for memory of covergroup
  endfunction

virtual function void write(mem_tx t);
	$cast(tx,t);
	mem_cg.sample();
endfunction


endclass





