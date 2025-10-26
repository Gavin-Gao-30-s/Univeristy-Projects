library verilog;
use verilog.vl_types.all;
entity SignleCycleProcessor_vlg_sample_tst is
    port(
        GCLOCK          : in     vl_logic;
        GRESET          : in     vl_logic;
        ValueSelect     : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end SignleCycleProcessor_vlg_sample_tst;
