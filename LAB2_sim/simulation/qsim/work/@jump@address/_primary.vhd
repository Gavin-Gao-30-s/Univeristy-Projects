library verilog;
use verilog.vl_types.all;
entity JumpAddress is
    port(
        instr_in        : in     vl_logic_vector(7 downto 0);
        jump_addr       : out    vl_logic_vector(7 downto 0)
    );
end JumpAddress;
