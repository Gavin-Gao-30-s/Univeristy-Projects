library verilog;
use verilog.vl_types.all;
entity MUX2_8bit_vlg_check_tst is
    port(
        o_Value         : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end MUX2_8bit_vlg_check_tst;
