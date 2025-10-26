library verilog;
use verilog.vl_types.all;
entity control_logic_vlg_sample_tst is
    port(
        control1        : in     vl_logic;
        control2        : in     vl_logic;
        i_async_reset   : in     vl_logic;
        i_clock         : in     vl_logic;
        i_enable        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end control_logic_vlg_sample_tst;
