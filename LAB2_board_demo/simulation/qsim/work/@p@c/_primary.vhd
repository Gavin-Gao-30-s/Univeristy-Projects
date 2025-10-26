library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        pc_in           : in     vl_logic_vector(7 downto 0);
        pc_out          : out    vl_logic_vector(7 downto 0)
    );
end PC;
