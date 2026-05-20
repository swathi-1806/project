//====================================================
// Interface for 4-bit ALU
//====================================================

interface alu_interface (input logic clk);

    logic [3:0] a;
    logic [3:0] b;
    logic [2:0] opcode;
    logic [3:0] result;

    // Clocking block for driver
    clocking drv_cb @(posedge clk);
        output a, b, opcode;
        input  result;
    endclocking

    // Clocking block for monitor
    clocking mon_cb @(posedge clk);
        input a, b, opcode, result;
    endclocking

endinterface

