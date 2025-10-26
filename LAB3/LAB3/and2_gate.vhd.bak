-- 2-input AND gate with unique name to avoid Quartus conflict
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY and2_gate IS
    PORT(
        a : IN  STD_LOGIC;
        b : IN  STD_LOGIC;
        y : OUT STD_LOGIC
    );
END and2_gate;

ARCHITECTURE rtl OF and2_gate IS
BEGIN
    y <= a AND b;
END rtl;