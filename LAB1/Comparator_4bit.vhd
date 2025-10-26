library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator_4bit is
    Port (
        A      : in  STD_LOGIC_VECTOR(3 downto 0); -- 4-bit input A
        B      : in  STD_LOGIC_VECTOR(3 downto 0); -- 4-bit input B
        A_eq_B : out STD_LOGIC; -- A equals B
        A_gt_B : out STD_LOGIC; -- A greater than B
        A_lt_B : out STD_LOGIC  -- A less than B
    );
end Comparator_4bit;

architecture Structural of Comparator_4bit is
    -- Intermediate signals for each bit comparison
    signal eq : STD_LOGIC_VECTOR(3 downto 0);
    signal gt : STD_LOGIC_VECTOR(3 downto 0);
    signal lt : STD_LOGIC_VECTOR(3 downto 0);
begin
    -- Instantiate 1-bit comparators
    COMP0: entity work.Comparator_1bit
        port map (
            A      => A(0),
            B      => B(0),
            A_eq_B => eq(0),
            A_gt_B => gt(0),
            A_lt_B => lt(0)
        );

    COMP1: entity work.Comparator_1bit
        port map (
            A      => A(1),
            B      => B(1),
            A_eq_B => eq(1),
            A_gt_B => gt(1),
            A_lt_B => lt(1)
        );

    COMP2: entity work.Comparator_1bit
        port map (
            A      => A(2),
            B      => B(2),
            A_eq_B => eq(2),
            A_gt_B => gt(2),
            A_lt_B => lt(2)
        );

    COMP3: entity work.Comparator_1bit
        port map (
            A      => A(3),
            B      => B(3),
            A_eq_B => eq(3),
            A_gt_B => gt(3),
            A_lt_B => lt(3)
        );

    -- Combine the results from 1-bit comparators
    A_eq_B <= eq(0) and eq(1) and eq(2) and eq(3);
    A_gt_B <= gt(3) or (eq(3) and gt(2)) or (eq(3) and eq(2) and gt(1)) or (eq(3) and eq(2) and eq(1) and gt(0));
    A_lt_B <= lt(3) or (eq(3) and lt(2)) or (eq(3) and eq(2) and lt(1)) or (eq(3) and eq(2) and eq(1) and lt(0));
end Structural;
