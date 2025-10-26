library verilog;
use verilog.vl_types.all;
entity ALU_12b is
    port(
        clk             : in     vl_logic;
        load            : in     vl_logic;
        A               : in     vl_logic_vector(11 downto 0);
        B               : in     vl_logic_vector(11 downto 0);
        Sel             : in     vl_logic;
        Result          : out    vl_logic_vector(11 downto 0);
        Cout            : out    vl_logic
    );
end ALU_12b;
