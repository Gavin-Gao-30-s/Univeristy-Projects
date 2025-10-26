library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY clk_div_27M_25M IS
    PORT (
        clk_27Mhz : IN  STD_LOGIC;  -- 27 MHz input
        clk_25Mhz : OUT STD_LOGIC   -- 25 MHz output
    );
END clk_div_27M_25M;

ARCHITECTURE rtl OF clk_div_27M_25M IS
    SIGNAL count : INTEGER RANGE 0 TO 26 := 0;  -- Counter for 27 MHz
    SIGNAL clk_25Mhz_int : STD_LOGIC := '0';
BEGIN
    PROCESS (clk_27Mhz)
    BEGIN
        IF rising_edge(clk_27Mhz) THEN
            IF count < 25 THEN  -- Approximate division by skipping cycles
                count <= count + 1;
            ELSE
                count <= 0;
                clk_25Mhz_int <= NOT clk_25Mhz_int; -- Toggle clock
            END IF;
        END IF;
    END PROCESS;

    clk_25Mhz <= clk_25Mhz_int;
END rtl;

