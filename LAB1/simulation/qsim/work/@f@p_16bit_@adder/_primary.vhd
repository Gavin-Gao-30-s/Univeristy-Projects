library verilog;
use verilog.vl_types.all;
entity FP_16bit_Adder is
    port(
        OVERFLOW        : out    vl_logic;
        GCLOCK          : in     vl_logic;
        GRESET          : in     vl_logic;
        signA           : in     vl_logic;
        signB           : in     vl_logic;
        ExponentA       : in     vl_logic_vector(6 downto 0);
        ExponentB       : in     vl_logic_vector(6 downto 0);
        MantissaA       : in     vl_logic_vector(7 downto 0);
        MantissaB       : in     vl_logic_vector(7 downto 0);
        SignOut         : out    vl_logic;
        S0              : out    vl_logic;
        S1              : out    vl_logic;
        S2              : out    vl_logic;
        S3              : out    vl_logic;
        S4              : out    vl_logic;
        S5              : out    vl_logic;
        S6              : out    vl_logic;
        S7              : out    vl_logic;
        S8              : out    vl_logic;
        S9              : out    vl_logic;
        S10             : out    vl_logic;
        S11             : out    vl_logic;
        ExponentOut     : out    vl_logic_vector(6 downto 0);
        MantissaOut     : out    vl_logic_vector(7 downto 0)
    );
end FP_16bit_Adder;
