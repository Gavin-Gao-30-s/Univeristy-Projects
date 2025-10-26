library verilog;
use verilog.vl_types.all;
entity data_memory_vlg_sample_tst is
    port(
        address         : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        mem_read        : in     vl_logic;
        mem_write       : in     vl_logic;
        write_data      : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end data_memory_vlg_sample_tst;
