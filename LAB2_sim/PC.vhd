LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY PC IS
    PORT (
        clk      : IN std_logic;  -- Clock signal
        reset    : IN std_logic;  -- Asynchronous reset
        pc_in    : IN std_logic_vector(7 DOWNTO 0);  -- Input address (from external logic)
        pc_out   : OUT std_logic_vector(7 DOWNTO 0)  -- Current PC Address
    );
END PC;

ARCHITECTURE behavioral OF PC IS
    SIGNAL pc_reg, next_pc : std_logic_vector(7 DOWNTO 0) := (OTHERS => '0');  -- PC register
BEGIN
    PROCESS (clk, reset)
    BEGIN
        IF reset = '1' THEN
            pc_reg <= (OTHERS => '0');  -- Reset PC to 0
        ELSIF rising_edge(clk) THEN
            pc_reg <= next_pc;  -- Update PC at the next rising edge
        END IF;
    END PROCESS;
    
    -- Store next PC value, to be updated in the next clock cycle
    next_pc <= pc_in;
    
    -- Output the PC value
    pc_out <= pc_reg;
END behavioral;
