library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator_1bit is
    Port (
        A      : in  STD_LOGIC;
        B      : in  STD_LOGIC;
        A_eq_B : out STD_LOGIC; -- A equals B
        A_gt_B : out STD_LOGIC; -- A greater than B
        A_lt_B : out STD_LOGIC  -- A less than B
    );
end Comparator_1bit;

architecture Behavioral of Comparator_1bit is
begin
    -- Logic for 1-bit comparator
    A_eq_B <= '1' when A = B else '0';
    A_gt_B <= '1' when A = '1' and B = '0' else '0';
    A_lt_B <= '1' when A = '0' and B = '1' else '0';
end Behavioral;
