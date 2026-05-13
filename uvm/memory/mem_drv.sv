class mem_drv extends uvm_driver#(mem_tx);
	`uvm_component_utils(mem_drv)
	`NEW_COMP

//virtua; interface instantiation
virtual mem_interface vif;
mem_tx req;
//to reterive 
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(uvm_config_db#(virtual mem_interface)::get(this,"","MEM_PIF",vif)==0) 
	begin
		`uvm_error("mem_drv","FAILED TO RETRIEVE VIF HANDLE FROM CFGDB")
	end
endfunction

task run_phase(uvm_phase phase);
  wait(vif.rst==0);//drv should drive the tx to dut after rst is completed
     forever begin
		//send req to sqr for item
		seq_item_port.get_next_item(req);
		//drive the item to dut using interface
		drive_tx(req);//user defined task
       req.print();
		//send the ack to sqr
		seq_item_port.item_done();
	end
endtask

task drive_tx(mem_tx tx);
	@vif.drv_cb;
	vif.drv_cb.wr_rd <= tx.wr_rd;
	vif.drv_cb.addr  <= tx.addr;
	if(tx.wr_rd==1)
			vif.drv_cb.wdata <=tx.wdata;
	vif.drv_cb.valid <= 1;
  
	//Handshake: wait clock-by-clock until ready is seen
  do begin
    @vif.drv_cb;
  end while (vif.drv_cb.ready != 1);

	if(tx.wr_rd==0)
			tx.rdata = vif.drv_cb.rdata;
  
	// Deassert after handshake
 	 @vif.drv_cb;
	vif.drv_cb.valid <=0;			
	vif.drv_cb.wr_rd <=0;
	vif.drv_cb.addr  <=0;
	//vif.drv_cb.wdata <=0;


endtask
endclass


