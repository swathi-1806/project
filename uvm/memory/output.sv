# UVM_INFO /usr/share/questa/questasim/verilog_src/questa_uvm_pkg-1.2/src/questa_uvm_pkg.sv(277) @ 0: reporter [Questa UVM] QUESTA_UVM-1.2.3
# UVM_INFO /usr/share/questa/questasim/verilog_src/questa_uvm_pkg-1.2/src/questa_uvm_pkg.sv(278) @ 0: reporter [Questa UVM]  questa_uvm::init(+struct)
# UVM_INFO @ 0: reporter [RNTST] Running test mem_full_wr_full_rd_test...
# UVM_INFO /usr/share/questa/questasim/verilog_src/uvm-1.2/src/base/uvm_root.svh(579) @ 0: reporter [UVMTOP] UVM testbench topology:
# ----------------------------------------------------------------
# Name                       Type                      Size  Value
# ----------------------------------------------------------------
# uvm_test_top               mem_full_wr_full_rd_test  -     @360 
#   env_h                    mem_env                   -     @372 
#     agt_h                  mem_agent                 -     @380 
#       cov_h                mem_cov                   -     @563 
#         analysis_imp       uvm_analysis_imp          -     @571 
#       drv_h                mem_drv                   -     @414 
#         rsp_port           uvm_analysis_port         -     @431 
#         seq_item_port      uvm_seq_item_pull_port    -     @422 
#       mon_h                mem_mon                   -     @406 
#         mon_ap_h           uvm_analysis_port         -     @581 
#       sqr_h                uvm_sequencer             -     @440 
#         rsp_export         uvm_analysis_export       -     @448 
#         seq_item_export    uvm_seq_item_pull_imp     -     @554 
#         arbitration_queue  array                     0     -    
#         lock_queue         array                     0     -    
#         num_last_reqs      integral                  32    'd1  
#         num_last_rsps      integral                  32    'd1  
#     sbd_h                  mem_sbd                   -     @388 
#       analysis_imp         uvm_analysis_imp          -     @396 
# ----------------------------------------------------------------
# 
# UVM_INFO mem_base_seq.sv(73) @ 20000: uvm_test_top.env_h.agt_h.sqr_h@@seq_h [seq] pre_body
# UVM_INFO mem_base_seq.sv(76) @ 20000: uvm_test_top.env_h.agt_h.sqr_h@@seq_h [seq] RND_UNQ_ADDR ='{6, 11, 3, 14, 12, 7, 5, 2, 0, 15, 4, 9, 10, 8, 1, 13}
# UVM_INFO mem_drv.sv(41) @ 35000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = WR||ADDR=6||DATA=8ee14ec4
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @652                                
#   wr_rd                        integral  1     'h1                                 
#   wdata                        integral  32    'h8ee14ec4                          
#   rdata                        integral  32    'h0                                 
#   addr                         integral  4     'h6                                 
#   begin_time                   time      64    20000                               
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h1       
#   wdata  integral  32    'h8ee14ec4
#   rdata  integral  32    'h0       
#   addr   integral  4     'h6       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 35000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = WR||ADDR=6||DATA=8ee14ec4
# UVM_INFO mem_sbd.sv(24) @ 35000: uvm_test_top.env_h.sbd_h [SBD] WRITE stored: ADDR=6 DATA=8ee14ec4
# UVM_INFO mem_drv.sv(41) @ 55000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = WR||ADDR=b||DATA=27ec2711
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @663                                
#   wr_rd                        integral  1     'h1                                 
#   wdata                        integral  32    'h27ec2711                          
#   rdata                        integral  32    'h0                                 
#   addr                         integral  4     'hb                                 
#   begin_time                   time      64    35000                               
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h1       
#   wdata  integral  32    'h27ec2711
#   rdata  integral  32    'h0       
#   addr   integral  4     'hb       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 55000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = WR||ADDR=b||DATA=27ec2711
# UVM_INFO mem_sbd.sv(24) @ 55000: uvm_test_top.env_h.sbd_h [SBD] WRITE stored: ADDR=b DATA=27ec2711
# UVM_INFO mem_drv.sv(41) @ 75000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = WR||ADDR=3||DATA=f265a41c
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @673                                
#   wr_rd                        integral  1     'h1                                 
#   wdata                        integral  32    'hf265a41c                          
#   rdata                        integral  32    'h0                                 
#   addr                         integral  4     'h3                                 
#   begin_time                   time      64    55000                               
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h1       
#   wdata  integral  32    'hf265a41c
#   rdata  integral  32    'h0       
#   addr   integral  4     'h3       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 75000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = WR||ADDR=3||DATA=f265a41c
# UVM_INFO mem_sbd.sv(24) @ 75000: uvm_test_top.env_h.sbd_h [SBD] WRITE stored: ADDR=3 DATA=f265a41c
# UVM_INFO mem_drv.sv(41) @ 95000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = WR||ADDR=e||DATA=48a0cd84
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @683                                
#   wr_rd                        integral  1     'h1                                 
#   wdata                        integral  32    'h48a0cd84                          
#   rdata                        integral  32    'h0                                 
#   addr                         integral  4     'he                                 
#   begin_time                   time      64    75000                               
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h1       
#   wdata  integral  32    'h48a0cd84
#   rdata  integral  32    'h0       
#   addr   integral  4     'he       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 95000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = WR||ADDR=e||DATA=48a0cd84
# UVM_INFO mem_sbd.sv(24) @ 95000: uvm_test_top.env_h.sbd_h [SBD] WRITE stored: ADDR=e DATA=48a0cd84
# UVM_INFO mem_drv.sv(41) @ 115000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = WR||ADDR=c||DATA=739e2f1c
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @693                                
#   wr_rd                        integral  1     'h1                                 
#   wdata                        integral  32    'h739e2f1c                          
#   rdata                        integral  32    'h0                                 
#   addr                         integral  4     'hc                                 
#   begin_time                   time      64    95000                               
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h1       
#   wdata  integral  32    'h739e2f1c
#   rdata  integral  32    'h0       
#   addr   integral  4     'hc       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 115000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = WR||ADDR=c||DATA=739e2f1c
# UVM_INFO mem_sbd.sv(24) @ 115000: uvm_test_top.env_h.sbd_h [SBD] WRITE stored: ADDR=c DATA=739e2f1c
# UVM_INFO mem_drv.sv(41) @ 135000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = WR||ADDR=7||DATA=d9f37e54
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @703                                
#   wr_rd                        integral  1     'h1                                 
#   wdata                        integral  32    'hd9f37e54                          
#   rdata                        integral  32    'h0                                 
#   addr                         integral  4     'h7                                 
#   begin_time                   time      64    115000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h1       
#   wdata  integral  32    'hd9f37e54
#   rdata  integral  32    'h0       
#   addr   integral  4     'h7       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 135000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = WR||ADDR=7||DATA=d9f37e54
# UVM_INFO mem_sbd.sv(24) @ 135000: uvm_test_top.env_h.sbd_h [SBD] WRITE stored: ADDR=7 DATA=d9f37e54
# UVM_INFO mem_drv.sv(41) @ 155000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = WR||ADDR=5||DATA=d08a7e93
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @713                                
#   wr_rd                        integral  1     'h1                                 
#   wdata                        integral  32    'hd08a7e93                          
#   rdata                        integral  32    'h0                                 
#   addr                         integral  4     'h5                                 
#   begin_time                   time      64    135000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h1       
#   wdata  integral  32    'hd08a7e93
#   rdata  integral  32    'h0       
#   addr   integral  4     'h5       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 155000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = WR||ADDR=5||DATA=d08a7e93
# UVM_INFO mem_sbd.sv(24) @ 155000: uvm_test_top.env_h.sbd_h [SBD] WRITE stored: ADDR=5 DATA=d08a7e93
# UVM_INFO mem_drv.sv(41) @ 175000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = WR||ADDR=2||DATA=214096bc
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @723                                
#   wr_rd                        integral  1     'h1                                 
#   wdata                        integral  32    'h214096bc                          
#   rdata                        integral  32    'h0                                 
#   addr                         integral  4     'h2                                 
#   begin_time                   time      64    155000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h1       
#   wdata  integral  32    'h214096bc
#   rdata  integral  32    'h0       
#   addr   integral  4     'h2       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 175000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = WR||ADDR=2||DATA=214096bc
# UVM_INFO mem_sbd.sv(24) @ 175000: uvm_test_top.env_h.sbd_h [SBD] WRITE stored: ADDR=2 DATA=214096bc
# UVM_INFO mem_drv.sv(41) @ 195000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = WR||ADDR=0||DATA=46acac2a
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @733                                
#   wr_rd                        integral  1     'h1                                 
#   wdata                        integral  32    'h46acac2a                          
#   rdata                        integral  32    'h0                                 
#   addr                         integral  4     'h0                                 
#   begin_time                   time      64    175000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h1       
#   wdata  integral  32    'h46acac2a
#   rdata  integral  32    'h0       
#   addr   integral  4     'h0       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 195000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = WR||ADDR=0||DATA=46acac2a
# UVM_INFO mem_sbd.sv(24) @ 195000: uvm_test_top.env_h.sbd_h [SBD] WRITE stored: ADDR=0 DATA=46acac2a
# UVM_INFO mem_drv.sv(41) @ 215000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = WR||ADDR=f||DATA=85280f8b
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @743                                
#   wr_rd                        integral  1     'h1                                 
#   wdata                        integral  32    'h85280f8b                          
#   rdata                        integral  32    'h0                                 
#   addr                         integral  4     'hf                                 
#   begin_time                   time      64    195000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h1       
#   wdata  integral  32    'h85280f8b
#   rdata  integral  32    'h0       
#   addr   integral  4     'hf       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 215000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = WR||ADDR=f||DATA=85280f8b
# UVM_INFO mem_sbd.sv(24) @ 215000: uvm_test_top.env_h.sbd_h [SBD] WRITE stored: ADDR=f DATA=85280f8b
# UVM_INFO mem_drv.sv(41) @ 235000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = WR||ADDR=4||DATA=9bb621ec
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @753                                
#   wr_rd                        integral  1     'h1                                 
#   wdata                        integral  32    'h9bb621ec                          
#   rdata                        integral  32    'h0                                 
#   addr                         integral  4     'h4                                 
#   begin_time                   time      64    215000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h1       
#   wdata  integral  32    'h9bb621ec
#   rdata  integral  32    'h0       
#   addr   integral  4     'h4       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 235000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = WR||ADDR=4||DATA=9bb621ec
# UVM_INFO mem_sbd.sv(24) @ 235000: uvm_test_top.env_h.sbd_h [SBD] WRITE stored: ADDR=4 DATA=9bb621ec
# UVM_INFO mem_drv.sv(41) @ 255000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = WR||ADDR=9||DATA=6a0f84b4
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @763                                
#   wr_rd                        integral  1     'h1                                 
#   wdata                        integral  32    'h6a0f84b4                          
#   rdata                        integral  32    'h0                                 
#   addr                         integral  4     'h9                                 
#   begin_time                   time      64    235000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h1       
#   wdata  integral  32    'h6a0f84b4
#   rdata  integral  32    'h0       
#   addr   integral  4     'h9       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 255000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = WR||ADDR=9||DATA=6a0f84b4
# UVM_INFO mem_sbd.sv(24) @ 255000: uvm_test_top.env_h.sbd_h [SBD] WRITE stored: ADDR=9 DATA=6a0f84b4
# UVM_INFO mem_drv.sv(41) @ 275000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = WR||ADDR=a||DATA=e81e11fb
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @773                                
#   wr_rd                        integral  1     'h1                                 
#   wdata                        integral  32    'he81e11fb                          
#   rdata                        integral  32    'h0                                 
#   addr                         integral  4     'ha                                 
#   begin_time                   time      64    255000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h1       
#   wdata  integral  32    'he81e11fb
#   rdata  integral  32    'h0       
#   addr   integral  4     'ha       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 275000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = WR||ADDR=a||DATA=e81e11fb
# UVM_INFO mem_sbd.sv(24) @ 275000: uvm_test_top.env_h.sbd_h [SBD] WRITE stored: ADDR=a DATA=e81e11fb
# UVM_INFO mem_drv.sv(41) @ 295000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = WR||ADDR=8||DATA=7e6049f8
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @783                                
#   wr_rd                        integral  1     'h1                                 
#   wdata                        integral  32    'h7e6049f8                          
#   rdata                        integral  32    'h0                                 
#   addr                         integral  4     'h8                                 
#   begin_time                   time      64    275000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h1       
#   wdata  integral  32    'h7e6049f8
#   rdata  integral  32    'h0       
#   addr   integral  4     'h8       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 295000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = WR||ADDR=8||DATA=7e6049f8
# UVM_INFO mem_sbd.sv(24) @ 295000: uvm_test_top.env_h.sbd_h [SBD] WRITE stored: ADDR=8 DATA=7e6049f8
# UVM_INFO mem_drv.sv(41) @ 315000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = WR||ADDR=1||DATA=19d072a4
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @793                                
#   wr_rd                        integral  1     'h1                                 
#   wdata                        integral  32    'h19d072a4                          
#   rdata                        integral  32    'h0                                 
#   addr                         integral  4     'h1                                 
#   begin_time                   time      64    295000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h1       
#   wdata  integral  32    'h19d072a4
#   rdata  integral  32    'h0       
#   addr   integral  4     'h1       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 315000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = WR||ADDR=1||DATA=19d072a4
# UVM_INFO mem_sbd.sv(24) @ 315000: uvm_test_top.env_h.sbd_h [SBD] WRITE stored: ADDR=1 DATA=19d072a4
# UVM_INFO mem_drv.sv(41) @ 335000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = WR||ADDR=d||DATA=7dfef53c
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @803                                
#   wr_rd                        integral  1     'h1                                 
#   wdata                        integral  32    'h7dfef53c                          
#   rdata                        integral  32    'h0                                 
#   addr                         integral  4     'hd                                 
#   begin_time                   time      64    315000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h1       
#   wdata  integral  32    'h7dfef53c
#   rdata  integral  32    'h0       
#   addr   integral  4     'hd       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 335000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = WR||ADDR=d||DATA=7dfef53c
# UVM_INFO mem_sbd.sv(24) @ 335000: uvm_test_top.env_h.sbd_h [SBD] WRITE stored: ADDR=d DATA=7dfef53c
# UVM_INFO mem_drv.sv(41) @ 355000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = RD||ADDR=6||DATA=8ee14ec4
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @813                                
#   wr_rd                        integral  1     'h0                                 
#   wdata                        integral  32    'h0                                 
#   rdata                        integral  32    'h8ee14ec4                          
#   addr                         integral  4     'h6                                 
#   begin_time                   time      64    335000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h0       
#   wdata  integral  32    'h7dfef53c
#   rdata  integral  32    'h8ee14ec4
#   addr   integral  4     'h6       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 355000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = RD||ADDR=6||DATA=8ee14ec4
# UVM_INFO mem_sbd.sv(36) @ 355000: uvm_test_top.env_h.sbd_h [SBD] MATCH: ADDR=6 EXP=8ee14ec4 ACT=8ee14ec4
# UVM_INFO mem_drv.sv(41) @ 375000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = RD||ADDR=b||DATA=27ec2711
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @823                                
#   wr_rd                        integral  1     'h0                                 
#   wdata                        integral  32    'h0                                 
#   rdata                        integral  32    'h27ec2711                          
#   addr                         integral  4     'hb                                 
#   begin_time                   time      64    355000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h0       
#   wdata  integral  32    'h7dfef53c
#   rdata  integral  32    'h27ec2711
#   addr   integral  4     'hb       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 375000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = RD||ADDR=b||DATA=27ec2711
# UVM_INFO mem_sbd.sv(36) @ 375000: uvm_test_top.env_h.sbd_h [SBD] MATCH: ADDR=b EXP=27ec2711 ACT=27ec2711
# UVM_INFO mem_drv.sv(41) @ 395000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = RD||ADDR=3||DATA=f265a41c
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @833                                
#   wr_rd                        integral  1     'h0                                 
#   wdata                        integral  32    'h0                                 
#   rdata                        integral  32    'hf265a41c                          
#   addr                         integral  4     'h3                                 
#   begin_time                   time      64    375000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h0       
#   wdata  integral  32    'h7dfef53c
#   rdata  integral  32    'hf265a41c
#   addr   integral  4     'h3       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 395000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = RD||ADDR=3||DATA=f265a41c
# UVM_INFO mem_sbd.sv(36) @ 395000: uvm_test_top.env_h.sbd_h [SBD] MATCH: ADDR=3 EXP=f265a41c ACT=f265a41c
# UVM_INFO mem_drv.sv(41) @ 415000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = RD||ADDR=e||DATA=48a0cd84
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @843                                
#   wr_rd                        integral  1     'h0                                 
#   wdata                        integral  32    'h0                                 
#   rdata                        integral  32    'h48a0cd84                          
#   addr                         integral  4     'he                                 
#   begin_time                   time      64    395000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h0       
#   wdata  integral  32    'h7dfef53c
#   rdata  integral  32    'h48a0cd84
#   addr   integral  4     'he       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 415000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = RD||ADDR=e||DATA=48a0cd84
# UVM_INFO mem_sbd.sv(36) @ 415000: uvm_test_top.env_h.sbd_h [SBD] MATCH: ADDR=e EXP=48a0cd84 ACT=48a0cd84
# UVM_INFO mem_drv.sv(41) @ 435000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = RD||ADDR=c||DATA=739e2f1c
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @853                                
#   wr_rd                        integral  1     'h0                                 
#   wdata                        integral  32    'h0                                 
#   rdata                        integral  32    'h739e2f1c                          
#   addr                         integral  4     'hc                                 
#   begin_time                   time      64    415000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h0       
#   wdata  integral  32    'h7dfef53c
#   rdata  integral  32    'h739e2f1c
#   addr   integral  4     'hc       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 435000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = RD||ADDR=c||DATA=739e2f1c
# UVM_INFO mem_sbd.sv(36) @ 435000: uvm_test_top.env_h.sbd_h [SBD] MATCH: ADDR=c EXP=739e2f1c ACT=739e2f1c
# UVM_INFO mem_drv.sv(41) @ 455000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = RD||ADDR=7||DATA=d9f37e54
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @863                                
#   wr_rd                        integral  1     'h0                                 
#   wdata                        integral  32    'h0                                 
#   rdata                        integral  32    'hd9f37e54                          
#   addr                         integral  4     'h7                                 
#   begin_time                   time      64    435000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h0       
#   wdata  integral  32    'h7dfef53c
#   rdata  integral  32    'hd9f37e54
#   addr   integral  4     'h7       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 455000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = RD||ADDR=7||DATA=d9f37e54
# UVM_INFO mem_sbd.sv(36) @ 455000: uvm_test_top.env_h.sbd_h [SBD] MATCH: ADDR=7 EXP=d9f37e54 ACT=d9f37e54
# UVM_INFO mem_drv.sv(41) @ 475000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = RD||ADDR=5||DATA=d08a7e93
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @873                                
#   wr_rd                        integral  1     'h0                                 
#   wdata                        integral  32    'h0                                 
#   rdata                        integral  32    'hd08a7e93                          
#   addr                         integral  4     'h5                                 
#   begin_time                   time      64    455000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h0       
#   wdata  integral  32    'h7dfef53c
#   rdata  integral  32    'hd08a7e93
#   addr   integral  4     'h5       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 475000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = RD||ADDR=5||DATA=d08a7e93
# UVM_INFO mem_sbd.sv(36) @ 475000: uvm_test_top.env_h.sbd_h [SBD] MATCH: ADDR=5 EXP=d08a7e93 ACT=d08a7e93
# UVM_INFO mem_drv.sv(41) @ 495000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = RD||ADDR=2||DATA=214096bc
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @883                                
#   wr_rd                        integral  1     'h0                                 
#   wdata                        integral  32    'h0                                 
#   rdata                        integral  32    'h214096bc                          
#   addr                         integral  4     'h2                                 
#   begin_time                   time      64    475000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h0       
#   wdata  integral  32    'h7dfef53c
#   rdata  integral  32    'h214096bc
#   addr   integral  4     'h2       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 495000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = RD||ADDR=2||DATA=214096bc
# UVM_INFO mem_sbd.sv(36) @ 495000: uvm_test_top.env_h.sbd_h [SBD] MATCH: ADDR=2 EXP=214096bc ACT=214096bc
# UVM_INFO mem_drv.sv(41) @ 515000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = RD||ADDR=0||DATA=46acac2a
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @893                                
#   wr_rd                        integral  1     'h0                                 
#   wdata                        integral  32    'h0                                 
#   rdata                        integral  32    'h46acac2a                          
#   addr                         integral  4     'h0                                 
#   begin_time                   time      64    495000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h0       
#   wdata  integral  32    'h7dfef53c
#   rdata  integral  32    'h46acac2a
#   addr   integral  4     'h0       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 515000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = RD||ADDR=0||DATA=46acac2a
# UVM_INFO mem_sbd.sv(36) @ 515000: uvm_test_top.env_h.sbd_h [SBD] MATCH: ADDR=0 EXP=46acac2a ACT=46acac2a
# UVM_INFO mem_drv.sv(41) @ 535000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = RD||ADDR=f||DATA=85280f8b
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @903                                
#   wr_rd                        integral  1     'h0                                 
#   wdata                        integral  32    'h0                                 
#   rdata                        integral  32    'h85280f8b                          
#   addr                         integral  4     'hf                                 
#   begin_time                   time      64    515000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h0       
#   wdata  integral  32    'h7dfef53c
#   rdata  integral  32    'h85280f8b
#   addr   integral  4     'hf       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 535000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = RD||ADDR=f||DATA=85280f8b
# UVM_INFO mem_sbd.sv(36) @ 535000: uvm_test_top.env_h.sbd_h [SBD] MATCH: ADDR=f EXP=85280f8b ACT=85280f8b
# UVM_INFO mem_drv.sv(41) @ 555000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = RD||ADDR=4||DATA=9bb621ec
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @913                                
#   wr_rd                        integral  1     'h0                                 
#   wdata                        integral  32    'h0                                 
#   rdata                        integral  32    'h9bb621ec                          
#   addr                         integral  4     'h4                                 
#   begin_time                   time      64    535000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h0       
#   wdata  integral  32    'h7dfef53c
#   rdata  integral  32    'h9bb621ec
#   addr   integral  4     'h4       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 555000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = RD||ADDR=4||DATA=9bb621ec
# UVM_INFO mem_sbd.sv(36) @ 555000: uvm_test_top.env_h.sbd_h [SBD] MATCH: ADDR=4 EXP=9bb621ec ACT=9bb621ec
# UVM_INFO mem_drv.sv(41) @ 575000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = RD||ADDR=9||DATA=6a0f84b4
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @923                                
#   wr_rd                        integral  1     'h0                                 
#   wdata                        integral  32    'h0                                 
#   rdata                        integral  32    'h6a0f84b4                          
#   addr                         integral  4     'h9                                 
#   begin_time                   time      64    555000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h0       
#   wdata  integral  32    'h7dfef53c
#   rdata  integral  32    'h6a0f84b4
#   addr   integral  4     'h9       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 575000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = RD||ADDR=9||DATA=6a0f84b4
# UVM_INFO mem_sbd.sv(36) @ 575000: uvm_test_top.env_h.sbd_h [SBD] MATCH: ADDR=9 EXP=6a0f84b4 ACT=6a0f84b4
# UVM_INFO mem_drv.sv(41) @ 595000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = RD||ADDR=a||DATA=e81e11fb
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @933                                
#   wr_rd                        integral  1     'h0                                 
#   wdata                        integral  32    'h0                                 
#   rdata                        integral  32    'he81e11fb                          
#   addr                         integral  4     'ha                                 
#   begin_time                   time      64    575000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h0       
#   wdata  integral  32    'h7dfef53c
#   rdata  integral  32    'he81e11fb
#   addr   integral  4     'ha       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 595000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = RD||ADDR=a||DATA=e81e11fb
# UVM_INFO mem_sbd.sv(36) @ 595000: uvm_test_top.env_h.sbd_h [SBD] MATCH: ADDR=a EXP=e81e11fb ACT=e81e11fb
# UVM_INFO mem_drv.sv(41) @ 615000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = RD||ADDR=8||DATA=7e6049f8
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @943                                
#   wr_rd                        integral  1     'h0                                 
#   wdata                        integral  32    'h0                                 
#   rdata                        integral  32    'h7e6049f8                          
#   addr                         integral  4     'h8                                 
#   begin_time                   time      64    595000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h0       
#   wdata  integral  32    'h7dfef53c
#   rdata  integral  32    'h7e6049f8
#   addr   integral  4     'h8       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 615000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = RD||ADDR=8||DATA=7e6049f8
# UVM_INFO mem_sbd.sv(36) @ 615000: uvm_test_top.env_h.sbd_h [SBD] MATCH: ADDR=8 EXP=7e6049f8 ACT=7e6049f8
# UVM_INFO mem_drv.sv(41) @ 635000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = RD||ADDR=1||DATA=19d072a4
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @953                                
#   wr_rd                        integral  1     'h0                                 
#   wdata                        integral  32    'h0                                 
#   rdata                        integral  32    'h19d072a4                          
#   addr                         integral  4     'h1                                 
#   begin_time                   time      64    615000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h0       
#   wdata  integral  32    'h7dfef53c
#   rdata  integral  32    'h19d072a4
#   addr   integral  4     'h1       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 635000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = RD||ADDR=1||DATA=19d072a4
# UVM_INFO mem_sbd.sv(36) @ 635000: uvm_test_top.env_h.sbd_h [SBD] MATCH: ADDR=1 EXP=19d072a4 ACT=19d072a4
# UVM_INFO mem_drv.sv(41) @ 655000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = RD||ADDR=d||DATA=7dfef53c
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req                            mem_tx    -     @963                                
#   wr_rd                        integral  1     'h0                                 
#   wdata                        integral  32    'h0                                 
#   rdata                        integral  32    'h7dfef53c                          
#   addr                         integral  4     'hd                                 
#   begin_time                   time      64    635000                              
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# -----------------------------------
# Name     Type      Size  Value     
# -----------------------------------
# tx       mem_tx    -     @614      
#   wr_rd  integral  1     'h0       
#   wdata  integral  32    'h7dfef53c
#   rdata  integral  32    'h7dfef53c
#   addr   integral  4     'hd       
# -----------------------------------
# UVM_INFO mem_mon.sv(36) @ 655000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = RD||ADDR=d||DATA=7dfef53c
# UVM_INFO mem_sbd.sv(36) @ 655000: uvm_test_top.env_h.sbd_h [SBD] MATCH: ADDR=d EXP=7dfef53c ACT=7dfef53c
# UVM_INFO mem_base_seq.sv(101) @ 655000: uvm_test_top.env_h.agt_h.sqr_h@@seq_h [seq] post_body
# UVM_INFO /usr/share/questa/questasim/verilog_src/uvm-1.2/src/base/uvm_objection.svh(1270) @ 955000: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
# UVM_INFO mem_sbd.sv(60) @ 955000: uvm_test_top.env_h.sbd_h [SBD_REPORT] MATCH=16  MISMATCH=0
# UVM_INFO mem_test_lib.sv(95) @ 955000: uvm_test_top [mem_full_wr_rd_test] ####### test passed #######
# UVM_INFO /usr/share/questa/questasim/verilog_src/uvm-1.2/src/base/uvm_report_server.svh(847) @ 955000: reporter [UVM/REPORT/SERVER] 
# --- UVM Report Summary ---
# 
# ** Report counts by severity
# UVM_INFO :  107
# UVM_WARNING :    0
# UVM_ERROR :    0
# UVM_FATAL :    0
# ** Report counts by id
# [Questa UVM]     2
# [RNTST]     1
# [SBD]    32
# [SBD_REPORT]     1
# [TEST_DONE]     1
# [UVM/RELNOTES]     1
# [UVMTOP]     1
# [mem_drv]    32
# [mem_full_wr_rd_test]     1
# [mem_mon]    32
# [seq]     3
# 
# ** Note: $finish    : /usr/share/questa/questasim/verilog_src/uvm-1.2/src/base/uvm_root.svh(517)
#    Time: 955 ns  Iteration: 67  Instance: /tb

//=============================================================================================================
# UVM_INFO /usr/share/questa/questasim/verilog_src/questa_uvm_pkg-1.2/src/questa_uvm_pkg.sv(277) @ 0: reporter [Questa UVM] QUESTA_UVM-1.2.3
# UVM_INFO /usr/share/questa/questasim/verilog_src/questa_uvm_pkg-1.2/src/questa_uvm_pkg.sv(278) @ 0: reporter [Questa UVM]  questa_uvm::init(+struct)
# UVM_INFO @ 0: reporter [RNTST] Running test mem_one_wr_one_rd_test...
# UVM_INFO /usr/share/questa/questasim/verilog_src/uvm-1.2/src/base/uvm_root.svh(579) @ 0: reporter [UVMTOP] UVM testbench topology:
# --------------------------------------------------------------
# Name                       Type                    Size  Value
# --------------------------------------------------------------
# uvm_test_top               mem_one_wr_one_rd_test  -     @360 
#   env_h                    mem_env                 -     @372 
#     agt_h                  mem_agent               -     @380 
#       cov_h                mem_cov                 -     @563 
#         analysis_imp       uvm_analysis_imp        -     @571 
#       drv_h                mem_drv                 -     @414 
#         rsp_port           uvm_analysis_port       -     @431 
#         seq_item_port      uvm_seq_item_pull_port  -     @422 
#       mon_h                mem_mon                 -     @406 
#         mon_ap_h           uvm_analysis_port       -     @581 
#       sqr_h                uvm_sequencer           -     @440 
#         rsp_export         uvm_analysis_export     -     @448 
#         seq_item_export    uvm_seq_item_pull_imp   -     @554 
#         arbitration_queue  array                   0     -    
#         lock_queue         array                   0     -    
#         num_last_reqs      integral                32    'd1  
#         num_last_rsps      integral                32    'd1  
#     sbd_h                  mem_sbd                 -     @388 
#       analysis_imp         uvm_analysis_imp        -     @396 
# --------------------------------------------------------------
# 
# UVM_INFO mem_base_seq.sv(26) @ 20000: uvm_test_top.env_h.agt_h.sqr_h@@seq_h [seq] pre_body
# UVM_INFO mem_drv.sv(41) @ 35000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = WR||ADDR=c||DATA=7b490cbf
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req_wr                         mem_tx    -     @650                                
#   wr_rd                        integral  1     'h1                                 
#   wdata                        integral  32    'h7b490cbf                          
#   rdata                        integral  32    'h0                                 
#   addr                         integral  4     'hc                                 
#   begin_time                   time      64    20000                               
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# UVM_INFO mem_mon.sv(36) @ 35000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = WR||ADDR=c||DATA=7b490cbf
# UVM_INFO mem_sbd.sv(24) @ 35000: uvm_test_top.env_h.sbd_h [SBD] WRITE stored: ADDR=c DATA=7b490cbf
# UVM_INFO mem_drv.sv(41) @ 55000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = RD||ADDR=c||DATA=7b490cbf
# -----------------------------------------------------------------------------------
# Name                           Type      Size  Value                               
# -----------------------------------------------------------------------------------
# req_rd                         mem_tx    -     @661                                
#   wr_rd                        integral  1     'h0                                 
#   wdata                        integral  32    'h2c3740f3                          
#   rdata                        integral  32    'h7b490cbf                          
#   addr                         integral  4     'hc                                 
#   begin_time                   time      64    35000                               
#   depth                        int       32    'd2                                 
#   parent sequence (name)       string    5     seq_h                               
#   parent sequence (full name)  string    36    uvm_test_top.env_h.agt_h.sqr_h.seq_h
#   sequencer                    string    30    uvm_test_top.env_h.agt_h.sqr_h      
# -----------------------------------------------------------------------------------
# UVM_INFO mem_mon.sv(36) @ 55000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = RD||ADDR=c||DATA=7b490cbf
# UVM_INFO mem_sbd.sv(36) @ 55000: uvm_test_top.env_h.sbd_h [SBD] MATCH: ADDR=c EXP=7b490cbf ACT=7b490cbf
# UVM_INFO mem_base_seq.sv(42) @ 55000: uvm_test_top.env_h.agt_h.sqr_h@@seq_h [seq] post_body
# UVM_INFO /usr/share/questa/questasim/verilog_src/uvm-1.2/src/base/uvm_objection.svh(1270) @ 355000: reporter [TEST_DONE] 'run' phase is ready to proceed to the 'extract' phase
# UVM_INFO mem_sbd.sv(60) @ 355000: uvm_test_top.env_h.sbd_h [SBD_REPORT] MATCH=1  MISMATCH=0
# UVM_INFO /usr/share/questa/questasim/verilog_src/uvm-1.2/src/base/uvm_report_server.svh(847) @ 355000: reporter [UVM/REPORT/SERVER] 
# --- UVM Report Summary ---
# 
# ** Report counts by severity
# UVM_INFO :   15
# UVM_WARNING :    0
# UVM_ERROR :    0
# UVM_FATAL :    0
# ** Report counts by id
# [Questa UVM]     2
# [RNTST]     1
# [SBD]     2
# [SBD_REPORT]     1
# [TEST_DONE]     1
# [UVM/RELNOTES]     1
# [UVMTOP]     1
# [mem_drv]     2
# [mem_mon]     2
# [seq]     2
# 
# ** Note: $finish    : /usr/share/questa/questasim/verilog_src/uvm-1.2/src/base/uvm_root.svh(517)
#    Time: 355 ns  Iteration: 67  Instance: /tb


