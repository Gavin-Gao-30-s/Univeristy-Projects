library verilog;
use verilog.vl_types.all;
entity clk_div is
    port(
        clock_25Mhz     : in     vl_logic;
        clock_1MHz      : out    vl_logic;
        clock_100KHz    : out    vl_logic;
        clock_10KHz     : out    vl_logic;
        clock_1KHz      : out    vl_logic;
        clock_100Hz     : out    vl_logic;
        clock_10Hz      : out    vl_logic;
        clock_1Hz       : out    vl_logic
    );
end clk_div;
