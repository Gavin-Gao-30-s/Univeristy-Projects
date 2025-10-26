library verilog;
use verilog.vl_types.all;
entity Comparator_4bit_vlg_check_tst is
    port(
        A_eq_B          : in     vl_logic;
        A_gt_B          : in     vl_logic;
        A_lt_B          : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Comparator_4bit_vlg_check_tst;
