library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SignBitLogic is
    Port (
        isAdd   : in  STD_LOGIC;
        isSub   : in  STD_LOGIC;
        SignA   : in  STD_LOGIC;
        SignB   : in  STD_LOGIC;
        Cout    : in  STD_LOGIC;
        SignOut : out STD_LOGIC
    );
end SignBitLogic;

architecture Behavioral of SignBitLogic is
begin
    process(isAdd, isSub, SignA, SignB, Cout)
    begin
        SignOut <= (isAdd AND (SignA XOR SignB) AND NOT Cout) OR
                   (isAdd AND (NOT (SignA XOR SignB)) AND SignA) OR
                   (isSub AND ((SignA AND NOT Cout) OR (NOT SignA AND Cout)));
    end process;
end Behavioral;
