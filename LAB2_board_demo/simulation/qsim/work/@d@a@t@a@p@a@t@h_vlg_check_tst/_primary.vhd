library verilog;
use verilog.vl_types.all;
entity DATAPATH_vlg_check_tst is
    port(
        ALUResult       : in     vl_logic_vector(7 downto 0);
        instr           : in     vl_logic_vector(31 downto 0);
        PCOut           : in     vl_logic_vector(7 downto 0);
        ReadData1       : in     vl_logic_vector(7 downto 0);
        ReadData2       : in     vl_logic_vector(7 downto 0);
        WriteData       : in     vl_logic_vector(7 downto 0);
        ZeroOut         : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end DATAPATH_vlg_check_tst;
