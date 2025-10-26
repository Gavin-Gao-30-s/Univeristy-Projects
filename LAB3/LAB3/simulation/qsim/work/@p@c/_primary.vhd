library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        i_clock         : in     vl_logic;
        i_resetBar      : in     vl_logic;
        i_setBar        : in     vl_logic;
        i_pcwrite       : in     vl_logic;
        i_pc_in         : in     vl_logic_vector(7 downto 0);
        o_pc_out        : out    vl_logic_vector(7 downto 0)
    );
end PC;
