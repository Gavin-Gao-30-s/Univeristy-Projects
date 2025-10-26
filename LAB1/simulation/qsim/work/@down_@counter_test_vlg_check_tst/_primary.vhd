library verilog;
use verilog.vl_types.all;
entity Down_Counter_test_vlg_check_tst is
    port(
        Output          : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end Down_Counter_test_vlg_check_tst;
