library verilog;
use verilog.vl_types.all;
entity top is
    port(
        system_clock    : in     vl_logic;
        button_input    : in     vl_logic;
        reset_signal    : in     vl_logic;
        debounced_out   : out    vl_logic
    );
end top;
