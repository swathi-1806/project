//====================================================
// ALU Scoreboard (Golden Model)
//====================================================

class alu_sbd extends uvm_scoreboard;

    `uvm_component_utils(alu_sbd)

  uvm_analysis_imp #(alu_tx, alu_sbd) sbd_imp_h;

    function new(string name = "alu_scoreboard", uvm_component parent);
        super.new(name, parent);
        sbd_imp_h = new("sbd_imp_h", this);
    endfunction

    // This function is called whenever monitor sends a transaction
    function void write(alu_tx tx);

        bit [3:0] exp_result;

        case(tx.opcode)
            3'b000: exp_result = tx.a & tx.b;   // AND
            3'b001: exp_result = tx.a | tx.b;   // OR
            3'b010: exp_result = tx.a ^ tx.b;   // XOR
            3'b011: exp_result = tx.a + tx.b;   // ADD
            3'b100: exp_result = tx.a - tx.b;   // SUB
            default: exp_result = 4'd0;
        endcase

        if (tx.result !== exp_result)
            `uvm_error("ALU_SCB",
                $sformatf("Mismatch! a=%0d b=%0d opcode=%0d | DUT=%0d EXP=%0d",
                           tx.a, tx.b, tx.opcode, tx.result, exp_result))
        else
            `uvm_info("ALU_SCB",
                $sformatf("Match OK: a=%0d b=%0d opcode=%0d result=%0d",
                           tx.a, tx.b, tx.opcode, tx.result),
                UVM_LOW);

    endfunction

endclass

