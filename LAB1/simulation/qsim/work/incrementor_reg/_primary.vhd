library verilog;
use verilog.vl_types.all;
entity incrementor_reg is
    port(
        incrementor_out : out    vl_logic_vector(6 downto 0);
        clk             : in     vl_logic;
        INC             : in     vl_logic;
        DEC             : in     vl_logic;
        load4           : in     vl_logic;
        sel2            : in     vl_logic;
        expA            : in     vl_logic_vector(6 downto 0);
        expB            : in     vl_logic_vector(6 downto 0);
        rst             : in     vl_logic
    );
end incrementor_reg;
