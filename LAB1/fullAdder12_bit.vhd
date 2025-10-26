library ieee;
use ieee.std_logic_1164.all;

entity fullAdder12_bit is
    port(
        A, B  : in STD_LOGIC_VECTOR(11 downto 0);  -- 12-bit inputs
        Cin   : in STD_LOGIC;                     -- Carry-in
        Sum   : out STD_LOGIC_VECTOR(11 downto 0); -- 12-bit sum
        Cout  : out STD_LOGIC                      -- Carry-out
    );
end fullAdder12_bit;

architecture rtl of fullAdder12_bit is
    signal carry: STD_LOGIC_VECTOR(12 downto 0); -- 13-bit carry signal to avoid overflow issues
    signal sumVector : STD_LOGIC_VECTOR(11 downto 0); -- Sum vector

    component fullAdder is
        port(
            A, B, Cin : in STD_LOGIC;
            Sum, Cout : out STD_LOGIC
        );
    end component;

begin
    carry(0) <= Cin;

    GEN_FA: for i in 0 to 11 generate
        FA: fullAdder
            port map (
                A => A(i),
                B => B(i),
                Cin => carry(i),
                Sum => sumVector(i),
                Cout => carry(i+1)
            );
    end generate;

    Cout <= carry(12); -- Final carry-out
    Sum <= sumVector;

end architecture rtl;
