library verilog;
use verilog.vl_types.all;
entity FP_16bit_Adder_vlg_check_tst is
    port(
        ExponentOut     : in     vl_logic_vector(6 downto 0);
        MantissaOut     : in     vl_logic_vector(7 downto 0);
        OVERFLOW        : in     vl_logic;
        S0              : in     vl_logic;
        S1              : in     vl_logic;
        S2              : in     vl_logic;
        S3              : in     vl_logic;
        S4              : in     vl_logic;
        S5              : in     vl_logic;
        S6              : in     vl_logic;
        S7              : in     vl_logic;
        S8              : in     vl_logic;
        S9              : in     vl_logic;
        S10             : in     vl_logic;
        S11             : in     vl_logic;
        SignOut         : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end FP_16bit_Adder_vlg_check_tst;
