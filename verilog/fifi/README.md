#  Synchronous FIFO Design and Verification (Verilog)

##  Project Overview
This project implements a **parameterized Synchronous FIFO (First-In First-Out)** memory using Verilog HDL along with a self-checking testbench.
The FIFO supports configurable **data width** and **depth**, and includes status flags such as **full, empty, overflow, and underflow**.
The design is verified using multiple directed testcases controlled via **plusargs**.

---
## 🎯 Features
* Parameterized FIFO Depth and Data Width
* Synchronous Read and Write Operations
* Full and Empty Detection Logic
* Overflow and Underflow Protection
* Toggle-based Pointer Mechanism
* Directed Testcases using `$value$plusargs`
* Modular Testbench with Tasks
* Random Data Generation
* Clear Debug Prints

---

## 🏗️ Design Specifications

| Parameter  | Description                     | Default |
| ---------- | ------------------------------- | ------- |
| DEPTH      | FIFO storage size               | 16      |
| DATA_WIDTH | Width of each data word         | 8 / 12  |
| PTR_WIDTH  | Pointer width (`$clog2(DEPTH)`) | Auto    |

---

## ⚙️ FIFO Architecture

The FIFO uses:

* Memory Array → Data Storage
* Write Pointer → Tracks write location
* Read Pointer → Tracks read location
* Toggle Flags → Distinguish Full vs Empty condition
* Status Flags:

  * `full`
  * `empty`
  * `overflow`
  * `underflow`

Full and Empty are detected using:

```
wr_ptr == rd_ptr AND toggle mismatch → FULL
wr_ptr == rd_ptr AND toggle match → EMPTY
```

---

## 📂 Project Structure

```
sync_fifo_project/
│
├── sync_fifo.v      # FIFO RTL Design
├── tb_fifo.v        # Testbench
└── README.md        # Documentation
```

---

## 🧪 Testbench Methodology

The testbench includes reusable tasks:

* `reset_fifo()` → Reset DUT
* `write_fifo()` → Perform write operations
* `read_fifo()` → Perform read operations
* `print_function()` → Display FIFO status

Testcases are selected using command-line arguments.
Example:
```
+testcase=test_5wr_5rd
```

---

## Supported Testcases

| Testcase                | Description             |
| ----------------------- | ----------------------- |
| test_1wr                | Single write            |
| test_5wr                | Multiple writes         |
| test_nwr                | Write up to FIFO depth  |
| test_1wr_1rd            | Single write and read   |
| test_5wr_5rd            | Multiple write and read |
| test_full               | FIFO full condition     |
| test_overflow           | Overflow scenario       |
| test_empty              | FIFO empty condition    |
| test_underflow          | Underflow scenario      |
| test_overflow_underflow | Combined scenario       |

---

## Simulation Instructions
### Compile
```
vlog sync_fifo.v tb_fifo.v
```

### Run Simulation
```
vsim top +testcase=test_5wr_5rd
run -all
```

---
## Expected Behavior

* Writes stop when FIFO becomes full
* Reads stop when FIFO becomes empty
* Overflow flag asserted on invalid write
* Underflow flag asserted on invalid read

---

## Key Learning Outcomes

* FIFO Design Fundamentals
* Pointer Management Techniques
* Full/Empty Detection Logic
* Parameterized Hardware Design
* Testbench Development
* Plusargs Usage
* Debugging and Verification Skills

---

## Future Improvements

* SystemVerilog Assertions (SVA)
* Functional Coverage
* UVM Testbench Integration
* Scoreboard Implementation
* Asynchronous FIFO Version

---



