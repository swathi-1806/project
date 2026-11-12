
module once_count #(
  parameter DATA_WIDTH = 10,
  parameter COUNT_WIDTH = $clog2(DATA_WIDTH+1))
(
  input  [DATA_WIDTH-1:0] d,
  output [COUNT_WIDTH-1:0] y
);

  integer i;
  reg [COUNT_WIDTH-1:0] count;

  always @(*) begin
    count = 0;
    for(i = 0; i < DATA_WIDTH; i = i+1) begin
      count = count + d[i];
    end
  end
  assign y = count;
endmodule


module tb;

  parameter DATA_WIDTH = 10;
  parameter COUNT_WIDTH = $clog2(DATA_WIDTH+1);

  reg  [DATA_WIDTH-1:0] d;
  wire [COUNT_WIDTH-1:0] y;

  once_count #(
    .DATA_WIDTH(DATA_WIDTH),
    .COUNT_WIDTH(COUNT_WIDTH)) dut (.d(d),.y(y));

  initial begin
    repeat(10) begin
      d = $random;
      #1;
      $display("d=%b, y=%0d (%b)", d, y, y);
    end
    $finish;
  end

endmodule
/*
=================output=====================
# d=0100100100, y=3 (0011)
# d=1010000001, y=3 (0011)
# d=1000001001, y=3 (0011)
# d=1001100011, y=5 (0101)
# d=1100001101, y=5 (0101)
# d=0110001101, y=5 (0101)
# d=0001100101, y=4 (0100)
# d=1000010010, y=3 (0011)
# d=1100000001, y=3 (0011)
# d=0100001101, y=4 (0100)
*/

//-----------------------------------------------------------------------------------
/*module once_count(i,y);
  input [6:0]i;
  output [2:0]y;
  
  assign y=i[0]+i[1]+i[2]+i[3]+i[4]+i[5]+i[6];
endmodule

module tb;
  reg [6:0]i;
  wire [2:0]y;
  
  once_count dut(i,y);
  
  initial begin
    repeat(10)begin
      i=$random();
      #1;
      $display("i=%b,y=%d(%b)",i,y,y);
    end
  end
endmodule*/
