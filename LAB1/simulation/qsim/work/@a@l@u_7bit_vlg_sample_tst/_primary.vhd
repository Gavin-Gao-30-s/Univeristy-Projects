library verilog;
use verilog.vl_types.all;
entity ALU_7bit_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(6 downto 0);
        B               : in     vl_logic_vector(6 downto 0);
        Cin             : in     vl_logic;
        Sel             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end ALU_7bit_vlg_sample_tst;
