LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fouronemux IS
    PORT(
        w0 : IN STD_LOGIC;
        w1 : IN STD_LOGIC;
        w2 : IN STD_LOGIC;
        w3 : IN STD_LOGIC;
        s0 : IN STD_LOGIC;
        s1 : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        f  : OUT STD_LOGIC
    );
END fouronemux;

ARCHITECTURE structural OF fouronemux IS
    -- Internal signals for 2-to-1 MUX outputs
    SIGNAL int_f1, int_f2, mux_out : STD_LOGIC;

    -- Component declaration of the 2-to-1 multiplexer
    COMPONENT twoonemux
        PORT(
            w0 : IN STD_LOGIC;
            w1 : IN STD_LOGIC;
            s  : IN STD_LOGIC;
            f  : OUT STD_LOGIC
        );
    END COMPONENT;

BEGIN
    -- First stage: two 2-to-1 multiplexers
    mux1: twoonemux PORT MAP(w0, w1, s0, int_f1);
    mux2: twoonemux PORT MAP(w2, w3, s0, int_f2);
    
    -- Second stage: final 2-to-1 multiplexer
    mux3: twoonemux PORT MAP(int_f1, int_f2, s1, mux_out);
    
    -- Output logic with reset condition
    f <= w0 WHEN rst = '1' ELSE mux_out;

END structural;

