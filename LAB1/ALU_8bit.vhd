library ieee;
use ieee.std_logic_1164.all;

-- 12-bit ALU
entity ALU_12bit is
    port (
        A, B     : in  STD_LOGIC_VECTOR(11 downto 0); -- Two input 12-bit vectors
        Sel, Cin : in  STD_LOGIC; -- Sel for operation (0 for add, 1 for subtract)
        Result   : out STD_LOGIC_VECTOR(11 downto 0); -- 12-bit result
        Cout     : out STD_LOGIC -- Carry out
    );
end ALU_12bit;

architecture struct of ALU_12bit is
    -- Signal declarations
    signal B_sel : STD_LOGIC_VECTOR(11 downto 0);

    -- Component declarations
    component fullAdder12_bit
        port (
            A, B  : in  STD_LOGIC_VECTOR(11 downto 0);
            Cin   : in  STD_LOGIC;
            Sum   : out STD_LOGIC_VECTOR(11 downto 0);
            Cout  : out STD_LOGIC
        );
    end component;

begin
    -- Invert B if subtraction is selected
    B_sel <= B XOR (Sel & Sel & Sel & Sel & Sel & Sel & Sel & Sel & Sel & Sel & Sel & Sel);

    -- Instantiate the 12-bit full adder
    adder_inst : fullAdder12_bit
        port map (
            A => A,
            B => B_sel,
            Cin => Cin, 
            Sum => Result,
            Cout => Cout
        );

end struct;
