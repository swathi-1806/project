### waveform

<img width="1304" height="454" alt="Screenshot 2026-05-04 202457" src="https://github.com/user-attachments/assets/099d6e4b-4366-47ff-a9b3-f98e4fa9d5d8" />




## Step 1 — Reset phase

# At beginning:

* rst = 1
* ready = 0
* rdata = 0
* Memory is cleared (from your RTL)
Nothing happens here. Correct.

## Step 2 — First VALID transaction (WRITE)

* valid = 1
* wr_rd = 1 → WRITE
* addr = 0x4 (100 in binary shown)
* wdata = 0x00000007 (shown as 111)

# Same cycle:
DUT sets ready = 1
From your RTL:

if(valid) begin
  ready = 1;
  if(wr_rd) mem[addr] = wdata;

So memory now contains:
mem[4] = 7

Then driver drops:

* valid = 0
* wr_rd = 0
* wdata = 0

## Step 3 — Next VALID transaction (READ)

* valid = 1
* wr_rd = 0 → READ
* addr = same 4

DUT executes:
else rdata = mem[addr];
So:
rdata = mem[4] = 7
And you see on waveform:
rdata = 111
Exactly what was written earlier.


