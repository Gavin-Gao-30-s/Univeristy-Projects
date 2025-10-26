library verilog;
use verilog.vl_types.all;
entity fourbitcounter_vlg_check_tst is
    port(
        o_count         : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end fourbitcounter_vlg_check_tst;
