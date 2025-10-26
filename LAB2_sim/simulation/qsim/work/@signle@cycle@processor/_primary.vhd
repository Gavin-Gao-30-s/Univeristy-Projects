library verilog;
use verilog.vl_types.all;
entity SignleCycleProcessor is
    port(
        BranchOut       : out    vl_logic;
        GCLOCK          : in     vl_logic;
        GRESET          : in     vl_logic;
        ZeroOut         : out    vl_logic;
        MemWriteOut     : out    vl_logic;
        RegWriteOut     : out    vl_logic;
        RegDst          : out    vl_logic;
        Jump            : out    vl_logic;
        Branch          : out    vl_logic;
        MemRead         : out    vl_logic;
        MemToReg        : out    vl_logic;
        MemWrite        : out    vl_logic;
        ALUSrc          : out    vl_logic;
        RegWrite        : out    vl_logic;
        ALUOp           : out    vl_logic_vector(1 downto 0);
        ALUResult       : out    vl_logic_vector(7 downto 0);
        InstructionOut  : out    vl_logic_vector(31 downto 0);
        MuxOut          : out    vl_logic_vector(7 downto 0);
        ValueSelect     : in     vl_logic_vector(2 downto 0);
        PCOut           : out    vl_logic_vector(7 downto 0);
        ReadData1       : out    vl_logic_vector(7 downto 0);
        ReadData2       : out    vl_logic_vector(7 downto 0);
        WriteData       : out    vl_logic_vector(7 downto 0)
    );
end SignleCycleProcessor;
