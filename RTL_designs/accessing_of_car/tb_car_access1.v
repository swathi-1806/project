module tb_car_access;
reg [3:0]d;
wire [2:0]y;

integer i;
reg [2:0]expected;
integer pass_count;
integer fail_count;

//============================================
//Expected Output and Reference Model--->step-3
//============================================
function [2:0]reference_model;
	input [3:0]req;
		begin
			if(req[3]==1)
				reference_model=3'b001;

			else if (req[2])
            	reference_model = 3'b010;

       		 else if (req[1])
            	reference_model = 3'b011;

       		 else if (req[0])
            	reference_model = 3'b100;

        else
            reference_model = 3'b000;
  
		end
endfunction


//step-1:-generate test inputs & give inputs to the DUT
car_access dut(.d(d),.y(y));//---->step-1
	initial begin
      	pass_count=0;
	fail_count=0;

	/*
	-----------------------------
	this will gener
    ate randomly , there are chances it won't cover all the input combinations
		repeat(10)begin
			d=$random();
			#10;
			$display("input=%b output=%b",d,y);
		end
	*/
	

		for (i = 0; i < 16; i = i + 1) begin//-->step-2

    			d = i;
    			#10;
				expected = reference_model(d);//step-3(part2)
          $display("D=%b Y=%b expected=%b", d, y,expected);

				if(y==expected)begin//step--4
					$display("pass");
					pass_count=pass_count+1;//step==5
				end
				else begin
					$display("fail");
					fail_count=fail_count+1;
				end
        end

		// Final summary
    $display("------------------------");
    $display("VERIFICATION SUMMARY");
    $display("PASS COUNT = %0d", pass_count);
    $display("FAIL COUNT = %0d", fail_count);

    if (fail_count == 0)
        $display("OVERALL RESULT: PASS");
    else
        $display("OVERALL RESULT: FAIL");

    $finish;
	end
endmodule
