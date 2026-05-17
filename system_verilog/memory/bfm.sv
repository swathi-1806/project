class mem_bfm;
	transaction tx;
	virtual mem_interface vif;
	
	task run();
		//$display("bfm functionality has been done");
	vif=tb.pif;//targetting the physical interface memory
		forever begin
			common::gen2bfm.get(tx);
			drive_tx(tx);
			tx.print("bfm");
			common::bfm_count++;
		end
	endtask

	task drive_tx(transaction tx);
		@(vif.bfm_cb);
		vif.bfm_cb.wr_rd				<=tx.wr_rd;
		vif.bfm_cb.addr					<=tx.addr;
		if(tx.wr_rd==1)vif.bfm_cb.wdata	<=tx.wdata;
		else vif.bfm_cb.wdata			<=0;
		vif.bfm_cb.valid				<=1;
		wait(vif.bfm_cb.ready==1);
      if(tx.wr_rd==0)begin
			@(vif.bfm_cb  );
			tx.rdata=vif.bfm_cb.rdata;
		end
		else tx.rdata=0;
		@(vif.bfm_cb);
		vif.bfm_cb.wr_rd	<=0;
		vif.bfm_cb.addr		<=0;
		vif.bfm_cb.wdata	<=0;
		vif.bfm_cb.valid	<=0;
	endtask
endclass
/*
		
		@(posedge clk);
			wr_rd=1;
			addr=i;
			wdata=$random;
			valid=1;
			wait(ready==1);
		end
		@(posedge clk);
			wr_rd=0;
			addr=0;
			wdata=0;
			valid=0;
-------------------------------------
		@(posedge clk);
			wr_rd=0;
			addr=i;
			valid=1;
			wait(ready==1);
		end
		@(posedge clk);
			wr_rd=0;
			addr=0;
			valid=0;
*/

