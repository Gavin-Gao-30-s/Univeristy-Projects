LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- 3-to-1 8-bit MUX for PC update (selects from PC+4, branch target, jump target)
ENTITY MUX3_8bit_for_PC IS
    PORT (
        d0       : IN  STD_LOGIC_VECTOR(7 DOWNTO 0); -- PC + 4
        d1       : IN  STD_LOGIC_VECTOR(7 DOWNTO 0); -- Branch target
        d2       : IN  STD_LOGIC_VECTOR(7 DOWNTO 0); -- Jump target
        PCSrc    : IN  STD_LOGIC; -- Selects between d0 and d1
        Jump     : IN  STD_LOGIC; -- Overrides with d2 if high
        o_Value  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END MUX3_8bit_for_PC;

ARCHITECTURE rtl OF MUX3_8bit_for_PC IS

    COMPONENT MUX2_1bit IS
        PORT (
            s  : IN  STD_LOGIC;
            d0 : IN  STD_LOGIC;
            d1 : IN  STD_LOGIC;
            y  : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL branch_or_pc : STD_LOGIC_VECTOR(7 DOWNTO 0); -- stage1 output

BEGIN

    -- First stage: select between PC+4 and branch target based on PCSrc
    stage1: FOR i IN 0 TO 7 GENERATE
        mux1: MUX2_1bit
            PORT MAP (
                s  => PCSrc,
                d0 => d0(i),  -- PC + 4
                d1 => d1(i),  -- PC + 4 + offset
                y  => branch_or_pc(i)
            );
    END GENERATE;

    -- Second stage: if Jump is '1', override everything and take jump address
    stage2: FOR i IN 0 TO 7 GENERATE
        mux2: MUX2_1bit
            PORT MAP (
                s  => Jump,
                d0 => branch_or_pc(i),
                d1 => d2(i),  -- Jump address
                y  => o_Value(i)
            );
    END GENERATE;

END rtl;
