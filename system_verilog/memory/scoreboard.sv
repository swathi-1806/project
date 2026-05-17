class scoreboard;
transaction tx;
int asso[int];
	task run();
	//	$display("scoreboard functionality has been done");
	forever begin
		common::mon2sbd.get(tx);
		//tx.print("mem_sbd");
		if(tx.wr_rd==1)asso[tx.addr]=tx.wdata;
		else begin
			if(asso[tx.addr]==tx.rdata) common::matchings++;
			else common::mismatchings++;
		end
	end
	endtask
endclass
