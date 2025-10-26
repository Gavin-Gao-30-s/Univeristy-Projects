library verilog;
use verilog.vl_types.all;
entity Incrementor_7Bit_vlg_sample_tst is
    port(
        i_clk           : in     vl_logic;
        i_data          : in     vl_logic_vector(6 downto 0);
        i_dec           : in     vl_logic;
        i_inc           : in     vl_logic;
        i_load          : in     vl_logic;
        i_rst           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Incrementor_7Bit_vlg_sample_tst;
