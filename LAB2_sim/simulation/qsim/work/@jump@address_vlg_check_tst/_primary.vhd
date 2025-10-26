library verilog;
use verilog.vl_types.all;
entity JumpAddress_vlg_check_tst is
    port(
        jump_addr       : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end JumpAddress_vlg_check_tst;
