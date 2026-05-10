# waveform
## one_wr_one_rd

<img width="1820" height="262" alt="image" src="https://github.com/user-attachments/assets/710df615-0c19-4280-9b69-52fd82c70c6b" />





## Step 1 — Reset phase

### At beginning:

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

### Same cycle:
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

## mem_full_wr_full_rd
![Uploading Screenshot 2026-05-10 211107.png…]()
