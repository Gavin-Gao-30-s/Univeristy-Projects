library verilog;
use verilog.vl_types.all;
entity MUX4to1_4bit_vlg_check_tst is
    port(
        Y               : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end MUX4to1_4bit_vlg_check_tst;
