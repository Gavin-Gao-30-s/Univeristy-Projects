library verilog;
use verilog.vl_types.all;
entity \4bitRStest\ is
    port(
        o0              : out    vl_logic;
        i_d             : in     vl_logic;
        i_clock         : in     vl_logic;
        i_enable        : in     vl_logic;
        o1              : out    vl_logic;
        o2              : out    vl_logic;
        o3              : out    vl_logic
    );
end \4bitRStest\;
