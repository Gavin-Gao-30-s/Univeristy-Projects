library verilog;
use verilog.vl_types.all;
entity enabledSRLatch_vlg_check_tst is
    port(
        o_q             : in     vl_logic;
        o_qBar          : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end enabledSRLatch_vlg_check_tst;
