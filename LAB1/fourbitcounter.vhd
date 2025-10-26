LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY fourbitcounter IS
    PORT(
        i_clock : IN STD_LOGIC;
        i_enable : IN STD_LOGIC;
        i_async_reset : IN STD_LOGIC;
        o_count : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END fourbitcounter;

ARCHITECTURE structural OF fourbitcounter IS
    SIGNAL int_q : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
BEGIN
    PROCESS (i_clock, i_async_reset)
    BEGIN
        IF i_async_reset = '1' THEN
            int_q <= "0001";
        ELSIF rising_edge(i_clock) THEN
            IF i_enable = '1' THEN
                int_q <= std_logic_vector(unsigned(int_q) + 1);
            END IF;
        END IF;
    END PROCESS;

    o_count <= int_q;
END structural;



