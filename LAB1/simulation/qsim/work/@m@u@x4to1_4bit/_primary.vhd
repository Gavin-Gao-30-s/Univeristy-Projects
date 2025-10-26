library verilog;
use verilog.vl_types.all;
entity MUX4to1_4bit is
    port(
        sel             : in     vl_logic_vector(1 downto 0);
        A               : in     vl_logic_vector(3 downto 0);
        B               : in     vl_logic_vector(3 downto 0);
        C               : in     vl_logic_vector(3 downto 0);
        D               : in     vl_logic_vector(3 downto 0);
        Y               : out    vl_logic_vector(3 downto 0)
    );
end MUX4to1_4bit;
