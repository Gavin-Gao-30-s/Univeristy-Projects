LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY InstructionRegister IS
    PORT (
        i_instr        : IN  STD_LOGIC_VECTOR(31 DOWNTO 0);
        i_clock        : IN  STD_LOGIC;
        i_enable       : IN  STD_LOGIC;
        i_async_reset  : IN  STD_LOGIC;
        i_async_set    : IN  STD_LOGIC;
        o_instr        : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END InstructionRegister;

ARCHITECTURE structural OF InstructionRegister IS

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

    SIGNAL dummy_qBar : STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN

    -- Generate 32 one-bit registers
    gen_instr: FOR i IN 0 TO 31 GENERATE
        instr_bit: OneBitRegister
            PORT MAP (
                i_input       => i_instr(i),
                i_enable      => i_enable,
                i_clock       => i_clock,
                i_async_reset => i_async_reset,
                i_async_set   => i_async_set,
                o_q           => o_instr(i),
                o_qBar        => dummy_qBar(i)
            );
    END GENERATE;

END structural;
