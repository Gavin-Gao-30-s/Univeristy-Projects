library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Incrementor is
    Port (
        rst      : in  STD_LOGIC;                     -- Reset signal
        inc      : in  STD_LOGIC;                     -- Increment signal
        dec      : in  STD_LOGIC;                     -- Decrement signal
        value    : in  STD_LOGIC_VECTOR(6 downto 0);  -- 7-bit input value
        result   : out STD_LOGIC_VECTOR(6 downto 0)   -- 7-bit output value
    );
end Incrementor;

architecture Behavioral of Incrementor is
begin
    process (value, inc, dec, rst)
    variable temp_value : STD_LOGIC_VECTOR(6 downto 0);  -- Temporary variable
    begin
        if rst = '1' then
            temp_value := "0000000";  -- Reset to 0
        else
            temp_value := value;  -- Default assignment

            if inc = '1' and dec = '0' then
                temp_value := temp_value + "0000001";  -- Instant Increment
            elsif dec = '1' and inc = '0' then
                temp_value := temp_value - "0000001";  -- Instant Decrement
            end if;
        end if;

        result <= temp_value;  -- Assign result instantly
    end process;
end Behavioral;


