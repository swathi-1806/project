
# 4-bit ALU Verification using UVM
<img width="1846" height="182" alt="Screenshot 2026-05-20 232102" src="https://github.com/user-attachments/assets/a7371aaf-edc0-4f27-8277-38196999bcba" />


<img width="1836" height="562" alt="Screenshot 2026-05-20 232027" src="https://github.com/user-attachments/assets/dd1ceb90-1dd4-4518-a05d-a65bb6fed617" />

## Overview
This project verifies a 4-bit ALU design using the UVM (Universal Verification Methodology) framework in SystemVerilog.

The ALU supports:
- AND
- OR
- XOR
- ADD
- SUB

A complete UVM testbench environment is implemented including:
- Sequence
- Sequencer
- Driver
- Monitor
- coverage
- Agent
- scoreboard
- Environment
- Scoreboard
- Test

---

# DUT Description

## Inputs
| Signal | Width | Description |
|---|---|---|
| a | 4-bit | Input operand A |
| b | 4-bit | Input operand B |
| opcode | 3-bit | Operation select |

## Output
| Signal | Width | Description |
|---|---|---|
| result | 4-bit | ALU output |

---

# Opcode Table

| Opcode | Operation |
|---|---|
| 000 | AND |
| 001 | OR |
| 010 | XOR |
| 011 | ADD |
| 100 | SUB |

---

# Project Structure

```text
.
├── alu_4bit.sv
├── alu_interface.sv
├── alu_assert.sv
├── alu_tx.sv
├── alu_seq.sv
├── alu_drv.sv
├── alu_mon.sv
├── alu_coverage.sv
├── alu_sbd.sv
├── alu_agent.sv
├── alu_env.sv
├── alu_test.sv
├── tb.sv
└── README.md
```

---

# UVM Architecture

```text
Sequence
   ↓
Sequencer
   ↓
Driver
   ↓
DUT
   ↓
Monitor
   ↓
Scoreboard
```

---

# Components Description

## Sequence
Generates randomized ALU transactions.

## Driver
Receives transactions from sequencer and drives DUT signals through the virtual interface.

## Monitor
Samples DUT activity and sends transactions to the scoreboard.

## coverage
Functional coverage is used to measure whether all operations and input combinations are exercised

## Scoreboard
Implements a golden reference model and compares expected output with DUT output.

## Agent
Contains:
- Driver
- Monitor
- Sequencer

## Environment
Contains:
- Agent
- Scoreboard

## Test
Starts the ALU sequence.

---

# Concepts Learned

- UVM Testbench Architecture
- Transaction-Level Modeling
- Driver and Monitor
- Virtual Interface
- Clocking Block
- Scoreboard Checking
- Randomized Verification
- Golden Reference Model

---
