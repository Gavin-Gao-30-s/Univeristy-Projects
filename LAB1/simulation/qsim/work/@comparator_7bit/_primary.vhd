library verilog;
use verilog.vl_types.all;
entity Comparator_7bit is
    port(
        A               : in     vl_logic_vector(6 downto 0);
        B               : in     vl_logic_vector(6 downto 0);
        A_eq_B          : out    vl_logic;
        A_gt_B          : out    vl_logic;
        A_lt_B          : out    vl_logic
    );
end Comparator_7bit;
