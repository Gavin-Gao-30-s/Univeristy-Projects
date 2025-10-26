library verilog;
use verilog.vl_types.all;
entity instruction_memory_vlg_sample_tst is
    port(
        address         : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end instruction_memory_vlg_sample_tst;
