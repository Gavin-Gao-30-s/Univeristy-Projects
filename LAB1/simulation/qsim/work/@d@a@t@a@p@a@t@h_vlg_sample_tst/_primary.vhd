library verilog;
use verilog.vl_types.all;
entity DATAPATH_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        count1          : in     vl_logic;
        DEC             : in     vl_logic;
        expA            : in     vl_logic_vector(6 downto 0);
        expB            : in     vl_logic_vector(6 downto 0);
        INC             : in     vl_logic;
        load1           : in     vl_logic;
        load2           : in     vl_logic;
        load3           : in     vl_logic;
        load4           : in     vl_logic;
        loadALU         : in     vl_logic;
        mantissaA       : in     vl_logic_vector(7 downto 0);
        mantissaB       : in     vl_logic_vector(7 downto 0);
        Round           : in     vl_logic;
        rst             : in     vl_logic;
        sel1            : in     vl_logic;
        sel2            : in     vl_logic;
        sel3            : in     vl_logic;
        sel4            : in     vl_logic;
        sel5            : in     vl_logic;
        shiftL          : in     vl_logic;
        shiftR1         : in     vl_logic;
        shiftR2         : in     vl_logic;
        signA           : in     vl_logic;
        signB           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end DATAPATH_vlg_sample_tst;
