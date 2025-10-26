library verilog;
use verilog.vl_types.all;
entity testControlLogic is
    port(
        S0              : out    vl_logic;
        control1        : in     vl_logic;
        i_0             : in     vl_logic;
        i_clock         : in     vl_logic;
        i_enable        : in     vl_logic;
        S1              : out    vl_logic;
        control2        : in     vl_logic;
        S2              : out    vl_logic
    );
end testControlLogic;
