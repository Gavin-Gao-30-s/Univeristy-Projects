LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY PC IS
    PORT (
        i_clock       : IN  STD_LOGIC;
        i_resetBar    : IN  STD_LOGIC;
        i_setBar      : IN  STD_LOGIC;
        i_pcwrite     : IN  STD_LOGIC;                       -- PCWrite control
        i_pc_in       : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);    -- Next PC input
        o_pc_out      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)     -- Current PC output
    );
END PC;

ARCHITECTURE structural OF PC IS

    COMPONENT OneBitRegister
        PORT (
            i_input         : IN  STD_LOGIC;
            i_enable        : IN  STD_LOGIC;
            i_clock         : IN  STD_LOGIC;
            i_async_reset   : IN  STD_LOGIC;
            i_async_set     : IN  STD_LOGIC;
            o_q             : OUT STD_LOGIC;
            o_qBar          : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL dummy_qBar : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN
    GEN_PC: FOR i IN 0 TO 7 GENERATE
        REG_BIT: OneBitRegister
            PORT MAP (
                i_input       => i_pc_in(i),
                i_enable      => i_pcwrite,
                i_clock       => i_clock,
                i_async_reset => i_resetBar,
                i_async_set   => i_setBar,
                o_q           => o_pc_out(i),
                o_qBar        => dummy_qBar(i)
            );
    END GENERATE;

END structural;
