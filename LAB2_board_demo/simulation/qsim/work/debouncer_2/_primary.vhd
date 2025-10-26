library verilog;
use verilog.vl_types.all;
entity debouncer_2 is
    port(
        i_resetBar      : in     vl_logic;
        i_clock         : in     vl_logic;
        i_raw           : in     vl_logic;
        o_clean         : out    vl_logic
    );
end debouncer_2;
