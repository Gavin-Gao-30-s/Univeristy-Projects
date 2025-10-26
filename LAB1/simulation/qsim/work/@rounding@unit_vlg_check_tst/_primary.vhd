library verilog;
use verilog.vl_types.all;
entity RoundingUnit_vlg_check_tst is
    port(
        exponent_out    : in     vl_logic_vector(6 downto 0);
        mantissa_out    : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end RoundingUnit_vlg_check_tst;
