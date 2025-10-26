LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY ALU_With_Shift IS
    PORT (
        inputA   : IN std_logic_vector(7 DOWNTO 0);  -- First ALU operand (PC+4)
        inputB   : IN std_logic_vector(7 DOWNTO 0);  -- Second ALU operand
        ALUResult: OUT std_logic_vector(7 DOWNTO 0)  -- Final ALU result
    );
END ALU_With_Shift;

ARCHITECTURE rtl OF ALU_With_Shift IS
    SIGNAL shifted_B : std_logic_vector(7 DOWNTO 0);
BEGIN
    -- Automatically shift inputB left by 2 before addition
    shifted_B <= inputB(5 DOWNTO 0) & "00";

    -- Perform addition (inputA + shifted_B)
    ALUResult <= inputA + shifted_B;
END rtl;
