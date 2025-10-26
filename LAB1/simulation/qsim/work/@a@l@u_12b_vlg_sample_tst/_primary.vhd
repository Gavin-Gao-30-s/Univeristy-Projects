library verilog;
use verilog.vl_types.all;
entity ALU_12b_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(11 downto 0);
        B               : in     vl_logic_vector(11 downto 0);
        clk             : in     vl_logic;
        load            : in     vl_logic;
        Sel             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end ALU_12b_vlg_sample_tst;
