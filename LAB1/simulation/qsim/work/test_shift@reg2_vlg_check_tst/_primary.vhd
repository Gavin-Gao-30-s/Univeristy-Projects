library verilog;
use verilog.vl_types.all;
entity test_shiftReg2_vlg_check_tst is
    port(
        ExponentOut     : in     vl_logic_vector(6 downto 0);
        MantissaOut11   : in     vl_logic_vector(7 downto 0);
        test_incrementor_value: in     vl_logic_vector(6 downto 0);
        test_shiftReg2value: in     vl_logic_vector(11 downto 0);
        sampler_rx      : in     vl_logic
    );
end test_shiftReg2_vlg_check_tst;
