library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RoundingUnit is
    Port (
        exponent_in : in STD_LOGIC_VECTOR(6 downto 0);
        mantissa_in : in STD_LOGIC_VECTOR(11 downto 0);
        round_enable : in STD_LOGIC;
        exponent_out : out STD_LOGIC_VECTOR(6 downto 0);
        mantissa_out : out STD_LOGIC_VECTOR(7 downto 0)
    );
end RoundingUnit;

architecture Behavioral of RoundingUnit is
begin
    process(exponent_in, mantissa_in, round_enable)
        variable rounding_bit : STD_LOGIC;
        variable sticky_bit : STD_LOGIC;
        variable result_mantissa : STD_LOGIC_VECTOR(7 downto 0);
    begin
        rounding_bit := mantissa_in(3);
        if mantissa_in(2 downto 0) /= "000" then
            sticky_bit := '1';
        else
            sticky_bit := '0';
        end if;

        if round_enable = '1' then
            if rounding_bit = '1' and sticky_bit = '1' then
                result_mantissa := mantissa_in(11 downto 4) + 1;
            else
                result_mantissa := mantissa_in(11 downto 4);
            end if;
        else
            result_mantissa := mantissa_in(11 downto 4);
        end if;

        exponent_out <= exponent_in;
        mantissa_out <= result_mantissa;
    end process;
end Behavioral;


