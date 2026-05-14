interface fifo_interface(input logic wr_clk, input logic rd_clk, input logic rst);

 logic wr_en;
  logic [11:0] wdata;
  logic full, overflow;

  logic rd_en;
  logic [11:0] rdata;
  logic empty, underflow;
  
endinterface

