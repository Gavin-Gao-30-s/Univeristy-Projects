-- XNOR gate
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY xnor_gate IS
    PORT(a, b : IN STD_LOGIC; y : OUT STD_LOGIC);
END xnor_gate;

ARCHITECTURE rtl OF xnor_gate IS
BEGIN
    y <= a XNOR b;
END rtl;