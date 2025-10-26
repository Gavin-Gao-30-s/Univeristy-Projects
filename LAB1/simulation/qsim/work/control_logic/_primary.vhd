library verilog;
use verilog.vl_types.all;
entity control_logic is
    port(
        i_clock         : in     vl_logic;
        i_enable        : in     vl_logic;
        i_async_reset   : in     vl_logic;
        control1        : in     vl_logic;
        control2        : in     vl_logic;
        S0              : out    vl_logic;
        S1              : out    vl_logic;
        S2              : out    vl_logic
    );
end control_logic;
