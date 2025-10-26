library verilog;
use verilog.vl_types.all;
entity DifferenceChecker is
    port(
        A               : in     vl_logic_vector(6 downto 0);
        B               : in     vl_logic_vector(6 downto 0);
        Enable          : in     vl_logic;
        Diff            : out    vl_logic_vector(3 downto 0);
        Valid           : out    vl_logic;
        A_eq_B          : out    vl_logic;
        A_lt_B          : out    vl_logic;
        A_gt_B          : out    vl_logic
    );
end DifferenceChecker;
