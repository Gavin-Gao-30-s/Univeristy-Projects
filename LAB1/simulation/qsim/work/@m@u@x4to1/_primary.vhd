library verilog;
use verilog.vl_types.all;
entity MUX4to1 is
    port(
        sel             : in     vl_logic_vector(1 downto 0);
        A               : in     vl_logic;
        B               : in     vl_logic;
        C               : in     vl_logic;
        D               : in     vl_logic;
        Y               : out    vl_logic
    );
end MUX4to1;
