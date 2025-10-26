LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY data_memory IS
    PORT (
        address  : IN  std_logic_vector(7 DOWNTO 0); -- 8-bit address for 256 locations
        write_data : IN  std_logic_vector(7 DOWNTO 0);
        read_data  : OUT std_logic_vector(7 DOWNTO 0);
        mem_write  : IN  std_logic;
        mem_read   : IN  std_logic;
        clk        : IN  std_logic
    );
END data_memory;

ARCHITECTURE rtl OF data_memory IS
    TYPE ram_type IS ARRAY (0 TO 255) OF std_logic_vector(7 DOWNTO 0);
    
    SIGNAL ram : ram_type := (
        -- Address 00: 55
        00 => X"55",  
        -- Address 01: AA
        01 => X"AA",  
        -- Fill remaining with 00
        OTHERS => X"00"
    );
BEGIN
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF mem_write = '1' THEN
                ram(CONV_INTEGER(address)) <= write_data;
            END IF;
        END IF;
    END PROCESS;
    
    read_data <= ram(CONV_INTEGER(address)) WHEN mem_read = '1' ELSE (OTHERS => '0');
END rtl;