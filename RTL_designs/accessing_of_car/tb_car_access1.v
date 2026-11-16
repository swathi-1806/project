`include "car_access1.v"

module tb_car_access;

reg [3:0] d;
wire [2:0] y;

integer i;
reg [2:0] expected;
integer pass_count;
integer fail_count;
integer coverage_count;

// Coverage variable: 16 bits for 16 combinations
reg [15:0] input_coverage;

//============================================
// Step 3: Reference Model
//============================================
function [2:0] reference_model;
    input [3:0] req;

    begin
        if (req[3])
            reference_model = 3'b001;

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

//============================================
// DUT Instantiation
//============================================
car_access dut (
    .d(d),
    .y(y)
);

//============================================
// Main Testbench
//============================================
initial begin

    pass_count = 0;
    fail_count = 0;
    coverage_count = 0;
    input_coverage = 16'b0;

    // Step 2: Apply all 16 input combinations
    for (i = 0; i < 16; i = i + 1) begin

        d = i;
        #10;

        // Step 3: Calculate expected output
        expected = reference_model(d);

        // Step 6: Mark input as tested
        input_coverage[d] = 1'b1;

        // Step 4 and 5: Compare and count
        if (y === expected) begin
            $display("D=%b Y=%b EXPECTED=%b PASS",d, y, expected);
            pass_count = pass_count + 1;
        end
        else begin
            $display("D=%b Y=%b EXPECTED=%b FAIL",d, y, expected);
            fail_count = fail_count + 1;
        end

    end

    // Calculate functional coverage
    coverage_count = 0;

    for (i = 0; i < 16; i = i + 1) begin
        if (input_coverage[i] == 1'b1)
            coverage_count = coverage_count + 1;
    end

    // Final verification summary
    $display("--------------------------------------");
    $display("VERIFICATION SUMMARY");
    $display("--------------------------------------");

    $display("PASS COUNT     = %0d", pass_count);
    $display("FAIL COUNT     = %0d", fail_count);
    $display("INPUT COVERAGE = %0d / 16", coverage_count);

    if (fail_count == 0)
        $display("OVERALL RESULT = PASS");
    else
        $display("OVERALL RESULT = FAIL");

    $display("--------------------------------------");

    $finish;

end

endmodule

