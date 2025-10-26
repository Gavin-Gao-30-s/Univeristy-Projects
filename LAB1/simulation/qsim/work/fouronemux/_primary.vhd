library verilog;
use verilog.vl_types.all;
entity fouronemux is
    port(
        w0              : in     vl_logic;
        w1              : in     vl_logic;
        w2              : in     vl_logic;
        w3              : in     vl_logic;
        s0              : in     vl_logic;
        s1              : in     vl_logic;
        f               : out    vl_logic
    );
end fouronemux;
