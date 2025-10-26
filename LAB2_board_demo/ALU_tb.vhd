LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY ALU_tb IS
END ALU_tb;

ARCHITECTURE testbench OF ALU_tb IS
    -- Component declaration for ALU
    COMPONENT ALU
        PORT (
            ALUop      : IN std_logic_vector(1 DOWNTO 0);
            funct      : IN std_logic_vector(5 DOWNTO 0);
            A, B       : IN std_logic_vector(7 DOWNTO 0);
            ALU_result : OUT std_logic_vector(7 DOWNTO 0);
            zero       : OUT std_logic
        );
    END COMPONENT;
    
    -- Signals to connect to ALU
    SIGNAL ALUop      : std_logic_vector(1 DOWNTO 0);
    SIGNAL funct      : std_logic_vector(5 DOWNTO 0);
    SIGNAL A, B       : std_logic_vector(7 DOWNTO 0);
    SIGNAL ALU_result : std_logic_vector(7 DOWNTO 0);
    SIGNAL zero       : std_logic;

BEGIN
    -- Instantiate ALU
    uut: ALU PORT MAP (
        ALUop      => ALUop,
        funct      => funct,
        A         => A,
        B         => B,
        ALU_result => ALU_result,
        zero       => zero
    );

    -- Stimulus process
    STIMULUS: PROCESS
    BEGIN
        -- Test lw/sw (Addition)
        ALUop  <= "00";
        A      <= X"05";
        B      <= X"03";
        funct  <= "000000";  -- Don't care in this case
        WAIT FOR 10 ns;
        REPORT "Addition Result: " & INTEGER'IMAGE(CONV_INTEGER(ALU_result));
        
        -- Test beq (Subtraction)
        ALUop  <= "01";
        A      <= X"08";
        B      <= X"08";
        WAIT FOR 10 ns;
        REPORT "Subtraction Result: " & INTEGER'IMAGE(CONV_INTEGER(ALU_result));
        
        -- Test ADD instruction (R-type)
        ALUop  <= "10";
        funct  <= "100000";
        A      <= X"10";
        B      <= X"10";
        WAIT FOR 10 ns;
        REPORT "R-type ADD Result: " & INTEGER'IMAGE(CONV_INTEGER(ALU_result));
        
        -- Test SUB instruction (R-type)
        funct  <= "100010";
        A      <= X"15";
        B      <= X"05";
        WAIT FOR 10 ns;
        REPORT "R-type SUB Result: " & INTEGER'IMAGE(CONV_INTEGER(ALU_result));
        
        -- Test AND instruction (R-type)
        funct  <= "100100";
        A      <= X"FF";
        B      <= X"0F";
        WAIT FOR 10 ns;
        REPORT "R-type AND Result: " & INTEGER'IMAGE(CONV_INTEGER(ALU_result));
        
        -- Test OR instruction (R-type)
        funct  <= "100101";
        A      <= X"F0";
        B      <= X"0F";
        WAIT FOR 10 ns;
        REPORT "R-type OR Result: " & INTEGER'IMAGE(CONV_INTEGER(ALU_result));
        
        -- Test SLT instruction (R-type)
        funct  <= "101010";
        A      <= X"05";
        B      <= X"10";
        WAIT FOR 10 ns;
        REPORT "R-type SLT Result: " & INTEGER'IMAGE(CONV_INTEGER(ALU_result));
        
        -- Stop simulation properly
        WAIT;
    END PROCESS;
END testbench;
