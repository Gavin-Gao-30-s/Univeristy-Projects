library ieee;
use ieee.std_logic_1164.all;

-- 12-bit ALU
entity ALU_12b is
    port (
        clk     : in  STD_LOGIC;
        load    : in  STD_LOGIC;
        A, B    : in  STD_LOGIC_VECTOR(11 downto 0); -- Two input 12-bit vectors
        Sel     : in  STD_LOGIC; -- Sel for operation (0 for add, 1 for subtract)
        Result  : out STD_LOGIC_VECTOR(11 downto 0); -- 12-bit result
        Cout    : out STD_LOGIC -- Carry out
    );
end ALU_12b;

architecture Behavioral of ALU_12b is
    signal stored_A : STD_LOGIC_VECTOR(11 downto 0);
    signal stored_B : STD_LOGIC_VECTOR(11 downto 0);
    signal B_sel : STD_LOGIC_VECTOR(11 downto 0);
    signal Cin_internal : STD_LOGIC;
    signal calc_result : STD_LOGIC_VECTOR(11 downto 0);
    signal calc_cout : STD_LOGIC;

    component fullAdder12_bit
        port (
            A, B  : in  STD_LOGIC_VECTOR(11 downto 0);
            Cin   : in  STD_LOGIC;
            Sum   : out STD_LOGIC_VECTOR(11 downto 0);
            Cout  : out STD_LOGIC
        );
    end component;

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if load = '1' then
                stored_A <= A;
                stored_B <= B;
            end if;
        end if;
    end process;

    -- Derive Cin from Sel
    Cin_internal <= Sel;

    -- Invert B if subtraction is selected
    B_sel <= stored_B XOR (Sel & Sel & Sel & Sel & Sel & Sel & Sel & Sel & Sel & Sel & Sel & Sel);

    -- Instantiate the 12-bit full adder
    adder_inst : fullAdder12_bit
        port map (
            A => stored_A,
            B => B_sel,
            Cin => Cin_internal,
            Sum => calc_result,
            Cout => calc_cout
        );

    -- Output result only when Sel is active
    process(clk)
    begin
        if rising_edge(clk) then
            if Sel = '1' or Sel = '0' then
                Result <= calc_result;
                Cout <= calc_cout;
            end if;
        end if;
    end process;

end Behavioral;
