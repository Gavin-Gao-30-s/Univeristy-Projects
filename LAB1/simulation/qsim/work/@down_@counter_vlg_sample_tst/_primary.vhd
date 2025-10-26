library verilog;
use verilog.vl_types.all;
entity Down_Counter_vlg_sample_tst is
    port(
        i_clock         : in     vl_logic;
        i_enable        : in     vl_logic;
        i_load          : in     vl_logic;
        i_load_value    : in     vl_logic_vector(3 downto 0);
        i_reset         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Down_Counter_vlg_sample_tst;
