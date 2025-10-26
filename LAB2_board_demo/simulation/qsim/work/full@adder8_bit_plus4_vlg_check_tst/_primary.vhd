library verilog;
use verilog.vl_types.all;
entity fullAdder8_bit_plus4_vlg_check_tst is
    port(
        Cout            : in     vl_logic;
        Sum             : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end fullAdder8_bit_plus4_vlg_check_tst;
