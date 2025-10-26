library verilog;
use verilog.vl_types.all;
entity ALU_With_Shift_vlg_check_tst is
    port(
        ALUResult       : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end ALU_With_Shift_vlg_check_tst;
