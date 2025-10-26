library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator_7bit is
    Port (
        A      : in  STD_LOGIC_VECTOR(6 downto 0); -- 7-bit input A
        B      : in  STD_LOGIC_VECTOR(6 downto 0); -- 7-bit input B
        A_eq_B : out STD_LOGIC; -- A equals B
        A_gt_B : out STD_LOGIC; -- A greater than B
        A_lt_B : out STD_LOGIC  -- A less than B
    );
end Comparator_7bit;
architecture Structural of Comparator_7bit is
    -- Signals for each bit comparison
    signal eq : STD_LOGIC_VECTOR(6 downto 0); -- Equality for each bit
    signal gt : STD_LOGIC_VECTOR(6 downto 0); -- Greater-than for each bit
    signal lt : STD_LOGIC_VECTOR(6 downto 0); -- Less-than for each bit

begin
    -- Instantiate 1-bit comparators for each bit
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

    COMP4: entity work.Comparator_1bit
        port map (
            A      => A(4),
            B      => B(4),
            A_eq_B => eq(4),
            A_gt_B => gt(4),
            A_lt_B => lt(4)
        );

    COMP5: entity work.Comparator_1bit
        port map (
            A      => A(5),
            B      => B(5),
            A_eq_B => eq(5),
            A_gt_B => gt(5),
            A_lt_B => lt(5)
        );

    COMP6: entity work.Comparator_1bit
        port map (
            A      => A(6),
            B      => B(6),
            A_eq_B => eq(6),
            A_gt_B => gt(6),
            A_lt_B => lt(6)
        );

    -- Combine the results of the 1-bit comparators
    A_eq_B <= eq(0) and eq(1) and eq(2) and eq(3) and eq(4) and eq(5) and eq(6);
    A_gt_B <= gt(6) or (eq(6) and gt(5)) or (eq(6) and eq(5) and gt(4)) or 
              (eq(6) and eq(5) and eq(4) and gt(3)) or (eq(6) and eq(5) and eq(4) and eq(3) and gt(2)) or
              (eq(6) and eq(5) and eq(4) and eq(3) and eq(2) and gt(1)) or 
              (eq(6) and eq(5) and eq(4) and eq(3) and eq(2) and eq(1) and gt(0));

    A_lt_B <= lt(6) or (eq(6) and lt(5)) or (eq(6) and eq(5) and lt(4)) or 
              (eq(6) and eq(5) and eq(4) and lt(3)) or (eq(6) and eq(5) and eq(4) and eq(3) and lt(2)) or
              (eq(6) and eq(5) and eq(4) and eq(3) and eq(2) and lt(1)) or 
              (eq(6) and eq(5) and eq(4) and eq(3) and eq(2) and eq(1) and lt(0));
end Structural;
