library verilog;
use verilog.vl_types.all;
entity pipeline_processor is
    port(
        RegDst          : out    vl_logic;
        ID_INSTR        : out    vl_logic_vector(31 downto 0);
        GCLK            : in     vl_logic;
        IF_ID_write     : out    vl_logic;
        GRESET          : in     vl_logic;
        ID_EX_INSTR     : out    vl_logic_vector(31 downto 0);
        IF_INSTR        : out    vl_logic_vector(31 downto 0);
        PCSrc           : out    vl_logic;
        set_comparator_zero: in     vl_logic;
        Jump            : out    vl_logic;
        Branch          : out    vl_logic;
        MemRead_control_unit: out    vl_logic;
        MemToReg_control_unit: out    vl_logic;
        RegWrite_control_unit19: out    vl_logic;
        ALUSrc          : out    vl_logic;
        MemWrite_control_unit: out    vl_logic;
        ALUOp           : out    vl_logic_vector(1 downto 0);
        ALUResult       : out    vl_logic_vector(7 downto 0);
        EX_MEM_INSTR    : out    vl_logic_vector(31 downto 0);
        MEM_WB_INSTR    : out    vl_logic_vector(31 downto 0);
        PCOut           : out    vl_logic_vector(7 downto 0);
        ReadData1       : out    vl_logic_vector(7 downto 0);
        ReadData2       : out    vl_logic_vector(7 downto 0);
        WriteData       : out    vl_logic_vector(7 downto 0)
    );
end pipeline_processor;
