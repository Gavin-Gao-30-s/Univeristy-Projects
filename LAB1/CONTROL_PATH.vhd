LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY CONTROL_PATH IS
    PORT(
        i_clock     : IN  STD_LOGIC;
        i_enable    : IN  STD_LOGIC;
        i_async_reset : IN STD_LOGIC;
        
		  A_eq_B : IN STD_LOGIC;
		  A_gt_B: IN STD_LOGIC;
		  Valid: IN STD_LOGIC;
		  Matched: IN STD_LOGIC;
		  isAdd: IN STD_LOGIC;
		  normalized: IN STD_LOGIC;
		  ShiftRMAN: IN STD_LOGIC;
        S0_out, S1_out, S2_out, S3_out, S4_out, S5_out, S6_out, S7_out, S8_out, S9_out, S10_out, S11_out: OUT STD_LOGIC; --for testpurpose
		  rst, count1, sel1, sel2 ,sel3, sel4, sel5, load1, load2, load3, load4, loadALU, shiftL, shiftR1, shiftR2, INC, DEC, Round, EXCEPTION : OUT STD_LOGIC
		   
    );
END CONTROL_PATH;

ARCHITECTURE structural OF CONTROL_PATH IS
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
    SIGNAL S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,S10,S11,Sextra: STD_LOGIC;

BEGIN
    -- D Flip-Flop for S0
    dff_S0: dflipflop
        PORT MAP (
            i_d => '0',  -- S0 is hardcoded to '0'
            i_clock => i_clock,
            i_enable => i_enable,
            i_async_reset => '0',
            i_async_set => i_async_reset,
            o_q => S0,
            o_qBar => OPEN
        );

    -- D Flip-Flop for S1
    dff_S1: dflipflop
        PORT MAP (
            i_d => S0 AND Valid AND NOT A_eq_B AND A_gt_B, 
            i_clock => i_clock,
            i_enable => i_enable,
            i_async_reset => i_async_reset,
            i_async_set => '0',
            o_q => S1,
            o_qBar => OPEN
        );

    -- D Flip-Flop for S2
    dff_S2: dflipflop
        PORT MAP (
            i_d => S0 AND NOT A_eq_B AND NOT A_gt_B AND Valid, 
            i_clock => i_clock,
            i_enable => i_enable,
            i_async_reset => i_async_reset,
            i_async_set => '0',
            o_q => S2,
            o_qBar => OPEN
        );
	  dff_S3: dflipflop
        PORT MAP (
            i_d => Valid AND S0 AND A_eq_B, 
            i_clock => i_clock,
            i_enable => i_enable,
            i_async_reset => i_async_reset,
            i_async_set => '0',
            o_q => S3,
            o_qBar => OPEN
        );
		  dff_S4: dflipflop
        PORT MAP (
            i_d => S2 OR S1 OR (S4 AND NOT Matched), 
            i_clock => i_clock,
            i_enable => i_enable,
            i_async_reset => i_async_reset,
            i_async_set => '0',
            o_q => S4,
            o_qBar => OPEN
        );
		  dff_S5: dflipflop
        PORT MAP (
            i_d => (S3 AND isAdd) OR (S4 AND Matched AND isAdd), 
            i_clock => i_clock,
            i_enable => i_enable,
            i_async_reset => i_async_reset,
            i_async_set => '0',
            o_q => S5,
            o_qBar => OPEN
        );
		  dff_S6: dflipflop
        PORT MAP (
            i_d => (S3 AND NOT isAdd) OR (S4 AND Matched AND NOT isAdd), 
            i_clock => i_clock,
            i_enable => i_enable,
            i_async_reset => i_async_reset,
            i_async_set => '0',
            o_q => S6,
            o_qBar => OPEN
        );
		    dff_Sextra: dflipflop
        PORT MAP (
            i_d =>  S5 OR S6, 
            i_clock => i_clock,
            i_enable => i_enable,
            i_async_reset => i_async_reset,
            i_async_set => '0',
            o_q => Sextra,
            o_qBar => OPEN
        );
		  dff_S7: dflipflop
        PORT MAP (
            i_d => Sextra, 
            i_clock => i_clock,
            i_enable => i_enable,
            i_async_reset => i_async_reset,
            i_async_set => '0',
            o_q => S7,
            o_qBar => OPEN
        );
		  dff_S8: dflipflop
        PORT MAP (
            i_d => ( ShiftRMAN AND S7 AND NOT normalized), 
            i_clock => i_clock,
            i_enable => i_enable,
            i_async_reset => i_async_reset,
            i_async_set => '0',
            o_q => S8,
            o_qBar => OPEN
        );
		  dff_S9: dflipflop
        PORT MAP (
            i_d => (S7 AND NOT normalized AND NOT ShiftRMAN) OR (S9 AND NOT normalized AND NOT ShiftRMAN), 
            i_clock => i_clock,
            i_enable => i_enable,
            i_async_reset => i_async_reset,
            i_async_set => '0',
            o_q => S9,
            o_qBar => OPEN
        );
		  dff_S10: dflipflop
        PORT MAP (
            i_d =>  (S7 AND normalized) OR S8 OR (S9 AND normalized), 
            i_clock => i_clock,
            i_enable => i_enable,
            i_async_reset => i_async_reset,
            i_async_set => '0',
            o_q => S10,
            o_qBar => OPEN
        );
		    dff_S11: dflipflop
        PORT MAP (
            i_d =>  S0 AND NOT Valid, 
            i_clock => i_clock,
            i_enable => i_enable,
            i_async_reset => i_async_reset,
            i_async_set => '0',
            o_q => S11,
            o_qBar => OPEN
        );
		
		  

    -- Output Assignments, rst, count1, sel1, sel2 ,sel3, sel4, sel5, load1, load2, load3, load4, loadALU, shiftL, shiftR1, shiftR2, INC, DEC, Round, EXCEPTION
	 rst <= S0;
	 load1<= S0;
	 load2 <= S1 OR S2 OR S3;
	 load3 <= S7;
	 load4 <= S1 OR S2 OR S3;
	 loadALU <= S5 OR S6;
	 count1 <= S4 OR S7;
	 INC <= S4 OR S8;
	 shiftR1 <= S4;
	 shiftR2 <= S8;
	 DEC <= S9;
	 shiftL <= S9 or (S10 AND isAdd);
	 Round <= S10;
	 EXCEPTION <= S11;
	 
	 
	 sel1 <= S0;
	 sel2<= S1;
	 sel3 <= S1 OR S3;
	 sel4 <= S2;
	 sel5 <= S6;
	 
	 
    S0_out <= S0;
    S1_out <= S1;
    S2_out <= S2;
	 S3_out <= S3;
	 S4_out <= S4;
	 S5_out <= S5;
	 S6_out <= S6;
	 S7_out <= S7;
	 S8_out <= S8;
	 S9_out <= S9;
	 S10_out <= S10;

END structural;
