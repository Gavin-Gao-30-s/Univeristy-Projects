library verilog;
use verilog.vl_types.all;
entity enabledSRLatch_vlg_sample_tst is
    port(
        i_enable        : in     vl_logic;
        i_reset         : in     vl_logic;
        i_set           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end enabledSRLatch_vlg_sample_tst;
