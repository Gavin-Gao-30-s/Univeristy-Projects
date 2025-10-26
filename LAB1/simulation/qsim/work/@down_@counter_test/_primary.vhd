library verilog;
use verilog.vl_types.all;
entity Down_Counter_test is
    port(
        Output          : out    vl_logic_vector(7 downto 0);
        i_clock         : in     vl_logic;
        i_reset         : in     vl_logic;
        i_load          : in     vl_logic;
        i_enable        : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0)
    );
end Down_Counter_test;
