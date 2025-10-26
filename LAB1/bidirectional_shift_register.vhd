LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY bidirectional_shift_register IS
    PORT (
        clk     : IN STD_LOGIC;
        rst     : IN STD_LOGIC;
        load    : IN STD_LOGIC;
        shiftL  : IN STD_LOGIC;
        shiftR  : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
        reg_out : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
    );
END bidirectional_shift_register;

ARCHITECTURE behavioral OF bidirectional_shift_register IS
    SIGNAL reg_internal : STD_LOGIC_VECTOR(11 DOWNTO 0); -- Rename the signal
BEGIN

    PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
            -- Reset the register
            IF rst = '1' THEN
                reg_internal <= (OTHERS => '0');

            -- Load operation
            ELSIF load = '1' THEN
                reg_internal <= data_in;

            -- Shift Left operation
            ELSIF shiftL = '1' THEN
                reg_internal <= reg_internal(10 DOWNTO 0) & '0';

            -- Shift Right operation
            ELSIF shiftR = '1' THEN
                reg_internal <= '0' & reg_internal(11 DOWNTO 1);
            END IF;
        END IF;
    END PROCESS;

    -- Output the register contents
    reg_out <= reg_internal;

END behavioral;
