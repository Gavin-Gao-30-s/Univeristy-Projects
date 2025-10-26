library verilog;
use verilog.vl_types.all;
entity Register8bit_vlg_sample_tst is
    port(
        i_clk           : in     vl_logic;
        i_data          : in     vl_logic_vector(7 downto 0);
        i_load          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Register8bit_vlg_sample_tst;
