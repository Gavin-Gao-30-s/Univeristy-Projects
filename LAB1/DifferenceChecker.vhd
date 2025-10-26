library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DifferenceChecker is
    Port (
        A      : in  STD_LOGIC_VECTOR(6 downto 0); -- 7-bit input A in excess-63
        B      : in  STD_LOGIC_VECTOR(6 downto 0); -- 7-bit input B in excess-63
        Enable : in  STD_LOGIC;                    -- Enable signal
        Diff   : out STD_LOGIC_VECTOR(3 downto 0); -- 4-bit absolute difference
        Valid  : out STD_LOGIC;                    -- Valid flag (1 if no overflow, 0 otherwise)
        A_eq_B : out STD_LOGIC;                    -- '1' if A = B
        A_lt_B : out STD_LOGIC;                    -- '1' if A < B
        A_gt_B : out STD_LOGIC                     -- '1' if A > B
    );
end DifferenceChecker;

architecture Behavioral of DifferenceChecker is
    signal A_dec     : INTEGER; -- Decimal value of input A
    signal B_dec     : INTEGER; -- Decimal value of input B
    signal abs_diff  : INTEGER; -- Absolute difference
begin
    process(A, B, Enable)
    begin
        if Enable = '1' then
            -- Convert excess-63 binary to integer
            A_dec <= to_integer(signed(A)) - 63;
            B_dec <= to_integer(signed(B)) - 63;

            -- Calculate the absolute difference
            abs_diff <= abs(A_dec - B_dec);

            -- Handle overflow and assign outputs
            if abs_diff > 4 then
                Diff  <= (others => '0'); -- Set difference to 0 if overflow
                Valid <= '0'; -- Flag as invalid
            else
                Diff  <= std_logic_vector(to_unsigned(abs_diff, 4)); -- 4-bit difference
                Valid <= '1'; -- Flag as valid
            end if;

            -- Comparison Outputs
            if A_dec = B_dec then
                A_eq_B <= '1';
                A_lt_B <= '0';
                A_gt_B <= '0';
            elsif A_dec < B_dec then
                A_eq_B <= '0';
                A_lt_B <= '1';
                A_gt_B <= '0';
            else
                A_eq_B <= '0';
                A_lt_B <= '0';
                A_gt_B <= '1';
            end if;
        else
            -- When enable is off, output default values
            Diff  <= (others => '0');
            Valid <= '0';
            A_eq_B <= '0';
            A_lt_B <= '0';
            A_gt_B <= '0';
        end if;
    end process;
end Behavioral;


