library verilog;
use verilog.vl_types.all;
entity incrementor_7bit is
    port(
        i_clk           : in     vl_logic;
        i_load          : in     vl_logic;
        i_rst           : in     vl_logic;
        i_inc           : in     vl_logic;
        i_dec           : in     vl_logic;
        i_data          : in     vl_logic_vector(6 downto 0);
        o_data          : out    vl_logic_vector(6 downto 0)
    );
end incrementor_7bit;
