library verilog;
use verilog.vl_types.all;
entity ALU_With_Shift_vlg_sample_tst is
    port(
        inputA          : in     vl_logic_vector(7 downto 0);
        inputB          : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end ALU_With_Shift_vlg_sample_tst;
