library verilog;
use verilog.vl_types.all;
entity fourbitcounter is
    port(
        i_clock         : in     vl_logic;
        i_enable        : in     vl_logic;
        i_async_reset   : in     vl_logic;
        o_count         : out    vl_logic_vector(3 downto 0)
    );
end fourbitcounter;
