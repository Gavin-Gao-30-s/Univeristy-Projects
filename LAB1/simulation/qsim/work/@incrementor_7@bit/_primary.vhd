library verilog;
use verilog.vl_types.all;
entity Incrementor_7Bit is
    port(
        i_data          : in     vl_logic_vector(6 downto 0);
        i_clk           : in     vl_logic;
        i_load          : in     vl_logic;
        i_rst           : in     vl_logic;
        i_inc           : in     vl_logic;
        i_dec           : in     vl_logic;
        o_data          : out    vl_logic_vector(6 downto 0)
    );
end Incrementor_7Bit;
