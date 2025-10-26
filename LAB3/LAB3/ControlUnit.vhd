LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY ControlUnit IS
    PORT (
        opcode     : IN std_logic_vector(5 DOWNTO 0);
        RegDst     : OUT std_logic;
        Jump       : OUT std_logic;
        Branch     : OUT std_logic;
        MemRead    : OUT std_logic;
        MemToReg   : OUT std_logic;
        ALUOp      : OUT std_logic_vector(1 DOWNTO 0);
        MemWrite   : OUT std_logic;
        ALUSrc     : OUT std_logic;
        RegWrite   : OUT std_logic
    );
END ControlUnit;

ARCHITECTURE Behavioral OF ControlUnit IS
BEGIN
    PROCESS (opcode)
    BEGIN
        -- Default values
        RegDst   <= '0';
        Jump     <= '0';
        Branch   <= '0';
        MemRead  <= '0';
        MemToReg <= '0';
        ALUOp    <= "00";
        MemWrite <= '0';
        ALUSrc   <= '0';
        RegWrite <= '0';

        CASE opcode IS
            WHEN "000000" =>  -- R-type (ADD, SUB, AND, OR, SLT)
                RegDst   <= '1';
                ALUOp    <= "10";
                RegWrite <= '1';
                ALUSrc   <= '0';
            
            WHEN "100011" =>  -- LW (Load Word)
                MemRead  <= '1';
                MemToReg <= '1';
                ALUOp    <= "00";
                ALUSrc   <= '1';
                RegWrite <= '1';
            
            WHEN "101011" =>  -- SW (Store Word)
                MemWrite <= '1';
                ALUOp    <= "00";
                ALUSrc   <= '1';
					 
                
            WHEN "000100" =>  -- BEQ (Branch if Equal)
                Branch   <= '1';
                ALUOp    <= "01";
                ALUSrc   <= '0';
            
            WHEN "000010" =>  -- J (Jump)
                Jump     <= '1';
            
            WHEN OTHERS =>  -- Default case (NOP or invalid instruction)
                RegDst   <= '0';
                Jump     <= '0';
                Branch   <= '0';
                MemRead  <= '0';
                MemToReg <= '0';
                ALUOp    <= "00";
                MemWrite <= '0';
                ALUSrc   <= '0';
                RegWrite <= '0';
        END CASE;
    END PROCESS;
END Behavioral;