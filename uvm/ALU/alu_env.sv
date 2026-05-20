//====================================================
// ALU Environment
//====================================================

class alu_env extends uvm_env;

    `uvm_component_utils(alu_env)

    alu_agent agt_h;;
    alu_sbd sbd_h;

    `NEW_COMP

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

      agt_h= alu_agent::type_id::create("agt_h", this);
      sbd_h= alu_sbd::type_id::create("sbd_h", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);

        // Monitor → Scoreboard connection
      agt_h.mon_h.mon_ap_h.connect(sbd_h.sbd_imp_h);
    endfunction

endclass

