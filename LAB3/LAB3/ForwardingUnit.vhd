LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ForwardingUnit IS
    PORT (
        ID_EX_RegisterRs    : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        ID_EX_RegisterRt    : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        EX_MEM_RegisterRd   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        EX_MEM_RegWrite     : IN  STD_LOGIC;
        MEM_WB_RegisterRd   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        MEM_WB_RegWrite     : IN  STD_LOGIC;
        ForwardA            : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        ForwardB            : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
END ForwardingUnit;

ARCHITECTURE rtl OF ForwardingUnit IS
BEGIN
    PROCESS (ID_EX_RegisterRs, ID_EX_RegisterRt,
             EX_MEM_RegisterRd, EX_MEM_RegWrite,
             MEM_WB_RegisterRd, MEM_WB_RegWrite)
    BEGIN
        -- Default: no forwarding
        ForwardA <= "00";
        ForwardB <= "00";

        -- EX hazard (EX/MEM.forward)
        IF (EX_MEM_RegWrite = '1') AND (EX_MEM_RegisterRd /= "000") THEN
            IF (EX_MEM_RegisterRd = ID_EX_RegisterRs) THEN
                ForwardA <= "10";
            END IF;
            IF (EX_MEM_RegisterRd = ID_EX_RegisterRt) THEN
                ForwardB <= "10";
            END IF;
        END IF;

        -- MEM hazard (MEM/WB.forward)
        IF (MEM_WB_RegWrite = '1') AND (MEM_WB_RegisterRd /= "000") THEN
            IF (MEM_WB_RegisterRd = ID_EX_RegisterRs) AND 
               NOT(EX_MEM_RegWrite = '1' AND EX_MEM_RegisterRd = ID_EX_RegisterRs) THEN
                ForwardA <= "01";
            END IF;
            IF (MEM_WB_RegisterRd = ID_EX_RegisterRt) AND 
               NOT(EX_MEM_RegWrite = '1' AND EX_MEM_RegisterRd = ID_EX_RegisterRt) THEN
                ForwardB <= "01";
            END IF;
        END IF;
    END PROCESS;
END rtl;
