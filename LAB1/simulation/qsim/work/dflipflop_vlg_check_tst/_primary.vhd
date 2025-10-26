library verilog;
use verilog.vl_types.all;
entity dflipflop_vlg_check_tst is
    port(
        o_q             : in     vl_logic;
        o_qBar          : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end dflipflop_vlg_check_tst;
