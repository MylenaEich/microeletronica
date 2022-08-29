library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ssd_string is
    Port ( letra : in  Character;
           display : out  STD_LOGIC_VECTOR (6 downto 0));
end ssd_string;

architecture Behavioral of ssd_string is

begin

process(letra)
	begin
		case letra is 
		when 'a' =>
		display <= "0000010";
		when 'c' =>
		display <= "1110010";
		when 'e' =>
		display <= "0110000";
		when 'i' =>
		display <= "1001111";
		when 'j' =>
		display <= "1000111";
		when 'l' =>
		display <= "1110001";
		when 'm' =>
		display <= "0101010";
		when 'n' =>
		display <= "1101010";
		when 'o' =>
		display <= "1100010";
		when 'p' =>
		display <= "0011000";
		when 'r' =>
		display <= "1111010";
		when 't' =>
		display <= "1111000";
		when 'v' =>
		display <= "1010101";
		when 'y' =>
		display <= "1000100";
		when '-' =>
		display <= "1111110";
		when others =>
		display <= "1111111";
		end case;
end process;


end Behavioral;

