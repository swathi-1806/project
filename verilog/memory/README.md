# Memory Design with Valid-Ready Protocol (Verilog)
Project Overview

This project implements a parameterized single-port synchronous memory in Verilog with a valid-ready handshake protocol.

## The design supports:

Controlled read/write operations
Reset-based memory initialization
Directed test cases
Frontdoor and Backdoor memory access
A self-checking style testbench with multiple test scenarios is included.

## Design Specifications
### Parameters
Parameter	Description	Default Value
DEPTH	Number of memory locations	16
WIDTH	Data width	8
ADDR_WIDTH	Calculated using $clog2(DEPTH)	Auto
### Port Description
#### Inputs
 clk → Clock signal
 rst → Active high reset
 wr_rd → Write/Read control
       1 → Write
       0 → Read
valid → Request signal
addr → Address input
wdata → Write data
#### Outputs
rdata → Read data
ready → Response signal

### Design Functionality
#### Reset Condition
When rst = 1:
rdata = 0
ready = 0
Entire memory array is cleared to zero

#### Normal Operation (On posedge clk)
If valid = 1:
ready = 1
If wr_rd = 1 → Write operation
mem[addr] = wdata
If wr_rd = 0 → Read operation
rdata = mem[addr]
If valid = 0:
ready = 0

#### Valid-Ready Handshake Protocol
The design follows a simple handshake mechanism:

valid	  ready	  Operation
1	        1	      Transaction accepted
1	        0      	Wait
0	        0	      Idle

This ensures controlled data transfer between master and memory.

## Testbench Description
### The testbench includes:
Clock generation
Reset task
Write task
Read task
Multiple directed testcases
Backdoor memory access
Plusargs-based testcase selection

### Testbench Features
#### Frontdoor Access
Write using valid + wr_rd
Read using valid

#### Backdoor Access
$readmemh() → Load memory from file (data.hex)
$writememb() → Dump memory into file (output.bin)

### Available Testcases

The testbench supports multiple scenarios using:
+testcase=<test_name>
Example Testcases:
Testcase	Description
test_1wr_1rd	1 write, 1 read
test_5wr_5rd	5 writes, 5 reads
test_wr_rd	Full memory write and read
test_half_portion	Half memory access
test_bd_wr_bd_rd	Backdoor write & read
test_fd_wr_fd_rd	Frontdoor write & read
test_3/4_portion	75% memory access
test_1/4_portion	25% memory access

## How to Run Simulation
Using ModelSim / QuestaSim
vlog memory1.v top.v
vsim top +testcase=test_5wr_5rd
run -all

Using VCS
vcs memory1.v top.v
./simv +testcase=test_5wr_5rd

### Project Structure
memory_project/
│
├── memory1.v        # RTL Design
├── memory1_tb.v          # Testbench
├── data.hex         # Backdoor write input file
├── output.bin       # Backdoor read output file
└── README.md

### Verification Methodology

### The project verifies:
Basic write functionality
Basic read functionality
Partial memory access
Full memory access
Boundary conditions
Backdoor memory operations

### Tools Used
Verilog HDL
ModelSim / QuestaSim / VCS


