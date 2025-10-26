LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY counter IS
    PORT(
        i_resetBar, i_load    : IN    STD_LOGIC;
        i_clock               : IN    STD_LOGIC;
        i_data                : IN    STD_LOGIC_VECTOR(3 downto 0); -- Added data input
        o_Value               : OUT   STD_LOGIC_VECTOR(3 downto 0)
    );
END counter;

ARCHITECTURE rtl OF counter IS
    SIGNAL notA, notB, notC, notD: std_logic;
    SIGNAL outA, outB, outC, outD: std_logic;
    SIGNAL d0, d1, d2, d3       : std_logic; -- D inputs with load selection
    
    COMPONENT dflipflop
    PORT(
        i_d            : IN  STD_LOGIC;
        i_clock        : IN  STD_LOGIC;
        i_enable       : IN  STD_LOGIC;
        i_async_reset  : IN  STD_LOGIC;
        i_async_set    : IN  STD_LOGIC;
        o_q, o_qBar    : OUT STD_LOGIC
    );
    END COMPONENT;

BEGIN
    -- Multiplexers to select between data load and counting (toggling)
    d0 <= i_data(0) WHEN i_load = '1' ELSE notA;
    d1 <= i_data(1) WHEN i_load = '1' ELSE notB;
    d2 <= i_data(2) WHEN i_load = '1' ELSE notC;
    d3 <= i_data(3) WHEN i_load = '1' ELSE notD;

    -- Flip-flops with enables tied to '1' for always enabled (load controls D input)
    bit0: dflipflop PORT MAP(
        i_d => d0,
        i_clock => i_clock,
        i_enable => '1', -- Always enabled
        i_async_reset => i_resetBar,
        i_async_set => '0',
        o_q => outA,
        o_qBar => notA
    );
    
    bit1: dflipflop PORT MAP(
        i_d => d1,
        i_clock => notA, -- Toggle on falling edge of previous bit
        i_enable => '1',
        i_async_reset => i_resetBar,
        i_async_set => '0',
        o_q => outB,
        o_qBar => notB
    );
    
    bit2: dflipflop PORT MAP(
        i_d => d2,
        i_clock => notB,
        i_enable => '1',
        i_async_reset => i_resetBar,
        i_async_set => '0',
        o_q => outC,
        o_qBar => notC
    );
    
    bit3: dflipflop PORT MAP(
        i_d => d3,
        i_clock => notC,
        i_enable => '1',
        i_async_reset => i_resetBar,
        i_async_set => '0',
        o_q => outD,
        o_qBar => notD
    );

    o_Value <= outD & outC & outB & outA;

END rtl;
