library verilog;
use verilog.vl_types.all;
entity ID_EX_vlg_check_tst is
    port(
        o_EX_ALUOp      : in     vl_logic_vector(1 downto 0);
        o_EX_ALUSrc     : in     vl_logic;
        o_EX_RegDst     : in     vl_logic;
        o_M_MemRead     : in     vl_logic;
        o_M_MemWrite    : in     vl_logic;
        o_Offset8       : in     vl_logic_vector(7 downto 0);
        o_Rd            : in     vl_logic_vector(2 downto 0);
        o_ReadData1     : in     vl_logic_vector(7 downto 0);
        o_ReadData2     : in     vl_logic_vector(7 downto 0);
        o_Rs            : in     vl_logic_vector(2 downto 0);
        o_Rt            : in     vl_logic_vector(2 downto 0);
        o_WB_MemToReg   : in     vl_logic;
        o_WB_RegWrite   : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ID_EX_vlg_check_tst;
