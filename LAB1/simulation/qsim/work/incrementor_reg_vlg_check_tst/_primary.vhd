library verilog;
use verilog.vl_types.all;
entity incrementor_reg_vlg_check_tst is
    port(
        incrementor_out : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end incrementor_reg_vlg_check_tst;
