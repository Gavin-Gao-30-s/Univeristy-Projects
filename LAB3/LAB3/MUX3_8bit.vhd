LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MUX3_8bit IS
    PORT(
        d0, d1, d2 : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        s          : IN  STD_LOGIC_VECTOR(1 DOWNTO 0); -- 2-bit selector
        o_Value    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END MUX3_8bit;

ARCHITECTURE rtl OF MUX3_8bit IS
    SIGNAL mux_stage1_out : STD_LOGIC_VECTOR(7 DOWNTO 0);

    COMPONENT MUX2_8bit
        PORT(
            d0, d1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            s      : IN STD_LOGIC;
            o_Value: OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
        );
    END COMPONENT;
BEGIN
    -- First level: select between d0 and d1 based on s(0)
    U1: MUX2_8bit
        PORT MAP (
            d0 => d0,
            d1 => d1,
            s  => s(0),
            o_Value => mux_stage1_out
        );

    -- Second level: select between previous result and d2 based on s(1)
    U2: MUX2_8bit
        PORT MAP (
            d0 => mux_stage1_out,
            d1 => d2,
            s  => s(1),
            o_Value => o_Value
        );
END rtl;
