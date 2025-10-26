library verilog;
use verilog.vl_types.all;
entity dflipflop is
    port(
        i_d             : in     vl_logic;
        i_clock         : in     vl_logic;
        i_enable        : in     vl_logic;
        i_async_reset   : in     vl_logic;
        i_async_set     : in     vl_logic;
        o_q             : out    vl_logic;
        o_qBar          : out    vl_logic
    );
end dflipflop;
