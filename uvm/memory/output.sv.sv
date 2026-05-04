# UVM_INFO /usr/share/questa/questasim/verilog_src/uvm-1.2/src/base/uvm_root.svh(392) @ 0: reporter [UVM/RELNOTES] 
# ----------------------------------------------------------------
# UVM-1.2
# (C) 2007-2014 Mentor Graphics Corporation
# (C) 2007-2014 Cadence Design Systems, Inc.
# (C) 2006-2014 Synopsys, Inc.
# (C) 2011-2013 Cypress Semiconductor Corp.
# (C) 2013-2014 NVIDIA Corporation
# ----------------------------------------------------------------
# 
#   ***********       IMPORTANT RELEASE NOTES         ************
# 
#   You are using a version of the UVM library that has been compiled
#   with `UVM_NO_DEPRECATED undefined.
#   See http://www.eda.org/svdb/view.php?id=3313 for more details.
# 
#   You are using a version of the UVM library that has been compiled
#   with `UVM_OBJECT_DO_NOT_NEED_CONSTRUCTOR undefined.
#   See http://www.eda.org/svdb/view.php?id=3770 for more details.
# 
#       (Specify +UVM_NO_RELNOTES to turn off this notice)
# 
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
# UVM_INFO mem_one_wr_one_rd_seq.sv(8) @ 20000: uvm_test_top.env_h.agt_h.sqr_h@@seq_h [seq] pre_body
# UVM_INFO mem_drv.sv(40) @ 35000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = WR||ADDR=c||DATA=7b490cbf
# UVM_INFO mem_mon.sv(35) @ 35000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = WR||ADDR=c||DATA=7b490cbf
# UVM_INFO mem_sbd.sv(24) @ 35000: uvm_test_top.env_h.sbd_h [SBD] WRITE stored: ADDR=c DATA=7b490cbf
# UVM_INFO mem_drv.sv(40) @ 55000: uvm_test_top.env_h.agt_h.drv_h [mem_drv] CMD = RD||ADDR=c||DATA=7b490cbf
# UVM_INFO mem_mon.sv(35) @ 55000: uvm_test_top.env_h.agt_h.mon_h [mem_mon] CMD = RD||ADDR=c||DATA=7b490cbf
# UVM_INFO mem_sbd.sv(35) @ 55000: uvm_test_top.env_h.sbd_h [SBD] MATCH: ADDR=c EXP=7b490cbf ACT=7b490cbf
# UVM_INFO mem_one_wr_one_rd_seq.sv(24) @ 55000: uvm_test_top.env_h.agt_h.sqr_h@@seq_h [seq] post_body
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
