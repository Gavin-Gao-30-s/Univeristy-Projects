LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Top-level 8-bit Comparator
ENTITY Comparator IS
    PORT(
        a          : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        b          : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        force_zero : IN  STD_LOGIC;
        equal      : OUT STD_LOGIC
    );
END Comparator;

ARCHITECTURE structural OF Comparator IS
    COMPONENT xnor_gate
        PORT(a, b : IN STD_LOGIC; y : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT and2_gate
        PORT(a, b : IN STD_LOGIC; y : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL x : STD_LOGIC_VECTOR(7 DOWNTO 0);
    SIGNAL and1, and2_sig, and3, and4, and5, and6, result : STD_LOGIC;
BEGIN
    -- Instantiate 8 xnor gates
    x0: xnor_gate PORT MAP(a(0), b(0), x(0));
    x1: xnor_gate PORT MAP(a(1), b(1), x(1));
    x2: xnor_gate PORT MAP(a(2), b(2), x(2));
    x3: xnor_gate PORT MAP(a(3), b(3), x(3));
    x4: xnor_gate PORT MAP(a(4), b(4), x(4));
    x5: xnor_gate PORT MAP(a(5), b(5), x(5));
    x6: xnor_gate PORT MAP(a(6), b(6), x(6));
    x7: xnor_gate PORT MAP(a(7), b(7), x(7));

    -- AND reduction tree
    a1: and2_gate PORT MAP(x(0), x(1), and1);
    a2: and2_gate PORT MAP(x(2), x(3), and2_sig);
    a3: and2_gate PORT MAP(x(4), x(5), and3);
    a4: and2_gate PORT MAP(x(6), x(7), and4);

    a5: and2_gate PORT MAP(and1, and2_sig, and5);
    a6: and2_gate PORT MAP(and3, and4, and6);

    a7: and2_gate PORT MAP(and5, and6, result);

    -- Final AND gate to force output to '0' if force_zero is '1'
    a8: and2_gate PORT MAP(result, NOT(force_zero), equal);

END structural;
