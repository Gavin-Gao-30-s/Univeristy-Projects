library verilog;
use verilog.vl_types.all;
entity clk_div_vlg_check_tst is
    port(
        clock_1Hz       : in     vl_logic;
        clock_1KHz      : in     vl_logic;
        clock_1MHz      : in     vl_logic;
        clock_10Hz      : in     vl_logic;
        clock_10KHz     : in     vl_logic;
        clock_100Hz     : in     vl_logic;
        clock_100KHz    : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end clk_div_vlg_check_tst;
