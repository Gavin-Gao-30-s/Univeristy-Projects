library verilog;
use verilog.vl_types.all;
entity MUX2_5bits_vlg_check_tst is
    port(
        y               : in     vl_logic_vector(4 downto 0);
        sampler_rx      : in     vl_logic
    );
end MUX2_5bits_vlg_check_tst;
