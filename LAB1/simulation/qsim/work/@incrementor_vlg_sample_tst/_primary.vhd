library verilog;
use verilog.vl_types.all;
entity Incrementor_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        dec             : in     vl_logic;
        inc             : in     vl_logic;
        load            : in     vl_logic;
        rst             : in     vl_logic;
        value           : in     vl_logic_vector(6 downto 0);
        sampler_tx      : out    vl_logic
    );
end Incrementor_vlg_sample_tst;
