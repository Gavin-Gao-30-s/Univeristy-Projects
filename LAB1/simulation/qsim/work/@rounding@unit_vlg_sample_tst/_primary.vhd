library verilog;
use verilog.vl_types.all;
entity RoundingUnit_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        exponent_in     : in     vl_logic_vector(6 downto 0);
        load            : in     vl_logic;
        mantissa_in     : in     vl_logic_vector(11 downto 0);
        round_enable    : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end RoundingUnit_vlg_sample_tst;
