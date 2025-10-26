library verilog;
use verilog.vl_types.all;
entity RoundingUnit is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        exponent_in     : in     vl_logic_vector(6 downto 0);
        mantissa_in     : in     vl_logic_vector(11 downto 0);
        round_enable    : in     vl_logic;
        exponent_out    : out    vl_logic_vector(6 downto 0);
        mantissa_out    : out    vl_logic_vector(7 downto 0)
    );
end RoundingUnit;
