# UVM Verification of Memory
This project demonstrates UVM-based verification of a simple memory DUT.
The goal of this project is to verify that data written into memory is correctly read back using reusable UVM sequences and proper address tracking.

## Verification Goal

When performing read operations, the data must be fetched from the same address where write operations were previously done.

To achieve this:
* Write addresses are stored
* Read operations use the same stored addresses
* Reusable sequences are created for write and read
* Multiple test scenarios are verified


## Reusable Sequences

Instead of writing separate sequences for each test, reusable sequences are created:

* mem_wr_seq-->	Performs N write operations
* mem_rd_seq-->	Performs N read operations from stored addresses

These sequences are controlled using:
* wr_count
* rd_count

## Address Tracking Mechanism (Mailbox)

To make sure read happens from the same location as write:

* During WRITE → address is stored into a mailbox
* During READ → address is taken from the same mailbox

This ensures correct data comparison and functional verification

## Implemented Test Cases
### MEM_1WR_1RD
* Perform 1 write
* Perform 1 read from same address

<img width="1834" height="242" alt="image" src="https://github.com/user-attachments/assets/2227970f-1e56-4252-8fd5-eccf29aa1a2e" />
### write
* wr_rd = 1
* addr  = 'hf
* wdata = 'hec826818
### read
* wr_rd = 0
* addr  = 'hf
* rdata = 'hec826818

### MEM_5WR_5RD
* Perform 5 writes
* Perform 5 reads from same addresses in same order
<img width="1835" height="244" alt="image" src="https://github.com/user-attachments/assets/920043de-c669-4e2a-a1a6-41e31a7448a5" />
### write
wr_rd | addr | wdata    |
------------------------
1     |  hf  |'hec826818|  
1     |  h2  |'hd6dadd1c|
1     |  hd  |'hb4db4bfa|
1     |  h5  |'h2a517247|
1     |  h6  |'h259ef30e|

### read
wr_rd | addr | rdata    |
-------------------------
0     |  hf  |'hec826818|  
0     |  h2  |'hd6dadd1c|
0     |  hd  |'hb4db4bfa|
0     |  h5  |'h2a517247|
0     |  h6  |'h259ef30e|

### MEM_1WR_1RD_1WR_1RD

Sequence:
* Write → Read → Write → Read
This verifies mailbox reuse across multiple sequence calls.
<img width="1836" height="251" alt="image" src="https://github.com/user-attachments/assets/9b954dec-31d5-49d3-9b72-c447b835d767" />
* wr-->addr=hf || wdata = 'hec826818
* rd-->addr=hf || rdata = 'hec826818
* wr-->addr=h2 || wdata = 'hd6dadd1c 
* rd-->addr=h2 || rdata = 'hd6dadd1c  
 

### MEM_PARALLEL_WR_RD
* Write and Read sequences run in parallel using fork...join
* Verifies synchronization and address sharing

## Project Structure
```
mem_seq_lib.sv       → write/read sequences
mem_test_lib.sv      → test cases
mem_env.sv           → environment
mem_agent.sv         → agent
mem_drv.sv           → driver
mem_mon.sv           → monitor
mem_tx.sv            → transaction
```

## Tools & Technologies Used
Category	 | Tool / Language	                        |Purpose                                    |
---------------------------------------------------------------------------------------------------
Language	 |SystemVerilog	                            |RTL + UVM Testbench development            |
Methodology|	UVM (Universal Verification Methodology)|	Structured verification environment       |
Simulator	 |EDA Playground	                          |Compile, run, and debug simulations online |
Editor	   |GVim	                                    |Writing and editing SV/UVM code            |

## Key Learnings From This Project
* Reusable sequences using wr_count and rd_count
* Mailbox usage for inter-sequence communication
* Proper UVM driver timing with handshake signals
* Running sequences sequentially and in parallel
* Debugging waveform vs log mismatch
* Understanding why read was not visible in waveform









