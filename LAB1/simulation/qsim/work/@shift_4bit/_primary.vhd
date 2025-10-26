library verilog;
use verilog.vl_types.all;
entity Shift_4bit is
    port(
        O_0             : out    vl_logic;
        i_data3         : in     vl_logic;
        i_load          : in     vl_logic;
        i_clock         : in     vl_logic;
        i_shift1        : in     vl_logic;
        i_data2         : in     vl_logic;
        i_data1         : in     vl_logic;
        i_data0         : in     vl_logic;
        O_1             : out    vl_logic;
        O_2             : out    vl_logic;
        O_3             : out    vl_logic
    );
end Shift_4bit;
