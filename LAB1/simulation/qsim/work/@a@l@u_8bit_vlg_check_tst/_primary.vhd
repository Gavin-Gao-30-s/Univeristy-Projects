library verilog;
use verilog.vl_types.all;
entity ALU_8bit_vlg_check_tst is
    port(
        Cout            : in     vl_logic;
        Result          : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end ALU_8bit_vlg_check_tst;
