LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY JumpAddress IS
    PORT (
        instr_in  : IN std_logic_vector(7 DOWNTO 0);  -- 8-bit jump target from instruction
        
        jump_addr : OUT std_logic_vector(7 DOWNTO 0)  -- Final 8-bit jump address
    );
END JumpAddress;

ARCHITECTURE structural OF JumpAddress IS
    SIGNAL shifted_addr : std_logic_vector(9 DOWNTO 0);
BEGIN
    -- Shift left by 2 (word alignment)
    shifted_addr <= instr_in & "00";

    -- Get lower 8 bits of shifted value
    jump_addr <= shifted_addr(7 DOWNTO 0);
END structural;

