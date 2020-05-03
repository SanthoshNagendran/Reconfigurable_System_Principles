library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity GATES is
port(
--Inputs
   A,B,C : in std_logic;
--OUTPUTS
   F,Q : out std_logic );
end GATES;

architecture RTL of GATES is
begin
   F<= (A or B) and C;

   process(C) begin
     if(rising_edge(C)) then
       Q <= B;
     end if;
   end process;

end RTL;