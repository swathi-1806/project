//====================================================
// 1-bit ALU Design (No carry, No zero)
//====================================================
/====================================================
// 1-bit ALU Design (No carry, No zero)
//====================================================
module alu_4bit (
    input  logic [3:0]a,
    input  logic [3:0]b,
    input  logic [2:0] opcode,
    output logic [3:0]result
);
logic [4:0] temp; 

    always_comb begin
        case(opcode)

            3'b000: result = a & b;   // AND
            3'b001: result = a | b;   // OR
            3'b010: result = a ^ b;   // XOR

            3'b011: begin
              temp = a + b;   // ADD (sum bit)
				result = temp[3:0];
            end
	
            3'b100: begin
              temp = a - b;   // SUB (difference bit)
				
          	  result = temp[3:0];
            end

            default: result = 1'b0;

        endcase
    end

endmodule
