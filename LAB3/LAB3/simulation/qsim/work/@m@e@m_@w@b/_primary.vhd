library verilog;
use verilog.vl_types.all;
entity MEM_WB is
    port(
        i_clock         : in     vl_logic;
        i_reset         : in     vl_logic;
        i_enable        : in     vl_logic;
        i_WB_RegWrite   : in     vl_logic;
        i_WB_MemToReg   : in     vl_logic;
        i_ReadData      : in     vl_logic_vector(7 downto 0);
        i_ALUResult     : in     vl_logic_vector(7 downto 0);
        i_RegDstOut     : in     vl_logic_vector(2 downto 0);
        o_WB_RegWrite   : out    vl_logic;
        o_WB_MemToReg   : out    vl_logic;
        o_ReadData      : out    vl_logic_vector(7 downto 0);
        o_ALUResult     : out    vl_logic_vector(7 downto 0);
        o_RegDstOut     : out    vl_logic_vector(2 downto 0)
    );
end MEM_WB;
