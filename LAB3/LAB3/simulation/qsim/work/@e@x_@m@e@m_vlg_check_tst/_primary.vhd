library verilog;
use verilog.vl_types.all;
entity EX_MEM_vlg_check_tst is
    port(
        o_ALUresult     : in     vl_logic_vector(7 downto 0);
        o_M_MemRead     : in     vl_logic;
        o_M_MemWrite    : in     vl_logic;
        o_RegDstOut     : in     vl_logic_vector(2 downto 0);
        o_WB_MemToReg   : in     vl_logic;
        o_WB_RegWrite   : in     vl_logic;
        o_WriteData     : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end EX_MEM_vlg_check_tst;
