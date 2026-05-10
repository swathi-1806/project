class mem_sbd extends uvm_subscriber#(mem_tx);
`uvm_component_utils(mem_sbd)

mem_tx tx;

//bit [`DATA_WIDTH-1:0]sbd_mem[*];
bit [`DATA_WIDTH-1:0] sbd_mem [bit [`ADDR_WIDTH-1:0]];

int match_count;
int miss_match_count;

`NEW_COMP

//write method from monitor
virtual function void write(mem_tx t);
	$cast(tx,t);
	//sbd_logic
	//wr - store the data into the sbd AA;
	//rd - compare the actual data(mon data) with expected data(sbd aa)

	//write operation
	if(tx.wr_rd == 1) begin
		sbd_mem[tx.addr] = tx.wdata;
		`uvm_info("SBD",
        		   $sformatf("WRITE stored: ADDR=%0h DATA=%0h",
                   tx.addr, tx.wdata),
       			 UVM_LOW)
	end

	//read operation
	else begin
	//if adreess exist means write happened before
		if (sbd_mem.exists(tx.addr)) begin
			if(tx.rdata == sbd_mem[tx.addr]) begin
				match_count++;
				`uvm_info("SBD",
                  			$sformatf("MATCH: ADDR=%0h EXP=%0h ACT=%0h",
                      tx.addr, sbd_mem[tx.addr], tx.rdata),
           		  		UVM_LOW)		
			end

			else begin
				miss_match_count++;
		 		`uvm_error("SBD",
            			  $sformatf("MISMATCH: ADDR=%0h EXP=%0h ACT=%0h",
                      tx.addr, sbd_mem[tx.addr], tx.rdata))		
			end
		end
		//address does not exists means read before write
		 else begin
        	`uvm_warning("SBD",
          				$sformatf("READ BEFORE WRITE: ADDR=%0h", tx.addr))
     	 end
    end

endfunction

// Summary
  function void report_phase(uvm_phase phase);
    `uvm_info("SBD_REPORT",
      $sformatf("MATCH=%0d  MISMATCH=%0d",
                match_count, miss_match_count),
      UVM_NONE)
  endfunction

endclass



