library verilog;
use verilog.vl_types.all;
entity data_memory is
    port(
        address         : in     vl_logic_vector(7 downto 0);
        write_data      : in     vl_logic_vector(7 downto 0);
        read_data       : out    vl_logic_vector(7 downto 0);
        mem_write       : in     vl_logic;
        mem_read        : in     vl_logic;
        clk             : in     vl_logic
    );
end data_memory;
