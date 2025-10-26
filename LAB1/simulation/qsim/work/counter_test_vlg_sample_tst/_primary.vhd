library verilog;
use verilog.vl_types.all;
entity counter_test_vlg_sample_tst is
    port(
        data            : in     vl_logic_vector(3 downto 0);
        i_clock         : in     vl_logic;
        i_load          : in     vl_logic;
        i_resetBar      : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end counter_test_vlg_sample_tst;
