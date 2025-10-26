LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- A parallel 3-bit 2x1 MUX
ENTITY MUX2_3bit IS
    PORT(
        d0, d1   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        s        : IN  STD_LOGIC;
        o_Value  : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
END MUX2_3bit;

ARCHITECTURE rtl OF MUX2_3bit IS

    COMPONENT MUX2_1bit IS
        PORT(
            s   : IN  STD_LOGIC;
            d0  : IN  STD_LOGIC;
            d1  : IN  STD_LOGIC;
            y   : OUT STD_LOGIC
        );
    END COMPONENT;

BEGIN

    m0: MUX2_1bit PORT MAP(s => s, d0 => d0(0), d1 => d1(0), y => o_Value(0));
    m1: MUX2_1bit PORT MAP(s => s, d0 => d0(1), d1 => d1(1), y => o_Value(1));
    m2: MUX2_1bit PORT MAP(s => s, d0 => d0(2), d1 => d1(2), y => o_Value(2));

END rtl;
