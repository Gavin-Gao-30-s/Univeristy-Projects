library verilog;
use verilog.vl_types.all;
entity Extender_8to12_vlg_sample_tst is
    port(
        i_data          : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end Extender_8to12_vlg_sample_tst;
