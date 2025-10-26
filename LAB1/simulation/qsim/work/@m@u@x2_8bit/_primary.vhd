library verilog;
use verilog.vl_types.all;
entity MUX2_8bit is
    port(
        d0              : in     vl_logic_vector(7 downto 0);
        d1              : in     vl_logic_vector(7 downto 0);
        s               : in     vl_logic;
        o_Value         : out    vl_logic_vector(7 downto 0)
    );
end MUX2_8bit;
