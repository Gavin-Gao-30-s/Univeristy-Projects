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
        InstructionOut  : out    vl_logic_vector(31 downto 0);
        MuxOut          : out    vl_logic_vector(7 downto 0);
        ValueSelect     : in     vl_logic_vector(2 downto 0)
    );
end SignleCycleProcessor;
