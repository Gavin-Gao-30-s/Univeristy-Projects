library verilog;
use verilog.vl_types.all;
entity PC_vlg_sample_tst is
    port(
        i_clock         : in     vl_logic;
        i_pc_in         : in     vl_logic_vector(7 downto 0);
        i_pcwrite       : in     vl_logic;
        i_resetBar      : in     vl_logic;
        i_setBar        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end PC_vlg_sample_tst;
