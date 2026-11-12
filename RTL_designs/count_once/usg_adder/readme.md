# 7-Bit Ones Counter Using Full Adders (Verilog)

## 1. Project Overview

A **7-bit Ones Counter**, also called a Population Counter, is a combinational circuit that counts the total number of logic 1s present in a 7-bit binary input.

For example:

```text
Input  = 7'b1011011
Output = 5
```

The input contains five 1s, so the output is 5 (`3'b101`).

**Objective:** Design a 7-bit Ones Counter using Full Adders instead of directly adding all input bits.

## 2. Understanding the Concept

A Full Adder is a combinational circuit that adds three 1-bit inputs:

- A
- B
- Cin (Carry-in)

It produces two outputs:

- Sum
- Carry

### Full Adder Truth Table

| A | B | Cin | Sum | Carry |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 | 0 |
| 0 | 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 | 1 |
| 1 | 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 1 | 1 |

### Full Adder Equations

```verilog
Sum   = A ^ B ^ Cin;

Carry = (A & B) | (B & Cin) | (A & Cin);
```

**Important concept: Binary Weight**

In binary representation, each bit position has a weight:

| Bit position | 2 | 1 | 0 |
|---|---|---|---|
| Weight | 4 | 2 | 1 |

For a Full Adder:

- Sum retains the same weight as its inputs.
- Carry gets twice the weight of its inputs.

For example:

If all three inputs have weight 1:

```text
1 + 1 + 1 = 3

3 = 2'b11

Sum   = 1 (Weight 1)
Carry = 1 (Weight 2)
```

This concept is essential for connecting multiple Full Adders correctly.

## 3. Logic Design

We have seven input bits:

```text
i[6], i[5], i[4], i[3], i[2], i[1], i[0]
```

Initially, every input bit has weight 1.

We use four Full Adders to count the number of 1s.

### Step 1: First Level – FA1 and FA2

Divide the seven input bits into two groups of three.

**FA1:**

```verilog
full_adder fa1(i[0],i[1],i[2],s1,c1);
```

FA1 adds three input bits:

```text
i[0] + i[1] + i[2]

       FA1
      /   \
    s1     c1
```

Outputs:
- s1 → Weight 1
- c1 → Weight 2

**FA2:**

```verilog
full_adder fa2(i[3],i[4],i[5],s2,c2);
```

FA2 adds the next three input bits.

Outputs:
- s2 → Weight 1
- c2 → Weight 2

The remaining input bit i[6] is not used yet.

After the first level:

| Weight | Available signals |
|---|---|
| 1 | s1, s2, i[6] |
| 2 | c1, c2 |

### Step 2: Second Level – FA3

Now add the three signals having weight 1:

```verilog
full_adder fa3(s1,s2,i[6],s3,c3);
```

Why these three signals?

Because s1, s2 and i[6] all have weight 1.

FA3 produces:

- s3 → Weight 1
- c3 → Weight 2

After FA3:

| Weight | Available signals |
|---|---|
| 1 | s3 |
| 2 | c1, c2, c3 |

### Step 3: Third Level – FA4

Now we have three signals with weight 2:

```verilog
full_adder fa4(c1,c2,c3,s4,c4);
```

Why are we adding c1, c2 and c3?

Because all three carry signals have weight 2.

FA4 produces:

- s4 → Weight 2
- c4 → Weight 4
