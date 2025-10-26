library verilog;
use verilog.vl_types.all;
entity test_shiftReg2 is
    port(
        ExponentOut     : out    vl_logic_vector(6 downto 0);
        Round           : in     vl_logic;
        rst             : in     vl_logic;
        DEC             : in     vl_logic;
        INC             : in     vl_logic;
        clk             : in     vl_logic;
        load4           : in     vl_logic;
        sel2            : in     vl_logic;
        expA            : in     vl_logic_vector(6 downto 0);
        expB            : in     vl_logic_vector(6 downto 0);
        Result          : in     vl_logic_vector(11 downto 0);
        load3           : in     vl_logic;
        shiftL          : in     vl_logic;
        shiftR2         : in     vl_logic;
        MantissaOut11   : out    vl_logic_vector(7 downto 0);
        test_incrementor_value: out    vl_logic_vector(6 downto 0);
        test_shiftReg2value: out    vl_logic_vector(11 downto 0)
    );
end test_shiftReg2;
