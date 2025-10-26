library verilog;
use verilog.vl_types.all;
entity ALU_8bit is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        Sel             : in     vl_logic;
        Cin             : in     vl_logic;
        Result          : out    vl_logic_vector(7 downto 0);
        Cout            : out    vl_logic
    );
end ALU_8bit;
