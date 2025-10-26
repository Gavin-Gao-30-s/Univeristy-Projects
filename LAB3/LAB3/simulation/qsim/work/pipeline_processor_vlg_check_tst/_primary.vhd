library verilog;
use verilog.vl_types.all;
entity pipeline_processor_vlg_check_tst is
    port(
        ALUOp           : in     vl_logic_vector(1 downto 0);
        ALUResult       : in     vl_logic_vector(7 downto 0);
        ALUSrc          : in     vl_logic;
        Branch          : in     vl_logic;
        EX_MEM_INSTR    : in     vl_logic_vector(31 downto 0);
        ID_EX_INSTR     : in     vl_logic_vector(31 downto 0);
        ID_INSTR        : in     vl_logic_vector(31 downto 0);
        IF_ID_write     : in     vl_logic;
        IF_INSTR        : in     vl_logic_vector(31 downto 0);
        Jump            : in     vl_logic;
        MEM_WB_INSTR    : in     vl_logic_vector(31 downto 0);
        MemRead_control_unit: in     vl_logic;
        MemToReg_control_unit: in     vl_logic;
        MemWrite_control_unit: in     vl_logic;
        PCOut           : in     vl_logic_vector(7 downto 0);
        PCSrc           : in     vl_logic;
        ReadData1       : in     vl_logic_vector(7 downto 0);
        ReadData2       : in     vl_logic_vector(7 downto 0);
        RegDst          : in     vl_logic;
        RegWrite_control_unit19: in     vl_logic;
        WriteData       : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end pipeline_processor_vlg_check_tst;
