LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fullAdder8_bit IS
    PORT(
        A, B  : IN STD_LOGIC_VECTOR(7 DOWNTO 0);  -- 8-bit inputs
        Cin   : IN STD_LOGIC;                     -- Carry-in
        Sum   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0); -- 8-bit sum
        Cout  : OUT STD_LOGIC                      -- Carry-out
    );
END fullAdder8_bit;

ARCHITECTURE rtl OF fullAdder8_bit IS
    SIGNAL sumVector, carryOut : STD_LOGIC_VECTOR(7 DOWNTO 0); -- Temporary signals

    COMPONENT fullAdder IS
        PORT(
            A, B, Cin : IN STD_LOGIC;
            Sum, Cout : OUT STD_LOGIC
        );
    END COMPONENT;

BEGIN
    -- Instantiate the full adders for all 8 bits
    bit0: fullAdder
        PORT MAP (
            Cin => Cin, 
            A => A(0),
            B => B(0),
            Sum => sumVector(0),
            Cout => carryOut(0)
        );

    bit1: fullAdder
        PORT MAP (
            Cin => carryOut(0), 
            A => A(1),
            B => B(1),
            Sum => sumVector(1),
            Cout => carryOut(1)
        );

    bit2: fullAdder
        PORT MAP (
            Cin => carryOut(1), 
            A => A(2),
            B => B(2),
            Sum => sumVector(2),
            Cout => carryOut(2)
        );

    bit3: fullAdder
        PORT MAP (
            Cin => carryOut(2), 
            A => A(3),
            B => B(3),
            Sum => sumVector(3),
            Cout => carryOut(3)
        );

    bit4: fullAdder
        PORT MAP (
            Cin => carryOut(3), 
            A => A(4),
            B => B(4),
            Sum => sumVector(4),
            Cout => carryOut(4)
        );

    bit5: fullAdder
        PORT MAP (
            Cin => carryOut(4), 
            A => A(5),
            B => B(5),
            Sum => sumVector(5),
            Cout => carryOut(5)
        );

    bit6: fullAdder
        PORT MAP (
            Cin => carryOut(5), 
            A => A(6),
            B => B(6),
            Sum => sumVector(6),
            Cout => carryOut(6)
        );

    bit7: fullAdder
        PORT MAP (
            Cin => carryOut(6), 
            A => A(7),
            B => B(7),
            Sum => sumVector(7),
            Cout => carryOut(7)
        );

    -- Assign the final outputs
    Cout <= carryOut(7);
    Sum <= sumVector;

END ARCHITECTURE rtl;

