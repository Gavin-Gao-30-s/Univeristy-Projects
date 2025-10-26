library verilog;
use verilog.vl_types.all;
entity JumpAddress_vlg_sample_tst is
    port(
        instr_in        : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end JumpAddress_vlg_sample_tst;
