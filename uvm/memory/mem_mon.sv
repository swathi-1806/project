class mem_mon extends uvm_monitor;
	`uvm_component_utils(mem_mon)
	`NEW_COMP

//virtua; interface instantiation
virtual mem_interface vif;

//declare analysis port
uvm_analysis_port#(mem_tx) mon_ap_h;
//mem_tx tx;
//to retrive
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	mon_ap_h = new("mon_ap_h",this);
	//tx=mem_tx::type_id::create("tx");

	if(uvm_config_db#(virtual mem_interface)::get(this,"","MEM_PIF",vif)==0)begin
		`uvm_error("mem_mon","FAILED TO RETRIEVE VIF HANDLE FROM CFGDB")
	end
endfunction

task run_phase(uvm_phase phase);
mem_tx tx;
tx = mem_tx::type_id::create("tx");
//check for valid tx for every positive edge of clk and when tx become vlaid collect them and send to cov and sbd
  wait(vif.rst == 0);
	forever begin
		@(vif.mon_cb);
		if(vif.mon_cb.valid && vif.mon_cb.ready)begin
			tx.wr_rd = vif.mon_cb.wr_rd;
			tx.addr =  vif.mon_cb.addr;
			if(tx.wr_rd == 1) tx.wdata = vif.mon_cb.wdata;
			if(tx.wr_rd == 0) tx.rdata = vif.mon_cb.rdata;
         
			//print
			`uvm_info("mem_mon",
				$sformatf("CMD = %s||ADDR=%h||DATA=%h",
								tx.wr_rd ? "WR":"RD",
								tx.addr,
								tx.wr_rd ? tx.wdata : tx.rdata),
				UVM_NONE)
		
		//send the tx to cov and sbd
		mon_ap_h.write(tx);
		end
	end
endtask

endclass

 
	
