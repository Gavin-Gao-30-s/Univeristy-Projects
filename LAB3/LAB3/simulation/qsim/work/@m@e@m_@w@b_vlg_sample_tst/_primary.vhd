library verilog;
use verilog.vl_types.all;
entity MEM_WB_vlg_sample_tst is
    port(
        i_ALUResult     : in     vl_logic_vector(7 downto 0);
        i_clock         : in     vl_logic;
        i_enable        : in     vl_logic;
        i_ReadData      : in     vl_logic_vector(7 downto 0);
        i_RegDstOut     : in     vl_logic_vector(2 downto 0);
        i_reset         : in     vl_logic;
        i_WB_MemToReg   : in     vl_logic;
        i_WB_RegWrite   : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end MEM_WB_vlg_sample_tst;
