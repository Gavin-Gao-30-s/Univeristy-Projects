library verilog;
use verilog.vl_types.all;
entity testControlLogic_vlg_sample_tst is
    port(
        control1        : in     vl_logic;
        control2        : in     vl_logic;
        i_0             : in     vl_logic;
        i_clock         : in     vl_logic;
        i_enable        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end testControlLogic_vlg_sample_tst;
