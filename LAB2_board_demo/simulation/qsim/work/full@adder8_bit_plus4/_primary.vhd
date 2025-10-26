library verilog;
use verilog.vl_types.all;
entity fullAdder8_bit_plus4 is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        Sum             : out    vl_logic_vector(7 downto 0);
        Cout            : out    vl_logic
    );
end fullAdder8_bit_plus4;
