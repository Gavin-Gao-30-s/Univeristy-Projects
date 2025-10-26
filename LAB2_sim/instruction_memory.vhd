LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY instruction_memory IS
    PORT (
        address  : IN  std_logic_vector(7 DOWNTO 0); -- 8-bit address for 256 locations
        instruction : OUT std_logic_vector(31 DOWNTO 0)
    );
END instruction_memory;

ARCHITECTURE rtl OF instruction_memory IS
    TYPE rom_type IS ARRAY (0 TO 255) OF std_logic_vector(31 DOWNTO 0);
    CONSTANT rom : rom_type := (
    -- 0x00: lw $2, 0($0)
    0  => X"8C020000",
    -- 0x04: lw $3, 1($0)
    4  => X"8C030001",
    -- 0x08: sub $1, $3, $2
    8  => X"00620822",
    -- 0x0C: or $4, $1, $3
    12 => X"00232025",
    -- 0x10: inserted instr: beq $1, $1, 20 jump to address 36
    16 => X"10210004",
    -- 0x14: sw $4, 3($0)
    20 => X"AC040003",
    -- 0x18: add $1, $2, $3
    24 => X"00430820",
    -- 0x1C: sw $1, 4($0)
    28 => X"AC010004",
    -- 0x20: lw $2, 3($0)
    32 => X"8C020003",
    -- 0x24: lw $3, 4($0)
    36 => X"8C030004",
    -- 0x28: j 11
    40 => X"0800000B",
    -- 0x2C: beq $1, $1, -44 jump back to begining address 0
    44 => X"1021FFF4",
    -- 0x30: beq $1, $2, -8
    48 => X"1022FFFD",
    OTHERS => X"00000000"
    );
BEGIN
    instruction <= rom(CONV_INTEGER(address));
END rtl;

