library verilog;
use verilog.vl_types.all;
entity DifferenceChecker_vlg_check_tst is
    port(
        A_eq_B          : in     vl_logic;
        A_gt_B          : in     vl_logic;
        A_lt_B          : in     vl_logic;
        Diff            : in     vl_logic_vector(3 downto 0);
        Valid           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end DifferenceChecker_vlg_check_tst;
