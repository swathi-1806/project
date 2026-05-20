//====================================================
// ALU UVM Test
//====================================================
class alu_test extends uvm_test;

    `uvm_component_utils(alu_test)
	`NEW_COMP

    alu_env env_h;

    
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        env_h = alu_env::type_id::create("env_h", this);
    endfunction

    task run_phase(uvm_phase phase);

        alu_seq seq_h;

        phase.raise_objection(this);

        seq_h = alu_seq::type_id::create("seq");

        // Start sequence on sequencer
        seq_h.start(env_h.agt_h.sqr_h);

        #20;

        phase.drop_objection(this);

    endtask

endclass

