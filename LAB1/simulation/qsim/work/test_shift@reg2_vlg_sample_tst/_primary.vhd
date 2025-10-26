library verilog;
use verilog.vl_types.all;
entity test_shiftReg2_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        DEC             : in     vl_logic;
        expA            : in     vl_logic_vector(6 downto 0);
        expB            : in     vl_logic_vector(6 downto 0);
        INC             : in     vl_logic;
        load3           : in     vl_logic;
        load4           : in     vl_logic;
        Result          : in     vl_logic_vector(11 downto 0);
        Round           : in     vl_logic;
        rst             : in     vl_logic;
        sel2            : in     vl_logic;
        shiftL          : in     vl_logic;
        shiftR2         : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end test_shiftReg2_vlg_sample_tst;
