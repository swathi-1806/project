module car_access(d,y);
  input [3:0]d;
  output reg [2:0]y;
  
  always@(*)begin
    
    if(d[3]==1) begin
      y=3'b001;//father gets an access
      $display("father gets access");
    end
    
    else if(d[2]==1) begin
      y = 3'b010;       // Mother
      $display("mother gets access");
    end
      
    else if (d[1]==1)begin
        y = 3'b011;       // Daughter
      	$display("daughter gets access");
    end
     
    else if (d[0]==1)begin
        y = 3'b100;       // Son - Lowest priority
      	$display("son gets access");
    end
      
    else
        y = 3'b000;       // Nobody
        
end
  
// Output encoding:
// 001 - Father
// 010 - Mother
// 011 - Daughter
// 100 - Son
// 000 - Nobody

endmodule
