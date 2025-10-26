library verilog;
use verilog.vl_types.all;
entity IF_ID is
    port(
        i_clock         : in     vl_logic;
        i_reset         : in     vl_logic;
        i_write_enable  : in     vl_logic;
        i_flush         : in     vl_logic;
        i_instr         : in     vl_logic_vector(31 downto 0);
        i_pc_plus4      : in     vl_logic_vector(7 downto 0);
        o_instr         : out    vl_logic_vector(31 downto 0);
        o_pc_plus4      : out    vl_logic_vector(7 downto 0)
    );
end IF_ID;
