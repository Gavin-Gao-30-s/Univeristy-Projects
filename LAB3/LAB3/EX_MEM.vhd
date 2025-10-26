LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY EX_MEM IS
    PORT (
        i_clock        : IN  STD_LOGIC;
        i_reset        : IN  STD_LOGIC;
        i_enable       : IN  STD_LOGIC;

        -- WB control signals
        i_WB_RegWrite  : IN  STD_LOGIC;
        i_WB_MemToReg  : IN  STD_LOGIC;

        -- M control signals
        i_M_MemRead    : IN  STD_LOGIC;
        i_M_MemWrite   : IN  STD_LOGIC;

        -- Data Inputs
        i_ALUresult    : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        i_WriteData    : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        i_RegDstOut    : IN  STD_LOGIC_VECTOR(2 DOWNTO 0); -- previously i_RegisterRd

        -- WB outputs
        o_WB_RegWrite  : OUT STD_LOGIC;
        o_WB_MemToReg  : OUT STD_LOGIC;

        -- M outputs
        o_M_MemRead    : OUT STD_LOGIC;
        o_M_MemWrite   : OUT STD_LOGIC;

        -- Data Outputs
        o_ALUresult    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        o_WriteData    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        o_RegDstOut    : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
END EX_MEM;

ARCHITECTURE structural OF EX_MEM IS

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

BEGIN

    -- WB control signals
    wb_reg0 : OneBitRegister
        PORT MAP (
            i_input       => i_WB_RegWrite,
            i_enable      => i_enable,
            i_clock       => i_clock,
            i_async_reset => i_reset,
            i_async_set   => '0',
            o_q           => o_WB_RegWrite,
            o_qBar        => OPEN
        );

    wb_reg1 : OneBitRegister
        PORT MAP (
            i_input       => i_WB_MemToReg,
            i_enable      => i_enable,
            i_clock       => i_clock,
            i_async_reset => i_reset,
            i_async_set   => '0',
            o_q           => o_WB_MemToReg,
            o_qBar        => OPEN
        );

    -- M control signals
    m_reg0 : OneBitRegister
        PORT MAP (
            i_input       => i_M_MemRead,
            i_enable      => i_enable,
            i_clock       => i_clock,
            i_async_reset => i_reset,
            i_async_set   => '0',
            o_q           => o_M_MemRead,
            o_qBar        => OPEN
        );

    m_reg1 : OneBitRegister
        PORT MAP (
            i_input       => i_M_MemWrite,
            i_enable      => i_enable,
            i_clock       => i_clock,
            i_async_reset => i_reset,
            i_async_set   => '0',
            o_q           => o_M_MemWrite,
            o_qBar        => OPEN
        );

    -- ALU Result (8 bits)
    gen_ALU : FOR i IN 0 TO 7 GENERATE
        alu_reg : OneBitRegister
            PORT MAP (
                i_input       => i_ALUresult(i),
                i_enable      => i_enable,
                i_clock       => i_clock,
                i_async_reset => i_reset,
                i_async_set   => '0',
                o_q           => o_ALUresult(i),
                o_qBar        => OPEN
            );
    END GENERATE;

    -- Write Data (8 bits)
    gen_WriteData : FOR i IN 0 TO 7 GENERATE
        wd_reg : OneBitRegister
            PORT MAP (
                i_input       => i_WriteData(i),
                i_enable      => i_enable,
                i_clock       => i_clock,
                i_async_reset => i_reset,
                i_async_set   => '0',
                o_q           => o_WriteData(i),
                o_qBar        => OPEN
            );
    END GENERATE;

    -- RegDstOut (3 bits)
    gen_RegDst : FOR i IN 0 TO 2 GENERATE
        regdst_reg : OneBitRegister
            PORT MAP (
                i_input       => i_RegDstOut(i),
                i_enable      => i_enable,
                i_clock       => i_clock,
                i_async_reset => i_reset,
                i_async_set   => '0',
                o_q           => o_RegDstOut(i),
                o_qBar        => OPEN
            );
    END GENERATE;

END structural;
