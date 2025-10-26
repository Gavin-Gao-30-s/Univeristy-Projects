library verilog;
use verilog.vl_types.all;
entity DifferenceChecker_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(6 downto 0);
        B               : in     vl_logic_vector(6 downto 0);
        Enable          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end DifferenceChecker_vlg_sample_tst;
