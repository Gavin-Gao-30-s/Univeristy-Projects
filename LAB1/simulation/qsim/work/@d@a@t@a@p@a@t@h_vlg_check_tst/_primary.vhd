library verilog;
use verilog.vl_types.all;
entity DATAPATH_vlg_check_tst is
    port(
        A_eq_B          : in     vl_logic;
        A_gt_B          : in     vl_logic;
        absDiffofExp    : in     vl_logic_vector(3 downto 0);
        ALU_Result      : in     vl_logic_vector(11 downto 0);
        Counter_out     : in     vl_logic_vector(3 downto 0);
        Cout            : in     vl_logic;
        DFC_out         : in     vl_logic_vector(3 downto 0);
        expOut          : in     vl_logic_vector(6 downto 0);
        Extender_out    : in     vl_logic_vector(11 downto 0);
        incrementor_out : in     vl_logic_vector(6 downto 0);
        isAdd           : in     vl_logic;
        isSub           : in     vl_logic;
        mantissaOut     : in     vl_logic_vector(7 downto 0);
        Matched         : in     vl_logic;
        normalized      : in     vl_logic;
        shiftReg2_out   : in     vl_logic_vector(11 downto 0);
        shiftReg_out    : in     vl_logic_vector(11 downto 0);
        shiftRMAN       : in     vl_logic;
        signOut         : in     vl_logic;
        Valid           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end DATAPATH_vlg_check_tst;
