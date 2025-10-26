library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX4to1_4bit is
    Port (
        sel   : in  STD_LOGIC_VECTOR(1 downto 0); -- 2-bit select input
        A     : in  STD_LOGIC_VECTOR(3 downto 0); -- 4-bit input 0
        B     : in  STD_LOGIC_VECTOR(3 downto 0); -- 4-bit input 1
        C     : in  STD_LOGIC_VECTOR(3 downto 0); -- 4-bit input 2
        D     : in  STD_LOGIC_VECTOR(3 downto 0); -- 4-bit input 3
        Y     : out STD_LOGIC_VECTOR(3 downto 0)  -- 4-bit output
    );
end MUX4to1_4bit;

architecture Behavioral of MUX4to1_4bit is
begin
    -- Process to implement 4-bit MUX logic
    process(sel, A, B, C, D)
    begin
        case sel is
            when "00" => Y <= A; -- Select 4-bit input A
            when "01" => Y <= B; -- Select 4-bit input B
            when "10" => Y <= C; -- Select 4-bit input C
            when "11" => Y <= D; -- Select 4-bit input D
            when others => Y <= (others => '0'); -- Default output
        end case;
    end process;
end Behavioral;
