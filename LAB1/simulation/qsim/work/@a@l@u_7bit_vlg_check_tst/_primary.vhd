library verilog;
use verilog.vl_types.all;
entity ALU_7bit_vlg_check_tst is
    port(
        Cout            : in     vl_logic;
        Result          : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end ALU_7bit_vlg_check_tst;
