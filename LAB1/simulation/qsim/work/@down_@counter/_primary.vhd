library verilog;
use verilog.vl_types.all;
entity Down_Counter is
    port(
        i_clock         : in     vl_logic;
        i_reset         : in     vl_logic;
        i_load          : in     vl_logic;
        i_enable        : in     vl_logic;
        i_load_value    : in     vl_logic_vector(3 downto 0);
        o_count         : out    vl_logic_vector(3 downto 0)
    );
end Down_Counter;
