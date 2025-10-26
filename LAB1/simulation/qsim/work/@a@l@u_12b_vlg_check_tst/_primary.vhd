library verilog;
use verilog.vl_types.all;
entity ALU_12b_vlg_check_tst is
    port(
        Cout            : in     vl_logic;
        Result          : in     vl_logic_vector(11 downto 0);
        sampler_rx      : in     vl_logic
    );
end ALU_12b_vlg_check_tst;
