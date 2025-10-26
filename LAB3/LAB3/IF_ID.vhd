LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY IF_ID IS
    PORT (
        i_clock        : IN  STD_LOGIC;
        i_reset        : IN  STD_LOGIC;
        i_write_enable : IN  STD_LOGIC;
        i_flush        : IN  STD_LOGIC;

        -- Inputs
        i_instr        : IN  STD_LOGIC_VECTOR(31 DOWNTO 0); -- Fetched instruction
        i_pc_plus4     : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);  -- PC + 4 value

        -- Outputs
        o_instr        : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        o_pc_plus4     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END IF_ID;

ARCHITECTURE structural OF IF_ID IS

    COMPONENT OneBitRegister
        PORT (
            i_input       : IN  STD_LOGIC;
            i_enable      : IN  STD_LOGIC;
            i_clock       : IN  STD_LOGIC;
            i_async_reset : IN  STD_LOGIC;
            i_async_set   : IN  STD_LOGIC;
            o_q           : OUT STD_LOGIC;
            o_qBar        : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL dummy_qBar : STD_LOGIC_VECTOR(39 DOWNTO 0); -- 32 bits for instr + 8 bits for pc+4

    -- Combined reset signal
    SIGNAL combined_reset : STD_LOGIC;

BEGIN

    -- Combine flush and reset
    combined_reset <= i_reset OR i_flush;

    -- Instruction bits (32)
    instr_regs: FOR i IN 0 TO 31 GENERATE
        instr_reg: OneBitRegister
            PORT MAP (
                i_input       => i_instr(i),
                i_enable      => i_write_enable,
                i_clock       => i_clock,
                i_async_reset => combined_reset,
                i_async_set   => '0',
                o_q           => o_instr(i),
                o_qBar        => dummy_qBar(i)
            );
    END GENERATE;

    -- PC + 4 bits (8)
    pc_regs: FOR i IN 0 TO 7 GENERATE
        pc_reg: OneBitRegister
            PORT MAP (
                i_input       => i_pc_plus4(i),
                i_enable      => i_write_enable,
                i_clock       => i_clock,
                i_async_reset => combined_reset,
                i_async_set   => '0',
                o_q           => o_pc_plus4(i),
                o_qBar        => dummy_qBar(i + 32)
            );
    END GENERATE;

END structural;
