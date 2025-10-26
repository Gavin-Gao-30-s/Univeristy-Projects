library verilog;
use verilog.vl_types.all;
entity Register8bit is
    port(
        o_data          : out    vl_logic_vector(7 downto 0);
        i_data          : in     vl_logic_vector(7 downto 0);
        i_clk           : in     vl_logic;
        i_load          : in     vl_logic
    );
end Register8bit;
