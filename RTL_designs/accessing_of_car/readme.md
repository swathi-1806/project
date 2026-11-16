# 4-Bit Priority-Based Car Access Controller

## 1. Project Overview

The **Priority-Based Car Access Controller** is a Verilog HDL project that allows only one family member to access a shared car at a time.

Four family members can request access simultaneously. The controller checks their requests according to a predefined priority order and grants access to the highest-priority requester.

The design uses a **4-bit input request signal** and a **3-bit binary encoded output**.

## 2. Priority Order

The access priority is:

1. Father – Highest Priority
2. Mother
3. Daughter
4. Son – Lowest Priority

If multiple family members request access simultaneously, only the highest-priority requester receives access.

## 3. Input and Output Specifications

| Signal | Width | Description |
|---|---:|---|
| `D[3:0]` | 4 bits | Access request inputs |
| `Y[2:0]` | 3 bits | Encoded access grant output |

### Input Mapping

| Input | Family Member |
|---|---|
| `D[3]` | Father |
| `D[2]` | Mother |
| `D[1]` | Daughter |
| `D[0]` | Son |

### Output Encoding

| Output `Y[2:0]` | Access Granted To |
|---|---|
| `001` | Father |
| `010` | Mother |
| `011` | Daughter |
| `100` | Son |
| `000` | Nobody |

## 4. Working Principle

The controller uses an `if-else if` priority structure.

- First, it checks whether the Father has requested access.
- If not, it checks the Mother's request.
- Next, it checks the Daughter's request.
- Finally, it checks the Son's request.
- If no one requests access, the output is `000`.

**Example:**

If the input is:

```verilog
D = 4'b1011;
```

The requests are:

- Father = 1
- Mother = 0
- Daughter = 1
- Son = 1

Since Father has the highest priority, the output is:

```verilog
Y = 3'b001;
```

Only Father receives access.

## 5. Design Implementation

The RTL is implemented using Verilog HDL with a combinational `always @(*)` block.

### Design Features

- 4-bit request input.
- 3-bit binary encoded output.
- Fixed priority-based access control.
- Supports simultaneous requests.
- Only one access grant at a time.
- No clock required because the design is combinational.

## 6. Verification Methodology

A self-checking Verilog testbench is developed to verify the functionality of the design.

The testbench includes:

1. **Directed Testing:** Applies input combinations to the DUT.
2. **Exhaustive Testing:** Tests all 16 possible input combinations.
3. **Reference Model:** Calculates the expected output independently of the DUT instance.
4. **Output Comparison:** Compares actual and expected outputs.
5. **PASS/FAIL Reporting:** Counts successful and failed test cases.
6. **Functional Coverage:** Tracks the number of input combinations tested.

### Verification Summary

| Verification Feature | Implementation |
|---|---|
| Test input generation | Directed |
| Total input combinations | 16 |
| Reference model | Yes |
| Self-checking testbench | Yes |
| PASS/FAIL counters | Yes |
| Input functional coverage | Yes |
| Random testing | Not implemented |
| Assertions | Not implemented |
| Waveform analysis | Optional |

## 7. Expected Simulation Results

For a correct DUT, all 16 input combinations should pass.

| Input Combinations | Expected Output |
|---|---|
| `0000` | `000` |
| `0001` | `100` |
| `0010` | `011` |
| `0011` | `011` |
| `0100` | `010` |
| `0101` | `010` |
| `0110` | `010` |
| `0111` | `010` |
| `1000` to `1111` | `001` |

### Expected Verification Summary

```text
PASS COUNT     = 16
FAIL COUNT     = 0
INPUT COVERAGE = 16 / 16
OVERALL RESULT = PASS
```

## 8. Tools Used

- **HDL:** Verilog
- **Simulation:** QuestaSim / ModelSim
- **Code Editor:** GVim
- **Version Control:** Git and GitHub

## 9. Key Learning Outcomes

Through this project, I practiced:

- Designing combinational logic using Verilog.
- Understanding priority-based decision-making.
- Implementing binary output encoding.
- Developing a reference model.
- Writing a self-checking testbench.
- Applying exhaustive testing.
- Implementing manual functional coverage counters.
- Analyzing simulation results.

## 10.output
- D=0000 Y=000 EXPECTED=000 PASS
- D=0001 Y=100 EXPECTED=100 PASS
--D=0010 Y=011 EXPECTED=011 PASS
- D=0011 Y=011 EXPECTED=011 PASS
- D=0100 Y=010 EXPECTED=010 PASS
- D=0101 Y=010 EXPECTED=010 PASS
- D=0110 Y=010 EXPECTED=010 PASS
- D=0111 Y=010 EXPECTED=010 PASS
- D=1000 Y=001 EXPECTED=001 PASS
- D=1001 Y=001 EXPECTED=001 PASS
- D=1010 Y=001 EXPECTED=001 PASS
- D=1011 Y=001 EXPECTED=001 PASS
- D=1100 Y=001 EXPECTED=001 PASS
- D=1101 Y=001 EXPECTED=001 PASS
- D=1110 Y=001 EXPECTED=001 PASS
- D=1111 Y=001 EXPECTED=001 PASS
- --------------------------------------
- VERIFICATION SUMMARY
- --------------------------------------
- PASS COUNT     = 16
- FAIL COUNT     = 0
- INPUT COVERAGE = 16 / 16
- OVERALL RESULT = PASS
- --------------------------------------

## 11. Future Enhancements

- Add constrained or directed-random stimulus.
- Add SystemVerilog assertions.
- Improve functional coverage.
- Verify unknown (`X`) and high-impedance (`Z`) input conditions.
- Develop a SystemVerilog-based verification environment.

---

**Project Type:** RTL Design and Functional Verification  
**Domain:** Digital Design and Design Verification  
**Language:** Verilog HDL
