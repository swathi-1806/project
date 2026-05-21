
//====================================================
// ALU Assertions
//====================================================

module alu_assert (

    input logic        clk,
    input logic [3:0] a,
    input logic [3:0] b,
    input logic [2:0] opcode,
    input logic [3:0] result

);

    //================================================
    // AND Assertion
    //================================================
    property and_check;
        @(posedge clk)
        (opcode == 3'b000) |-> (result == (a & b));
    endproperty

    AND_ASSERT : assert property(and_check)
        $display("AND Operation Passed");
    else
        $error("AND Operation Failed");


    //================================================
    // OR Assertion
    //================================================
    property or_check;
        @(posedge clk)
        (opcode == 3'b001) |-> (result == (a | b));
    endproperty

    OR_ASSERT : assert property(or_check)
        $display("OR Operation Passed");
    else
        $error("OR Operation Failed");


    //================================================
    // XOR Assertion
    //================================================
    property xor_check;
        @(posedge clk)
        (opcode == 3'b010) |-> (result == (a ^ b));
    endproperty

    XOR_ASSERT : assert property(xor_check)
        $display("XOR Operation Passed");
    else
        $error("XOR Operation Failed");


    //================================================
    // ADD Assertion
    //================================================
    property add_check;
        @(posedge clk)
        (opcode == 3'b011) |-> (result == (a + b));
    endproperty

    ADD_ASSERT : assert property(add_check)
        $display("ADD Operation Passed");
    else
        $error("ADD Operation Failed");


    //================================================
    // SUB Assertion
    //================================================
    property sub_check;
        @(posedge clk)
        (opcode == 3'b100) |-> (result == (a - b));
    endproperty

    SUB_ASSERT : assert property(sub_check)
        $display("SUB Operation Passed");
    else
        $error("SUB Operation Failed");

endmodule
