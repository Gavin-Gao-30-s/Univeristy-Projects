library verilog;
use verilog.vl_types.all;
entity Extender_8to12 is
    port(
        i_data          : in     vl_logic_vector(7 downto 0);
        o_data          : out    vl_logic_vector(11 downto 0)
    );
end Extender_8to12;
