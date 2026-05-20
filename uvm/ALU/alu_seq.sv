//====================================================
// ALU Sequence (Stimulus Generator)
//====================================================

//====================================================
// ALU Sequence (Stimulus Generator)
//====================================================

class alu_seq extends uvm_sequence #(alu_tx);

    `uvm_object_utils(alu_seq)

    `NEW_OBJ
	
    task body();
        alu_tx tx;

        repeat (20) begin
            tx = alu_tx::type_id::create("tx");

            start_item(tx);
            assert(tx.randomize());
            finish_item(tx);
        end
    endtask

endclass

