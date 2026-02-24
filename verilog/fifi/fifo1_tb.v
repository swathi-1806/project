

`include "fifo1.v"
`define PRINT 1
module top;

//parameter declaration
parameter DEPTH=16;
parameter DATA_WIDTH=12;
parameter PTR_WIDTH=$clog2(DEPTH);

// port declaration
reg clk,rst,wr_en,rd_en;
reg [DATA_WIDTH-1:0]wdata;
wire [DATA_WIDTH-1:0]rdata;
wire full,overflow,empty,underflow;
integer i;
reg [35*8:0] testname;

//port connection
sync_fifo #(.DEPTH(DEPTH),.DATA_WIDTH(DATA_WIDTH)) dut(
			.clk		(clk),
			.rst		(rst),
			.wr_en		(wr_en),
			.wdata		(wdata),
			.full		(full),
			.overflow	(overflow),
			.rd_en		(rd_en),
			.rdata		(rdata),
			.empty		(empty),
			.underflow	(underflow));
			
//clock generation
initial begin
	clk=0;
	forever #5 clk=~clk;
end

//reset
initial begin
	reset_fifo();
	$value$plusargs("testcase=%0s",testname);
	$display("================================================================================================");
	$display("/t-->passing testcase:%0s",testname);
	$display("================================================================================================");
			case(testname)
			"test_1wr":begin
				write_fifo(0,1);
			end
			"test_5wr":begin
				write_fifo(0,5);
			end
			"test_nwr":begin
				write_fifo(0,DEPTH);
			end
			"test_1wr_1rd":begin
				write_fifo(0,1);
				read_fifo(0,1);
			end
			"test_5wr_5rd":begin
				write_fifo(0,5);
				read_fifo(0,5);
				print_function();
			end
			"test_full":begin
				write_fifo(0,DEPTH);
				read_fifo(0,0);
				print_function();
			end
			"test_overflow":begin
				write_fifo(0,DEPTH+5);
				read_fifo(0,0);
				print_function();
			end
			"test_empty":begin
				write_fifo(0,DEPTH);
				read_fifo(0,DEPTH);
				print_function();
			end
			"test_underflow":begin        //test_nwr_nrd
				write_fifo(0,DEPTH);
				read_fifo(0,DEPTH+5);
				print_function();
			end
			"test_overflow_underflow":begin
				write_fifo(0,DEPTH+6);
				read_fifo(0,DEPTH+7);
			    print_function();
			end

		endcase
#100;
$finish();
end
task print_function();
begin
    @(posedge clk);
	$display("================================================================================================");
	if(full==1)$display("FIFO writes reaches to the DEPTH size-full");
	if(empty==1)$display("FIFO reads reaches to the DEPTH size-empty");
	if(underflow==1)$display("FIFO readss reaches to the DEPTH size,stop reading the data from fifo-underflow");
	if(overflow==1)$display("FIFO writes reaches to the DEPTH size,stop writing the data into the fifo-oveflow");
	$display("=================================================================================================");

end
endtask
	
task reset_fifo();
	begin
		wr_en=0;
		rd_en=0;
		wdata=0;
		rst=1;
		repeat(2)@(posedge clk);
		rst=0;
	end
endtask

//write task
task write_fifo(input integer start_loc,end_loc);
begin
if (`PRINT==1)$display("-----------FIFO_WRITES-----------");
		for(i=start_loc;i<end_loc;i=i+1)begin
			@(posedge clk);
			wr_en=1;
			wdata=$random;
			if (`PRINT==1)$display("wt_pointer:%0d||wdata:%0h",dut.wr_ptr,wdata);
		end
			@(posedge clk);
			wr_en=0;
			wdata=0;
	end
endtask

//readtask
task read_fifo(input integer start_loc,end_loc);
begin
if (`PRINT==1)$display("-----------FIFO_READS-----------");
		for(i=start_loc;i<end_loc;i=i+1)begin
			@(posedge clk);
			rd_en=1;
			#1;
if (`PRINT==1)$display("rd_pointer:%0d||rdata:%0h",dut.rd_ptr,rdata);
		end
			@(posedge clk);
			rd_en=0;
	end
endtask
endmodule
