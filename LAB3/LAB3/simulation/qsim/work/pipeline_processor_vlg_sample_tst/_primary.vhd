library verilog;
use verilog.vl_types.all;
entity pipeline_processor_vlg_sample_tst is
    port(
        GCLK            : in     vl_logic;
        GRESET          : in     vl_logic;
        set_comparator_zero: in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end pipeline_processor_vlg_sample_tst;
