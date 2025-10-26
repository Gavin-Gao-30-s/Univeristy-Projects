library verilog;
use verilog.vl_types.all;
entity MUX2_5bits is
    port(
        s               : in     vl_logic;
        d0              : in     vl_logic_vector(4 downto 0);
        d1              : in     vl_logic_vector(4 downto 0);
        y               : out    vl_logic_vector(4 downto 0)
    );
end MUX2_5bits;
