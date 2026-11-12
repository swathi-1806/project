module full_adder(input a,b,cin,
                  output sum,carry);
  assign sum = a ^ b ^ cin;
  assign carry = (a & b) | (b & cin) | (a & cin);
endmodule

module once_count(input [6:0] i,
                  output [2:0] y);
  wire s1,c1,s2,c2;
  wire s3,c3,s4,c4;
 
  // Add three groups of bits
  full_adder fa1(i[0],i[1],i[2],s1,c1);
  full_adder fa2(i[3],i[4],i[5],s2,c2);

  // Add remaining bit to the sum bits
  full_adder fa3(s1,s2,i[6],s3,c3);

  // Add carry bits from first three adders
  full_adder fa4(c1,c2,c3,s4,c4);
  
  assign y = {c4,s4,s3};
endmodule

module tb;
  reg [6:0] i;
  wire [2:0] y;
  once_count dut(i,y);
  initial begin
    repeat(10) begin
      i = $random;
      #1;
      $display("i=%b, y=%d (%b)",i,y,y);
    end
    $finish;
  end
endmodule

/*
output:
# i=0100100, y=2 (010)
# i=0000001, y=1 (001)
# i=0001001, y=2 (010)
# i=1100011, y=4 (100)
# i=0001101, y=3 (011)
# i=0001101, y=3 (011)
# i=1100101, y=4 (100)
# i=0010010, y=2 (010)
# i=0000001, y=1 (001)
# i=0001101, y=3 (011)
*/
