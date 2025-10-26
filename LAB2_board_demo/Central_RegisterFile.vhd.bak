LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY Central_RegisterFile IS
    PORT (
        clk       : IN std_logic;
        reg_write : IN std_logic;  -- Control signal for writing
        read_reg1 : IN std_logic_vector(2 DOWNTO 0); -- rs (instr[25:21])
        read_reg2 : IN std_logic_vector(2 DOWNTO 0); -- rt (instr[20:16])
        write_reg : IN std_logic_vector(2 DOWNTO 0); -- Destination register (rd for R-type, rt for I-type)
        write_data: IN std_logic_vector(7 DOWNTO 0); -- 8-bit data to write
        read_data1: OUT std_logic_vector(7 DOWNTO 0); -- Value from rs
        read_data2: OUT std_logic_vector(7 DOWNTO 0)  -- Value from rt
    );
END Central_RegisterFile;

ARCHITECTURE behavioral OF Central_RegisterFile IS
    TYPE reg_array IS ARRAY (0 TO 7) OF std_logic_vector(7 DOWNTO 0); -- 8 Registers, 8-bit each
    SIGNAL registers : reg_array := (OTHERS => (OTHERS => '0')); -- Initialize to 0
BEGIN
    -- **Instant Read** (asynchronous)
    read_data1 <= registers(CONV_INTEGER(read_reg1)); -- rs (instr[25:21])
    read_data2 <= registers(CONV_INTEGER(read_reg2)); -- rt (instr[20:16])

    -- **Clocked Write**
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF reg_write = '1' THEN
                registers(CONV_INTEGER(write_reg)) <= write_data;
            END IF;
        END IF;
    END PROCESS;
END behavioral;
