library verilog;
use verilog.vl_types.all;
entity enabledSRLatch is
    port(
        i_set           : in     vl_logic;
        i_reset         : in     vl_logic;
        i_enable        : in     vl_logic;
        o_q             : out    vl_logic;
        o_qBar          : out    vl_logic
    );
end enabledSRLatch;
