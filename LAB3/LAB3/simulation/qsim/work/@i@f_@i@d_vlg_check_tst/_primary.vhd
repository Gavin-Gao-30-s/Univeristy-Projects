library verilog;
use verilog.vl_types.all;
entity IF_ID_vlg_check_tst is
    port(
        o_instr         : in     vl_logic_vector(31 downto 0);
        o_pc_plus4      : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end IF_ID_vlg_check_tst;
