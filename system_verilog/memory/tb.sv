module tb;
reg clk,rst;
	mem_env env;//env declaration

	mem_interface pif(clk,rst);

	memory dut(.clk(pif.clk),
				.rst(pif.rst),
				.wr_rd(pif.wr_rd),
				.addr(pif.addr),
				.wdata(pif.wdata),
				.rdata(pif.rdata),
				.valid(pif.valid),
				.ready(pif.ready));
				 
	mem_assert uut( .clk(pif.clk),
					.rst(pif.rst),
					.wr_rd(pif.wr_rd),
					.addr(pif.addr),
					.wdata(pif.wdata),
					.rdata(pif.rdata),
					.valid(pif.valid),
					.ready(pif.ready));

				
	always #5 clk=~clk;
		initial begin
			clk=0;
			rst=1;
			repeat(2) @(posedge clk);
			rst=0;
			$value$plusargs("test_name=%0s",common::test_name);
				$value$plusargs("N=%0s",common::N);

			env=new();
			env.run();
		end
		// waveform dump block
 		 initial begin
   			 $dumpfile("dump.vcd");
    		$dumpvars;
 		 end
		initial begin
			#20;
			wait(common::gen_count==common::bfm_count);
			#50;
			if(common::matchings!=0 && common::mismatchings==0)begin
				$display("test_passed");
				$display("matchings=%0d,mismatchings=%0d",common::matchings,common::mismatchings);
			end
			else begin
				$display("test_failed");
				$display("matchings=%0d,mismatchings=%0d",common::matchings,common::mismatchings);
			end
				

			$finish;
		end
endmodule
