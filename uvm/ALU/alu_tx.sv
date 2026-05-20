//====================================================
// ALU Transaction (Sequence Item)
//====================================================

class alu_tx extends uvm_sequence_item;

    rand bit [3:0] a;
    rand bit [3:0] b;
    rand bit [2:0] opcode;
		 bit [3:0] result;   // captured by monitor

	`uvm_object_utils_begin(alu_tx)
		`uvm_field_int(a,UVM_ALL_ON)
		`uvm_field_int(b,UVM_ALL_ON)
		`uvm_field_int(opcode,UVM_ALL_ON)
		`uvm_field_int(result,UVM_ALL_ON)
	`uvm_object_utils_end

	`NEW_OBJ
endclass

