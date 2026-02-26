# Memory Design with Valid-Ready Protocol (Verilog)
Project Overview

This project implements a parameterized single-port synchronous memory in Verilog with a valid-ready handshake protocol.

## The design supports:

* Controlled read/write operations<br>
* Reset-based memory initialization<br>
* Directed test cases<br>
* Frontdoor and Backdoor memory access<br>
* A self-checking style testbench with multiple test scenarios is included.<br>

## Design Specifications
### Parameters
* Parameter	Description	Default Value<br>
* DEPTH	Number of memory locations	16<br>
* WIDTH	Data width	8<br>
* ADDR_WIDTH	Calculated using $clog2(DEPTH)	Auto<br>

### Port Description
#### Inputs
 * clk → Clock signal<br>
 * rst → Active high reset<br>
 * wr_rd → Write/Read control<br>
       * 1 → Write<br>
       * 0 → Read<br>
* valid → Request signal<br>
* addr → Address input<br>
* wdata → Write data<br>
#### Outputs
* rdata → Read data<br>
* ready → Response signal<br>

### Design Functionality
#### Reset Condition
* When rst = 1:
* rdata = 0
* ready = 0
  * Entire memory array is cleared to zero

#### Normal Operation (On posedge clk)
If valid = 1:<br>
ready = 1<br>
If wr_rd = 1 → Write operation<br>
mem[addr] = wdata<br>
If wr_rd = 0 → Read operation<br>
rdata = mem[addr]<br>
If valid = 0:<br>
ready = 0<br>

#### Valid-Ready Handshake Protocol
The design follows a simple handshake mechanism:
```
 |valid   |ready   | Operation            |
 |----------------------------------------|
 | 1      |  1	    | Transaction accepted |
 | 1	     | 0      |Wait                  |
 | 0	     |0	      |Idle                  |
```

This ensures controlled data transfer between master and memory.

## Testbench Description
### The testbench includes:
* Clock generation<br>
* Reset task<br>
* Write task<br>
* Read task<br>
* Multiple directed testcases<br>
* Backdoor memory access<br>
* Plusargs-based testcase selection<br>

### Testbench Features
#### Frontdoor Access
* Write using valid + wr_rd<br>
* Read using valid<br>

#### Backdoor Access
* $readmemh() → Load memory from file (data.hex)<br>
* $writememb() → Dump memory into file (output.bin)<br>

### Available Testcases

The testbench supports multiple scenarios using:
+testcase=<test_name>
Example Testcases:<br>
* Testcase	Description,<br>
* test_1wr_1rd	1 write, 1 read<br>
* test_5wr_5rd	5 writes, 5 reads<br>
* test_wr_rd	Full memory write and read<br>
* test_half_portion	Half memory access<br>
* test_bd_wr_bd_rd	Backdoor write & read<br>
* test_fd_wr_fd_rd	Frontdoor write & read<br>
* test_3/4_portion	75% memory access<br>
* test_1/4_portion	25% memory access<br>

## How to Run Simulation
Using ModelSim / QuestaSim
vlog memory1.v top.v
vsim top +testcase=test_5wr_5rd
run -all

Using VCS
vcs memory1.v top.v
./simv +testcase=test_5wr_5rd

### Project Structure
```
memory_project/
│
├── memory1.v        # RTL Design
├── top.v            # Testbench
├── data.hex         # Backdoor write input file
├── output.bin       # Backdoor read output file
└── README.md
```

### Verification Methodology

### The project verifies:
Basic write functionality<br>
Basic read functionality<br>
Partial memory access<br>
Full memory access<br>
Boundary conditions<br>
Backdoor memory operations<br>

### Tools Used
Verilog HDL
ModelSim / QuestaSim / VCS


