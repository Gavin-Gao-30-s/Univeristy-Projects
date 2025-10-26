library verilog;
use verilog.vl_types.all;
entity bidirectional_shift_register_vlg_check_tst is
    port(
        reg_out         : in     vl_logic_vector(11 downto 0);
        sampler_rx      : in     vl_logic
    );
end bidirectional_shift_register_vlg_check_tst;
