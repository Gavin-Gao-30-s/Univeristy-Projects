library verilog;
use verilog.vl_types.all;
entity bidirectional_shift_register_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        data_in         : in     vl_logic_vector(11 downto 0);
        load            : in     vl_logic;
        rst             : in     vl_logic;
        shiftL          : in     vl_logic;
        shiftR          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end bidirectional_shift_register_vlg_sample_tst;
