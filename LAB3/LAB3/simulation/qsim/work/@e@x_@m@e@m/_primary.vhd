library verilog;
use verilog.vl_types.all;
entity EX_MEM is
    port(
        i_clock         : in     vl_logic;
        i_reset         : in     vl_logic;
        i_enable        : in     vl_logic;
        i_WB_RegWrite   : in     vl_logic;
        i_WB_MemToReg   : in     vl_logic;
        i_M_MemRead     : in     vl_logic;
        i_M_MemWrite    : in     vl_logic;
        i_ALUresult     : in     vl_logic_vector(7 downto 0);
        i_WriteData     : in     vl_logic_vector(7 downto 0);
        i_RegDstOut     : in     vl_logic_vector(2 downto 0);
        o_WB_RegWrite   : out    vl_logic;
        o_WB_MemToReg   : out    vl_logic;
        o_M_MemRead     : out    vl_logic;
        o_M_MemWrite    : out    vl_logic;
        o_ALUresult     : out    vl_logic_vector(7 downto 0);
        o_WriteData     : out    vl_logic_vector(7 downto 0);
        o_RegDstOut     : out    vl_logic_vector(2 downto 0)
    );
end EX_MEM;
