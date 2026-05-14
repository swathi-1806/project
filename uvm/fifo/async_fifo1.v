module async_fifo(wr_clk,rd_clk,rst,wr_en,wdata,full,overflow,rd_en,rdata,empty,underflow);
//parameter declaration
parameter DEPTH=16;
parameter DATA_WIDTH=12;
parameter PTR_WIDTH=$clog2(DEPTH);

// port declaration
input wr_clk,rd_clk,rst,wr_en,rd_en;
input [DATA_WIDTH-1:0]wdata;
output reg[DATA_WIDTH-1:0]rdata;
output reg full,overflow,empty,underflow;

//fifo declaration
reg [DATA_WIDTH-1:0] fifo[DEPTH-1:0];

//internal registers
reg [PTR_WIDTH-1:0]wr_ptr,rd_ptr;
reg [PTR_WIDTH-1:0]wr_ptr_rd_clk,rd_ptr_wr_clk;
reg wr_toggle_f,rd_toggle_f;
reg wr_toggle_f_rd_clk,rd_toggle_f_wr_clk;
integer i;

//FIFO functionality
always@(posedge wr_clk)begin
	if(rst==1)begin
		rdata=0;
		full=0;
		overflow=0;
		empty=1;
		underflow=0;
		wr_ptr=0;
		rd_ptr=0;
		wr_ptr_rd_clk=0;
		rd_ptr_wr_clk=0;
		wr_toggle_f_rd_clk=0;
		rd_toggle_f_wr_clk=0;
		wr_toggle_f=0;
		rd_toggle_f=0;
		for(i=0;i<DEPTH;i=i+1)begin
			fifo[i]	=0;
		end
	end

//write operation
	else begin
		overflow= 0;
		underflow=0;
		if(wr_en==1)begin
			if(full==1)begin
				overflow=1;
			end
			else begin
				fifo[wr_ptr]=wdata;
				if(wr_ptr==DEPTH-1)begin
					wr_toggle_f= ~wr_toggle_f;
				end
				wr_ptr=wr_ptr+1;
			end
		end
	end
end

//read operation
always@(posedge rd_clk)begin
 	if(!rst)begin
		if(rd_en==1)begin
			if(empty==1)begin
				underflow=1;
			end
			else begin
				rdata=fifo[rd_ptr];
				if(rd_ptr==DEPTH-1)begin
					rd_toggle_f=~rd_toggle_f;
				end
				rd_ptr=rd_ptr+1;
			end
		end
	end
end

//synchronization between the two clocks
	always@(posedge wr_clk)begin
		rd_ptr_wr_clk=rd_ptr;
		rd_toggle_f_wr_clk=rd_toggle_f;
	end
	always@(posedge rd_clk)begin
		wr_ptr_rd_clk=wr_ptr;
		wr_toggle_f_rd_clk=wr_toggle_f;
	end

//full & empty conditions
always@(*)begin
full=0;
empty=0;
	if(wr_ptr==rd_ptr_wr_clk && wr_toggle_f != rd_toggle_f_wr_clk)begin
		full=1;
	end
	if(wr_ptr_rd_clk==rd_ptr && wr_toggle_f_rd_clk == rd_toggle_f)begin 
		empty=1;
	end
end
endmodule


