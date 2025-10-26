library verilog;
use verilog.vl_types.all;
entity Down_Counter_test_vlg_sample_tst is
    port(
        data            : in     vl_logic_vector(7 downto 0);
        i_clock         : in     vl_logic;
        i_enable        : in     vl_logic;
        i_load          : in     vl_logic;
        i_reset         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Down_Counter_test_vlg_sample_tst;
