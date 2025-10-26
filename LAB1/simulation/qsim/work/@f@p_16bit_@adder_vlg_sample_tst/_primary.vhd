library verilog;
use verilog.vl_types.all;
entity FP_16bit_Adder_vlg_sample_tst is
    port(
        ExponentA       : in     vl_logic_vector(6 downto 0);
        ExponentB       : in     vl_logic_vector(6 downto 0);
        GCLOCK          : in     vl_logic;
        GRESET          : in     vl_logic;
        MantissaA       : in     vl_logic_vector(7 downto 0);
        MantissaB       : in     vl_logic_vector(7 downto 0);
        signA           : in     vl_logic;
        signB           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end FP_16bit_Adder_vlg_sample_tst;
