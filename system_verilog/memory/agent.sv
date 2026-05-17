class agent;
	generator gen;
	mem_bfm bfm;
	monitor mon;
	coverage cov;

	task run();
		$display("agent functionality will be happened");
		gen=new();
		bfm=new();
		mon=new();
		cov=new();
			fork 
				gen.run();
				bfm.run();
				mon.run();
				cov.run();
			join
	endtask
endclass
		
