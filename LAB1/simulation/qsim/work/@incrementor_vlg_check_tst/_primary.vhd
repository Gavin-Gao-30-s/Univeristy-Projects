library verilog;
use verilog.vl_types.all;
entity Incrementor_vlg_check_tst is
    port(
        result          : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end Incrementor_vlg_check_tst;
