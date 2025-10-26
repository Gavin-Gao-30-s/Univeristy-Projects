library verilog;
use verilog.vl_types.all;
entity bidirectional_shift_register is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        load            : in     vl_logic;
        shiftL          : in     vl_logic;
        shiftR          : in     vl_logic;
        data_in         : in     vl_logic_vector(11 downto 0);
        reg_out         : out    vl_logic_vector(11 downto 0)
    );
end bidirectional_shift_register;
