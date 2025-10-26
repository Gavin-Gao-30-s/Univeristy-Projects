LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ID_EX IS
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

        -- EX control signals
        i_EX_RegDst    : IN  STD_LOGIC;
        i_EX_ALUSrc    : IN  STD_LOGIC;
        i_EX_ALUOp     : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);

        -- Data Inputs
        i_ReadData1    : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        i_ReadData2    : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        i_Rs           : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        i_Rt           : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        i_Rd           : IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
        
        i_Offset8      : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);  -- instr[7..0]

        -- WB outputs
        o_WB_RegWrite  : OUT STD_LOGIC;
        o_WB_MemToReg  : OUT STD_LOGIC;

        -- M outputs
        o_M_MemRead    : OUT STD_LOGIC;
        o_M_MemWrite   : OUT STD_LOGIC;

        -- EX outputs
        o_EX_RegDst    : OUT STD_LOGIC;
        o_EX_ALUSrc    : OUT STD_LOGIC;
        o_EX_ALUOp     : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);

        -- Data Outputs
        o_ReadData1    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        o_ReadData2    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
        o_Rs           : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        o_Rt           : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        o_Rd           : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        
        o_Offset8      : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END ID_EX;

ARCHITECTURE structural OF ID_EX IS

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

    SIGNAL dummy_qBar : STD_LOGIC_VECTOR(63 DOWNTO 0);

BEGIN

    -- WB control
    WB_RegWrite : OneBitRegister PORT MAP(i_WB_RegWrite, i_enable, i_clock, i_reset, '0', o_WB_RegWrite, dummy_qBar(0));
    WB_MemToReg : OneBitRegister PORT MAP(i_WB_MemToReg, i_enable, i_clock, i_reset, '0', o_WB_MemToReg, dummy_qBar(1));

    -- M control
    M_MemRead  : OneBitRegister PORT MAP(i_M_MemRead, i_enable, i_clock, i_reset, '0', o_M_MemRead, dummy_qBar(2));
    M_MemWrite : OneBitRegister PORT MAP(i_M_MemWrite, i_enable, i_clock, i_reset, '0', o_M_MemWrite, dummy_qBar(3));

    -- EX control
    EX_RegDst : OneBitRegister PORT MAP(i_EX_RegDst, i_enable, i_clock, i_reset, '0', o_EX_RegDst, dummy_qBar(4));
    EX_ALUSrc : OneBitRegister PORT MAP(i_EX_ALUSrc, i_enable, i_clock, i_reset, '0', o_EX_ALUSrc, dummy_qBar(5));
    EX_ALUOp0 : OneBitRegister PORT MAP(i_EX_ALUOp(0), i_enable, i_clock, i_reset, '0', o_EX_ALUOp(0), dummy_qBar(6));
    EX_ALUOp1 : OneBitRegister PORT MAP(i_EX_ALUOp(1), i_enable, i_clock, i_reset, '0', o_EX_ALUOp(1), dummy_qBar(7));

    -- ReadData1
    rd1: FOR i IN 0 TO 7 GENERATE
        reg1: OneBitRegister PORT MAP(
            i_input => i_ReadData1(i), i_enable => i_enable, i_clock => i_clock,
            i_async_reset => i_reset, i_async_set => '0', o_q => o_ReadData1(i), o_qBar => dummy_qBar(8 + i)
        );
    END GENERATE;

    -- ReadData2
    rd2: FOR i IN 0 TO 7 GENERATE
        reg2: OneBitRegister PORT MAP(
            i_input => i_ReadData2(i), i_enable => i_enable, i_clock => i_clock,
            i_async_reset => i_reset, i_async_set => '0', o_q => o_ReadData2(i), o_qBar => dummy_qBar(16 + i)
        );
    END GENERATE;

    -- Rs, Rt, Rd
    rs: FOR i IN 0 TO 2 GENERATE
        reg_rs: OneBitRegister PORT MAP(
            i_input => i_Rs(i), i_enable => i_enable, i_clock => i_clock,
            i_async_reset => i_reset, i_async_set => '0', o_q => o_Rs(i), o_qBar => dummy_qBar(24 + i)
        );
    END GENERATE;

    rt: FOR i IN 0 TO 2 GENERATE
        reg_rt: OneBitRegister PORT MAP(
            i_input => i_Rt(i), i_enable => i_enable, i_clock => i_clock,
            i_async_reset => i_reset, i_async_set => '0', o_q => o_Rt(i), o_qBar => dummy_qBar(27 + i)
        );
    END GENERATE;

    rd: FOR i IN 0 TO 2 GENERATE
        reg_rd: OneBitRegister PORT MAP(
            i_input => i_Rd(i), i_enable => i_enable, i_clock => i_clock,
            i_async_reset => i_reset, i_async_set => '0', o_q => o_Rd(i), o_qBar => dummy_qBar(30 + i)
        );
    END GENERATE;


    -- Offset8
    offset: FOR i IN 0 TO 7 GENERATE
        reg_offset: OneBitRegister PORT MAP(
            i_input => i_Offset8(i), i_enable => i_enable, i_clock => i_clock,
            i_async_reset => i_reset, i_async_set => '0', o_q => o_Offset8(i), o_qBar => dummy_qBar(36 + i)
        );
    END GENERATE;

END structural;
