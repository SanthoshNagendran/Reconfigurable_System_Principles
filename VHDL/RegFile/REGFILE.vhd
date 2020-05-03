library IEEE;
use IEEE.std_logic_1164.ALL;
use IEEE.numeric_std.ALL;

entity REGFILE is
port(
--Inputs
   DSEL,ASEL,BSEL  : in unsigned (2 downto 0);
   DIN,RIN 	: in unsigned (15 downto 0);
   RST,CLK : in std_logic;
--OUTPUTS
   ABUS,BBUS : out unsigned (15 downto 0) );

end REGFILE;

architecture behavioural of REGFILE is
   type registerFile is array(1 to 7) of unsigned(15 downto 0);
    
    signal registers : registerFile;
   -- signal R1,R2,R3,R4,R5,R6,R7 : unsigned (15 downto 0);

    begin

	process(CLK,RST)
	begin
	  if (RST = '0') then
	  	registers(1)(15 downto 0) <= to_unsigned(0,16);
		registers(2)(15 downto 0) <= to_unsigned(0,16);	
		registers(3)(15 downto 0) <= to_unsigned(0,16);
		registers(4)(15 downto 0) <= to_unsigned(0,16);
		registers(5)(15 downto 0) <= to_unsigned(0,16);
		registers(6)(15 downto 0) <= to_unsigned(0,16);
		registers(7)(15 downto 0) <= to_unsigned(0,16);
	--	R1 <= to_unsigned(0,16);
	--	R2 <= to_unsigned(0,16);
	--	R3 <= to_unsigned(0,16);
	--	R4 <= to_unsigned(0,16);
	--	R5 <= to_unsigned(0,16);
	--	R6 <= to_unsigned(0,16);
	--	R7 <= to_unsigned(0,16);

	  
	   elsif (rising_edge(CLK)) then
		case DSEL is
		  when "001" =>
			registers(1) <= RIN;
	--		R1 <= RIN;
		  when "010" =>
			registers(2) <= RIN;
	--		R2 <= RIN;
		  when "011" =>
	--		R3 <= RIN;
			registers(3) <= RIN;
		  when "100" =>
			registers(4) <= RIN;
	--		R4 <= RIN;
		  when "101" =>
			registers(5) <= RIN;
	--		R5 <= RIN;
		  when "110" =>
			registers(6) <= RIN;
	--		R6 <= RIN;
		  when "111" =>
			registers(7) <= RIN;
	--		R7 <= RIN;
		  when others =>
			null;
		end case;
 	end if;
	end process;


	--process(ASEL,DIN,R1,R2,R3,R4,R5,R6,R7)
	process(ASEL,DIN,registers)
	begin
		case ASEL is
		  when "000" =>
			ABUS <= DIN;
		  when "001" =>
			ABUS <= registers(1);
	--		ABUS <= R1;
	  	  when "010" =>
			ABUS <= registers(2);
	--		ABUS <= R2;
	  	  when "011" =>
			ABUS <= registers(3);
	--		ABUS <= R3;
	  	  when "100" =>
			ABUS <= registers(4);
	--		ABUS <= R4;
	  	  when "101" =>
			ABUS <= registers(5);
	--		ABUS <= R5;
	  	  when "110" =>
			ABUS <= registers(6);
	--		ABUS <= R6;
	  	  when "111" =>
			ABUS <= registers(7);
	--		ABUS <= R7;
		  when others =>
			null;	
		end case;
		end process;

	--	process(ASEL,DIN,R1,R2,R3,R4,R5,R6,R7)
		process(BSEL,DIN,registers)
		begin
		case BSEL is
		  when "000" =>
			BBUS <= DIN;
		  when "001" =>
			BBUS <= registers(1);
	--		BBUS <= R1;
		  when "010" =>
			BBUS <= registers(2);
	--		BBUS <= R2;
		  when "011" =>
			BBUS <= registers(3);
	--		BBUS <= R3;
		  when "100" =>
			BBUS <= registers(4);
	--		BBUS <= R4;
		  when "101" =>
			BBUS <= registers(5);
	--		BBUS <= R5;
		  when "110" =>
			BBUS <= registers(6);
	--		BBUS <= R6;
		  when "111" =>
			BBUS <= registers(7);
	--		BBUS <= R7;
		  when others =>
			null;
		end case;

	  end process;
		

    end behavioural;