library verilog;
use verilog.vl_types.all;
entity OneBitRegister_vlg_sample_tst is
    port(
        i_async_reset   : in     vl_logic;
        i_async_set     : in     vl_logic;
        i_clock         : in     vl_logic;
        i_enable        : in     vl_logic;
        i_input         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end OneBitRegister_vlg_sample_tst;
