library verilog;
use verilog.vl_types.all;
entity Register8bit_vlg_check_tst is
    port(
        o_data          : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end Register8bit_vlg_check_tst;
