library verilog;
use verilog.vl_types.all;
entity IF_ID_vlg_sample_tst is
    port(
        i_clock         : in     vl_logic;
        i_flush         : in     vl_logic;
        i_instr         : in     vl_logic_vector(31 downto 0);
        i_pc_plus4      : in     vl_logic_vector(7 downto 0);
        i_reset         : in     vl_logic;
        i_write_enable  : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end IF_ID_vlg_sample_tst;
