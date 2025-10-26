library verilog;
use verilog.vl_types.all;
entity EX_MEM_vlg_sample_tst is
    port(
        i_ALUresult     : in     vl_logic_vector(7 downto 0);
        i_clock         : in     vl_logic;
        i_enable        : in     vl_logic;
        i_M_MemRead     : in     vl_logic;
        i_M_MemWrite    : in     vl_logic;
        i_RegDstOut     : in     vl_logic_vector(2 downto 0);
        i_reset         : in     vl_logic;
        i_WB_MemToReg   : in     vl_logic;
        i_WB_RegWrite   : in     vl_logic;
        i_WriteData     : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end EX_MEM_vlg_sample_tst;
