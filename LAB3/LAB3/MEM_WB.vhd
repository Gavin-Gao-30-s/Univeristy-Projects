LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MEM_WB IS
    PORT (
        i_clock       : IN  STD_LOGIC;
        i_reset       : IN  STD_LOGIC;
        i_enable      : IN  STD_LOGIC;

        -- WB control signals
        i_WB_RegWrite : IN  STD_LOGIC;
        i_WB_MemToReg : IN  STD_LOGIC;

        -- Data inputs
        i_ReadData    : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        i_ALUResult   : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        i_RegDstOut   : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);

        -- WB control outputs
        o_WB_RegWrite : OUT STD_LOGIC;
        o_WB_MemToReg : OUT STD_LOGIC;

        -- Data outputs
        o_ReadData    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        o_ALUResult   : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        o_RegDstOut   : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
    );
END MEM_WB;

ARCHITECTURE structural OF MEM_WB IS

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

    -- Dummy signals for o_qBar connections
    SIGNAL dummy_qBar : STD_LOGIC_VECTOR(19 DOWNTO 0);

BEGIN

    -- WB Control
    wb_regwrite: OneBitRegister
        PORT MAP (
            i_input       => i_WB_RegWrite,
            i_enable      => i_enable,
            i_clock       => i_clock,
            i_async_reset => i_reset,
            i_async_set   => '0',
            o_q           => o_WB_RegWrite,
            o_qBar        => dummy_qBar(0)
        );

    wb_memtoreg: OneBitRegister
        PORT MAP (
            i_input       => i_WB_MemToReg,
            i_enable      => i_enable,
            i_clock       => i_clock,
            i_async_reset => i_reset,
            i_async_set   => '0',
            o_q           => o_WB_MemToReg,
            o_qBar        => dummy_qBar(1)
        );

    -- Read Data
    rd0: OneBitRegister PORT MAP(i_input => i_ReadData(0), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_ReadData(0), o_qBar => dummy_qBar(2));
    rd1: OneBitRegister PORT MAP(i_input => i_ReadData(1), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_ReadData(1), o_qBar => dummy_qBar(3));
    rd2: OneBitRegister PORT MAP(i_input => i_ReadData(2), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_ReadData(2), o_qBar => dummy_qBar(4));
    rd3: OneBitRegister PORT MAP(i_input => i_ReadData(3), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_ReadData(3), o_qBar => dummy_qBar(5));
    rd4: OneBitRegister PORT MAP(i_input => i_ReadData(4), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_ReadData(4), o_qBar => dummy_qBar(6));
    rd5: OneBitRegister PORT MAP(i_input => i_ReadData(5), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_ReadData(5), o_qBar => dummy_qBar(7));
    rd6: OneBitRegister PORT MAP(i_input => i_ReadData(6), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_ReadData(6), o_qBar => dummy_qBar(8));
    rd7: OneBitRegister PORT MAP(i_input => i_ReadData(7), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_ReadData(7), o_qBar => dummy_qBar(9));

    -- ALU Result
    alu0: OneBitRegister PORT MAP(i_input => i_ALUResult(0), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_ALUResult(0), o_qBar => dummy_qBar(10));
    alu1: OneBitRegister PORT MAP(i_input => i_ALUResult(1), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_ALUResult(1), o_qBar => dummy_qBar(11));
    alu2: OneBitRegister PORT MAP(i_input => i_ALUResult(2), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_ALUResult(2), o_qBar => dummy_qBar(12));
    alu3: OneBitRegister PORT MAP(i_input => i_ALUResult(3), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_ALUResult(3), o_qBar => dummy_qBar(13));
    alu4: OneBitRegister PORT MAP(i_input => i_ALUResult(4), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_ALUResult(4), o_qBar => dummy_qBar(14));
    alu5: OneBitRegister PORT MAP(i_input => i_ALUResult(5), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_ALUResult(5), o_qBar => dummy_qBar(15));
    alu6: OneBitRegister PORT MAP(i_input => i_ALUResult(6), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_ALUResult(6), o_qBar => dummy_qBar(16));
    alu7: OneBitRegister PORT MAP(i_input => i_ALUResult(7), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_ALUResult(7), o_qBar => dummy_qBar(17));

    -- RegDstOut
    r0: OneBitRegister PORT MAP(i_input => i_RegDstOut(0), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_RegDstOut(0), o_qBar => dummy_qBar(18));
    r1: OneBitRegister PORT MAP(i_input => i_RegDstOut(1), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_RegDstOut(1), o_qBar => dummy_qBar(19));
    r2: OneBitRegister PORT MAP(i_input => i_RegDstOut(2), i_enable => i_enable, i_clock => i_clock, i_async_reset => i_reset, i_async_set => '0', o_q => o_RegDstOut(2), o_qBar => dummy_qBar(0)); -- wrapped reuse

END structural;
