library verilog;
use verilog.vl_types.all;
entity test8bitConnection is
    port(
        \out\           : out    vl_logic_vector(11 downto 0);
        data            : in     vl_logic_vector(7 downto 0);
        load            : in     vl_logic;
        RST             : in     vl_logic;
        clk             : in     vl_logic;
        shiftL          : in     vl_logic;
        shiftR          : in     vl_logic
    );
end test8bitConnection;
