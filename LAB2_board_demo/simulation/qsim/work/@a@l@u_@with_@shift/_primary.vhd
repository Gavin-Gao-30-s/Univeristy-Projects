library verilog;
use verilog.vl_types.all;
entity ALU_With_Shift is
    port(
        inputA          : in     vl_logic_vector(7 downto 0);
        inputB          : in     vl_logic_vector(7 downto 0);
        ALUResult       : out    vl_logic_vector(7 downto 0)
    );
end ALU_With_Shift;
