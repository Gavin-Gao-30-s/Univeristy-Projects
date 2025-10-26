LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- A parallel 3-bit 2x1 MUX
ENTITY MUX2_3bit IS
    PORT(
        d0, d1  : IN  STD_LOGIC_VECTOR (2 DOWNTO 0); -- 3-bit input data
        s       : IN  STD_LOGIC; -- sSelection bit
        o_Value : OUT STD_LOGIC_VECTOR (2 DOWNTO 0) -- 3-bit output
    );
END MUX2_3bit;

ARCHITECTURE rtl OF MUX2_3bit IS

    COMPONENT MUX2_1bit IS
        PORT(
            s   : IN std_logic;  -- Selection bit
            d0, d1 : IN std_logic;  -- Data bits
            y   : OUT std_logic  -- Output bit
        );
    END COMPONENT;

BEGIN

m0: MUX2_1bit PORT MAP(
        s => s,
        d0 => d0(0),
        d1 => d1(0),
        y  => o_Value(0)
    );

m1: MUX2_1bit PORT MAP(
        s => s,
        d0 => d0(1),
        d1 => d1(1),
        y  => o_Value(1)
    );

m2: MUX2_1bit PORT MAP(
        s => s,
        d0 => d0(2),
        d1 => d1(2),
        y  => o_Value(2)
    );

END rtl;
