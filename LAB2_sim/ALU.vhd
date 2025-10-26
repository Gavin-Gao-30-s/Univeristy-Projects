LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY ALU IS
    PORT (
        ALUop      : IN std_logic_vector(1 DOWNTO 0);  -- ALU control signals from main control
        funct      : IN std_logic_vector(5 DOWNTO 0);  -- Function field from instruction
        A, B       : IN std_logic_vector(7 DOWNTO 0);  -- 8-bit ALU inputs
        ALU_result : OUT std_logic_vector(7 DOWNTO 0); -- 8-bit ALU result
        zero       : OUT std_logic                     -- Zero flag
    );
END ALU;

ARCHITECTURE behavioral OF ALU IS
    SIGNAL result : std_logic_vector(7 DOWNTO 0);
BEGIN

    PROCESS (ALUop, funct, A, B)
    BEGIN
        CASE ALUop IS
            WHEN "00" => -- For lw and sw (Addition)
                result <= A + B;

            WHEN "01" => -- For beq (Subtract)
                result <= A - B;

            WHEN "10" => -- R-type instructions
                CASE funct IS
                    WHEN "100000" => -- ADD
                        result <= A + B;

                    WHEN "100010" => -- SUBTRACT
                        result <= A - B;

                    WHEN "100100" => -- AND
                        result <= A AND B;

                    WHEN "100101" => -- OR
                        result <= A OR B;

                    WHEN "101010" => -- SET LESS THAN (SLT)
                        IF (A < B) THEN
                            result <= X"01";
                        ELSE
                            result <= X"00";
                        END IF;

                    WHEN OTHERS =>
                        result <= (OTHERS => '0');
                END CASE;

            WHEN OTHERS =>
                result <= (OTHERS => '0');
        END CASE;

        -- Set zero flag
        IF result = X"00" THEN
            zero <= '1';
        ELSE
            zero <= '0';
        END IF;

    END PROCESS;

    ALU_result <= result;

END behavioral;
