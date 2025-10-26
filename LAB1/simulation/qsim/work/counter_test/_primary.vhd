library verilog;
use verilog.vl_types.all;
entity counter_test is
    port(
        o_Value         : out    vl_logic_vector(3 downto 0);
        i_resetBar      : in     vl_logic;
        i_load          : in     vl_logic;
        i_clock         : in     vl_logic;
        data            : in     vl_logic_vector(3 downto 0)
    );
end counter_test;
