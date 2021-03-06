--
-- DO NOT EDIT THIS FILE, your changes will be overwritten
-- This is an automatically generated file.
-- It was generated with uasm, the microassembler, on
-- Wed Nov 27 15:21:25 2019
--
--
--
-- Yeilding a total data width of 45 bits for 9 fields.
-- The maximum address encountered was 0x7ff, needing 11 bits
--
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;

entity MICROCODE_ROM is
port( ADDR_IN  : in  unsigned(10 downto 0);
      DATA_OUT : out std_logic_vector(44 downto 0));
end MICROCODE_ROM;

architecture RTL of MICROCODE_ROM is

   signal DATA_OUT_R : std_logic_vector(44 downto 0);
begin
   DATA_OUT <= DATA_OUT_R;

   process(ADDR_IN)
     begin
        case ADDR_IN is
          -- START:
          when "00000000000" => DATA_OUT_R <= "001000000000000000000000000000000000000000100";
          when "00000000001" => DATA_OUT_R <= "000000000000000000000000000000000000000000001";
          when "00000000010" => DATA_OUT_R <= "000000010000000000000000000000000000000000001";
          when "00000000011" => DATA_OUT_R <= "000000000000000000000000000000000000000000000";
          when "00000000100" => DATA_OUT_R <= "000000000000000000000000000000000000000000000";
          when "00000000101" => DATA_OUT_R <= "010000000000000000000000000000000000000000100";
          when "00000000110" => DATA_OUT_R <= "001000000000100000000100000000000101010000010";
          when "00000000111" => DATA_OUT_R <= "000000001000000000000000000000000000000000000";
          when "00000001000" => DATA_OUT_R <= "000000010000000000000000000000000000000000000";
          when "00000001001" => DATA_OUT_R <= "000000100000000000000000000000000000000000000";
          when "00000001010" => DATA_OUT_R <= "001010011010000000000000000000000000000000000";
          when "00000001011" => DATA_OUT_R <= "000000000000000000001100000000000011010000000";
          when "00000001100" => DATA_OUT_R <= "000010110000000000001000000000000100100000000";
          -- SKIP:
          when "00000001101" => DATA_OUT_R <= "000000000000000000010000000000000100010000000";
          when "00000001110" => DATA_OUT_R <= "000000000000000000011000000000000101000000000";
          when "00000001111" => DATA_OUT_R <= "000000000000000000100000000000000101010000000";
          when "00000010000" => DATA_OUT_R <= "000000000000000000000100000000000100100000000";
          -- END:
          when "00000010001" => DATA_OUT_R <= "100001100001100000000100000000000101100000000";
          -- L1:
          when "00000010010" => DATA_OUT_R <= "000000000000000000000000000000000101000000000";
          when "00000010011" => DATA_OUT_R <= "100000100000100000000100000000000101010000000";
          -- L2:
          when "00000010100" => DATA_OUT_R <= "100010100001100000000100000000000100010000000";
          -- DONE:
          when "00000010101" => DATA_OUT_R <= "100000000000000000000100000000000101000000000";
          -- LOOP:
          when "00000010110" => DATA_OUT_R <= "000000111000000001000100000000000000000000000";
          when "11111111111" => DATA_OUT_R <= "000000000000000000000000000000000000000000000";
          when others => DATA_OUT_R <= "000000000000000000000000000000000000000000000";
       end case;
     end process;
end RTL;
