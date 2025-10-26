library verilog;
use verilog.vl_types.all;
entity SignleCycleProcessor_vlg_check_tst is
    port(
        ALUOp           : in     vl_logic_vector(1 downto 0);
        ALUResult       : in     vl_logic_vector(7 downto 0);
        ALUSrc          : in     vl_logic;
        Branch          : in     vl_logic;
        BranchOut       : in     vl_logic;
        InstructionOut  : in     vl_logic_vector(31 downto 0);
        Jump            : in     vl_logic;
        MemRead         : in     vl_logic;
        MemToReg        : in     vl_logic;
        MemWrite        : in     vl_logic;
        MemWriteOut     : in     vl_logic;
        MuxOut          : in     vl_logic_vector(7 downto 0);
        PCOut           : in     vl_logic_vector(7 downto 0);
        ReadData1       : in     vl_logic_vector(7 downto 0);
        ReadData2       : in     vl_logic_vector(7 downto 0);
        RegDst          : in     vl_logic;
        RegWrite        : in     vl_logic;
        RegWriteOut     : in     vl_logic;
        WriteData       : in     vl_logic_vector(7 downto 0);
        ZeroOut         : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end SignleCycleProcessor_vlg_check_tst;
