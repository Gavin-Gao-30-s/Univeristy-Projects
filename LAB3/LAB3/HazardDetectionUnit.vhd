LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY HazardDetectionUnit IS
    PORT (
        ID_EX_MemRead    : IN  STD_LOGIC;
        ID_EX_RegisterRt : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        IF_ID_RegisterRs : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        IF_ID_RegisterRt : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        PCWrite          : OUT STD_LOGIC;
        IFIDWrite        : OUT STD_LOGIC;
        IDEXWrite        : OUT STD_LOGIC;
        IF_Flush         : OUT STD_LOGIC
    );
END HazardDetectionUnit;

ARCHITECTURE rtl OF HazardDetectionUnit IS
BEGIN
    PROCESS (ID_EX_MemRead, ID_EX_RegisterRt, IF_ID_RegisterRs, IF_ID_RegisterRt)
    BEGIN
        IF (ID_EX_MemRead = '1') AND 
           ((ID_EX_RegisterRt = IF_ID_RegisterRs) OR 
            (ID_EX_RegisterRt = IF_ID_RegisterRt)) THEN
            PCWrite    <= '0'; -- stall PC
            IFIDWrite  <= '0'; -- stall IF/ID
            IDEXWrite  <= '0'; -- stall ID/EX
            IF_Flush   <= '0'; -- don't flush yet
        ELSE
            PCWrite    <= '1';
            IFIDWrite  <= '1';
            IDEXWrite  <= '1';
            IF_Flush   <= '0';
        END IF;
    END PROCESS;
END rtl;
