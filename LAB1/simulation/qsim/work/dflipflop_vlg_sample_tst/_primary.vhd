library verilog;
use verilog.vl_types.all;
entity dflipflop_vlg_sample_tst is
    port(
        i_async_reset   : in     vl_logic;
        i_async_set     : in     vl_logic;
        i_clock         : in     vl_logic;
        i_d             : in     vl_logic;
        i_enable        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end dflipflop_vlg_sample_tst;
