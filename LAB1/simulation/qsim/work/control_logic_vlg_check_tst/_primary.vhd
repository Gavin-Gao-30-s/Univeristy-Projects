library verilog;
use verilog.vl_types.all;
entity control_logic_vlg_check_tst is
    port(
        S0              : in     vl_logic;
        S1              : in     vl_logic;
        S2              : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end control_logic_vlg_check_tst;
