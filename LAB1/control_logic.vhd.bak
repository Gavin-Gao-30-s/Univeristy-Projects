LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY control_logic IS
    PORT(
        i_clock     : IN  STD_LOGIC;
        i_enable    : IN  STD_LOGIC;
        i_async_reset : IN STD_LOGIC;
        control1    : IN  STD_LOGIC;
        control2    : IN  STD_LOGIC;
        S0, S1, S2  : OUT STD_LOGIC
    );
END control_logic;

ARCHITECTURE structural OF control_logic IS
    -- Component Declaration for D Flip-Flop
    COMPONENT dflipflop
        PORT(
            i_d : IN STD_LOGIC;
            i_clock : IN STD_LOGIC;
            i_enable : IN STD_LOGIC;
            i_async_reset : IN STD_LOGIC;
            i_async_set : IN STD_LOGIC;
            o_q, o_qBar : OUT STD_LOGIC
        );
    END COMPONENT;

    -- Signal Declaration
    SIGNAL S0_internal, S1_internal, S2_internal : STD_LOGIC;
    SIGNAL S0_and_control1, S1_and_control2 : STD_LOGIC;

BEGIN
    -- S0 Logic: Fixed to '0'
    S0_internal <= '0';

    -- AND Gate for S1 Logic
    S0_and_control1 <= S0_internal AND control1;

    -- AND Gate for S2 Logic
    S1_and_control2 <= S1_internal AND control2;

    -- D Flip-Flop for S0
    dff_S0: dflipflop
        PORT MAP (
            i_d => S0_internal,
            i_clock => i_clock,
            i_enable => i_enable,
            i_async_reset => i_async_reset,
            i_async_set => '0',
            o_q => S0_internal,
            o_qBar => OPEN
        );

    -- D Flip-Flop for S1
    dff_S1: dflipflop
        PORT MAP (
            i_d => S0_and_control1,
            i_clock => i_clock,
            i_enable => i_enable,
            i_async_reset => i_async_reset,
            i_async_set => '0',
            o_q => S1_internal,
            o_qBar => OPEN
        );

    -- D Flip-Flop for S2
    dff_S2: dflipflop
        PORT MAP (
            i_d => S1_and_control2,
            i_clock => i_clock,
            i_enable => i_enable,
            i_async_reset => i_async_reset,
            i_async_set => '0',
            o_q => S2_internal,
            o_qBar => OPEN
        );

    -- Output Assignments
    S0 <= S0_internal;
    S1 <= S1_internal;
    S2 <= S2_internal;

END structural;
