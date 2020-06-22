
--------------------------------------------------------------------------------
-- Company: University of Maryland
--
-- File: crc6.vhd
-- File history:
--      Initial, June 21, 2020
--
-- Description: 
-- Calculator of 6-bit CRC with 0x67 polynomial: x^6 + x^5 + x^2 + x^1 + 1
--   * data width: 26
-- Code from https://www.easics.com/webtools/crctool
--------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity crc6 is
  port(
    DATA: in std_logic_vector(25 downto 0);
    CRC:  out std_logic_vector(5 downto 0)
    );
end crc6;

architecture crc6_arch of crc6 is
  signal d:  std_logic_vector(25 downto 0);
begin
  d <= DATA; -- Using "d" simply to make lines shorter
  
  CRC(0) <= d(24) xor d(19) xor d(17) xor d(16) xor d(13) xor d(11) xor d(9) xor d(6) xor d(3) xor d(2) xor d(1) xor d(0);
  CRC(1) <= d(25) xor d(24) xor d(20) xor d(19) xor d(18) xor d(16) xor d(14) xor d(13) xor d(12) xor d(11) xor d(10)
            xor d(9) xor d(7) xor d(6) xor d(4) xor d(0);
  CRC(2) <= d(25) xor d(24) xor d(21) xor d(20) xor d(16) xor d(15) xor d(14) xor d(12) xor d(10) xor d(9) xor d(8)
            xor d(7) xor d(6) xor d(5) xor d(3) xor d(2) xor d(0);
  CRC(3) <= d(25) xor d(22) xor d(21) xor d(17) xor d(16) xor d(15) xor d(13) xor d(11) xor d(10) xor d(9) xor d(8)
            xor d(7) xor d(6) xor d(4) xor d(3) xor d(1);
  CRC(4) <= d(23) xor d(22) xor d(18) xor d(17) xor d(16) xor d(14) xor d(12) xor d(11) xor d(10) xor d(9) xor d(8)
            xor d(7) xor d(5) xor d(4) xor d(2);
  CRC(5) <= d(23) xor d(18) xor d(16) xor d(15) xor d(12) xor d(10) xor d(8) xor d(5) xor d(2) xor d(1) xor d(0);

end crc6_arch;
