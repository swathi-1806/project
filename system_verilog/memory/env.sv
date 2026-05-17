class mem_env;
	agent agnt;
	scoreboard sbd;

	task run();
	//	$display("env functionality has been done ");
		agnt=new();
		sbd=new();
		fork
			agnt.run();
			sbd.run();
		join
	endtask
endclass
