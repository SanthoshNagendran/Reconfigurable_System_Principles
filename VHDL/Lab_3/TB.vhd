library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity TB is

end TB;

architecture Behave of TB is
  component GATES is
   port(
--Inputs
   A,B,C : in std_logic;
--OUTPUTS
   F : out std_logic );
   end component;
   
   signal SIG1,SIG2,SIG3,SIG4 : std_logic;
begin
  GATES1 : GATES port map (
		A => SIG1,
		B => SIG2,
		C => SIG3,
		F => SIG4 );
  process begin
     SIG1 <= '0'; SIG2 <= '0'; SIG3 <= '0';
     wait for 10 ps;
     assert (SIG4 = '1') report "FAIL" severity note;
     SIG1 <= '0'; SIG2 <= '0'; SIG3 <= '1';
     wait for 10 ps;
     SIG1 <= '0'; SIG2 <= '1'; SIG3 <= '0';
     wait for 10 ps;
     SIG1 <= '0'; SIG2 <= '1'; SIG3 <= '1';
     wait for 10 ps;
     SIG1 <= '1'; SIG2 <= '0'; SIG3 <= '0';
     wait for 10 ps;
     SIG1 <= '1'; SIG2 <= '0'; SIG3 <= '1';
     wait for 10 ps;
     SIG1 <= '1'; SIG2 <= '1'; SIG3 <= '0';
     wait for 10 ps;
     SIG1 <= '1'; SIG2 <= '1'; SIG3 <= '1';
     wait;

  end process;

end Behave;



