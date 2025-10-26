library verilog;
use verilog.vl_types.all;
entity Extender_8to12_vlg_check_tst is
    port(
        o_data          : in     vl_logic_vector(11 downto 0);
        sampler_rx      : in     vl_logic
    );
end Extender_8to12_vlg_check_tst;
