library verilog;
use verilog.vl_types.all;
entity MEM_WB_vlg_check_tst is
    port(
        o_ALUResult     : in     vl_logic_vector(7 downto 0);
        o_ReadData      : in     vl_logic_vector(7 downto 0);
        o_RegDstOut     : in     vl_logic_vector(2 downto 0);
        o_WB_MemToReg   : in     vl_logic;
        o_WB_RegWrite   : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end MEM_WB_vlg_check_tst;
