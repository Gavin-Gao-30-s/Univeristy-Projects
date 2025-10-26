library verilog;
use verilog.vl_types.all;
entity DATAPATH_vlg_sample_tst is
    port(
        ALUop           : in     vl_logic_vector(1 downto 0);
        ALUSrc          : in     vl_logic;
        Branch          : in     vl_logic;
        clk             : in     vl_logic;
        Jump            : in     vl_logic;
        MemRead         : in     vl_logic;
        MemtoReg        : in     vl_logic;
        MemWrite        : in     vl_logic;
        RegDst          : in     vl_logic;
        RegWrite        : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end DATAPATH_vlg_sample_tst;
