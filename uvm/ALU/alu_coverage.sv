//====================================================
// ALU Functional Coverage
//====================================================

class alu_coverage extends uvm_subscriber #(alu_tx);

    `uvm_component_utils(alu_coverage)

    alu_tx tx;

    //================================================
    // Covergroup
    //================================================
    covergroup alu_cg;

        // Opcode Coverage
        opcode_cp : coverpoint tx.opcode {

            bins and_op = {3'b000};
            bins or_op  = {3'b001};
            bins xor_op = {3'b010};
            bins add_op = {3'b011};
            bins sub_op = {3'b100};

        }

        // Input A Coverage
        a_cp : coverpoint tx.a {

            bins low  = {[0:7]};
            bins high = {[8:15]};

        }

        // Input B Coverage
        b_cp : coverpoint tx.b {

            bins low  = {[0:7]};
            bins high = {[8:15]};

        }

        // Result Coverage
        result_cp : coverpoint tx.result {

            bins zero = {0};
            bins low  = {[1:7]};
            bins high = {[8:15]};

        }

        // Cross Coverage
        opcode_cross : cross opcode_cp, a_cp, b_cp;

    endgroup


    //================================================
    // Constructor
    //================================================
    function new(string name = "alu_coverage",
                 uvm_component parent);

        super.new(name, parent);

        alu_cg = new();

    endfunction


    //================================================
    // Sample Transactions
    //================================================
    function void write(alu_tx t);

        tx = t;

        alu_cg.sample();

    endfunction

endclass
