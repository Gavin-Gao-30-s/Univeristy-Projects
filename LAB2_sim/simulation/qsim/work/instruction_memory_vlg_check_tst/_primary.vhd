library verilog;
use verilog.vl_types.all;
entity instruction_memory_vlg_check_tst is
    port(
        instruction     : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end instruction_memory_vlg_check_tst;
