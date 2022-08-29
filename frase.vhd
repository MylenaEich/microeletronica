library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity frase is
    Port ( rst: in std_logic;
			  clk: in std_logic;
           saida_frase : out  STD_LOGIC;
			  display: out STD_LOGIC_VECTOR(6 downto 0);
			  anodo: out STD_LOGIC_VECTOR(4 downto 0));
end frase;

architecture Behavioral of frase is

component ssd_string is 
	 Port ( letra : in  Character;
		  display : out  STD_LOGIC_VECTOR (6 downto 0));
end component;

signal i: integer range 0 to 36 := 0;

signal countDisplay: natural;
signal sel: STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
signal letra: Character;
signal letra1: Character;
signal letra2: Character;
signal letra3: Character;
signal letra4: Character;
signal countButton: integer :=0;
signal count: integer range 0 to 50000000;
constant frase: String := "projeto aplicativo - mylena e piero";
constant display_frequency: integer := 5000; 
constant timer: integer := 50000000; 

begin
--	process (clk, rst)
--		begin
--			if (clk'event and clk = '1') then
--				
--			end if;
--	end process;
	
	process(i, clk, rst)
		begin
			if(rst = '1') then
				i <= 0;
				count <= 0;
				countDisplay <= 0;
				sel <= "00";
				elsif (clk'event and clk = '1') then
					if (count = timer) then
						if(i < 32) then
							i  <= i + 1;
							letra1 <= frase(i+1);
							letra2 <= frase(i+2);
							letra3 <= frase(i+3);
							letra4 <= frase(i+4);
						else i <= 0;
						end if;	
					count <= 0;
					else count <= count + 1;
					end if;
				if (countDisplay = display_frequency) then
								if (sel = "11") then
									sel <= "00";
								else
									sel <= std_logic_vector(unsigned(sel) + 1);
								end if;
								countDisplay <= 0;
							else 
								countDisplay <= countDisplay + 1;
							end if;
			end if;
	end process;
	
	anodo <= "11110" when sel = "00" else
				"11101" when sel = "01" else
				"11011" when sel = "10" else
				"10111";
	letra <= letra1 when sel = "00" else
				letra2 when sel = "01" else
				letra3 when sel = "10" else
				letra4;
	
	driver_string: ssd_string PORT MAP (letra, display);
end Behavioral;

