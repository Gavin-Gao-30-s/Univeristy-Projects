library verilog;
use verilog.vl_types.all;
entity ID_EX is
    port(
        i_clock         : in     vl_logic;
        i_reset         : in     vl_logic;
        i_enable        : in     vl_logic;
        i_WB_RegWrite   : in     vl_logic;
        i_WB_MemToReg   : in     vl_logic;
        i_M_MemRead     : in     vl_logic;
        i_M_MemWrite    : in     vl_logic;
        i_EX_RegDst     : in     vl_logic;
        i_EX_ALUSrc     : in     vl_logic;
        i_EX_ALUOp      : in     vl_logic_vector(1 downto 0);
        i_ReadData1     : in     vl_logic_vector(7 downto 0);
        i_ReadData2     : in     vl_logic_vector(7 downto 0);
        i_Rs            : in     vl_logic_vector(2 downto 0);
        i_Rt            : in     vl_logic_vector(2 downto 0);
        i_Rd            : in     vl_logic_vector(2 downto 0);
        i_Offset8       : in     vl_logic_vector(7 downto 0);
        o_WB_RegWrite   : out    vl_logic;
        o_WB_MemToReg   : out    vl_logic;
        o_M_MemRead     : out    vl_logic;
        o_M_MemWrite    : out    vl_logic;
        o_EX_RegDst     : out    vl_logic;
        o_EX_ALUSrc     : out    vl_logic;
        o_EX_ALUOp      : out    vl_logic_vector(1 downto 0);
        o_ReadData1     : out    vl_logic_vector(7 downto 0);
        o_ReadData2     : out    vl_logic_vector(7 downto 0);
        o_Rs            : out    vl_logic_vector(2 downto 0);
        o_Rt            : out    vl_logic_vector(2 downto 0);
        o_Rd            : out    vl_logic_vector(2 downto 0);
        o_Offset8       : out    vl_logic_vector(7 downto 0)
    );
end ID_EX;
