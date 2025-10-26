library verilog;
use verilog.vl_types.all;
entity DATAPATH is
    port(
        ZeroOut         : out    vl_logic;
        clk             : in     vl_logic;
        RegWrite        : in     vl_logic;
        instr           : out    vl_logic_vector(31 downto 0);
        reset           : in     vl_logic;
        Jump            : in     vl_logic;
        Branch          : in     vl_logic;
        MemtoReg        : in     vl_logic;
        MemWrite        : in     vl_logic;
        MemRead         : in     vl_logic;
        RegDst          : in     vl_logic;
        ALUop           : in     vl_logic_vector(1 downto 0);
        ALUSrc          : in     vl_logic;
        ALUResult       : out    vl_logic_vector(7 downto 0);
        PCOut           : out    vl_logic_vector(7 downto 0);
        ReadData1       : out    vl_logic_vector(7 downto 0);
        ReadData2       : out    vl_logic_vector(7 downto 0);
        WriteData       : out    vl_logic_vector(7 downto 0)
    );
end DATAPATH;
