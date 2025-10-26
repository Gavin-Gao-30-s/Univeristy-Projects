library verilog;
use verilog.vl_types.all;
entity Shift_4bit_vlg_sample_tst is
    port(
        i_clock         : in     vl_logic;
        i_data0         : in     vl_logic;
        i_data1         : in     vl_logic;
        i_data2         : in     vl_logic;
        i_data3         : in     vl_logic;
        i_load          : in     vl_logic;
        i_shift1        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Shift_4bit_vlg_sample_tst;
