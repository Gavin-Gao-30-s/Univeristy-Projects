library verilog;
use verilog.vl_types.all;
entity bi_shift_12bit_vlg_sample_tst is
    port(
        i_clock         : in     vl_logic;
        i_data0         : in     vl_logic;
        i_data1         : in     vl_logic;
        i_data2         : in     vl_logic;
        i_data3         : in     vl_logic;
        i_data4         : in     vl_logic;
        i_data5         : in     vl_logic;
        i_data6         : in     vl_logic;
        i_data7         : in     vl_logic;
        i_data8         : in     vl_logic;
        i_data9         : in     vl_logic;
        i_data10        : in     vl_logic;
        i_data11        : in     vl_logic;
        i_load          : in     vl_logic;
        i_rst           : in     vl_logic;
        i_shiftL        : in     vl_logic;
        i_shiftR        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end bi_shift_12bit_vlg_sample_tst;
