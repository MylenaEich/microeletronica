library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ssd is
		Port(	num: in Integer;
			   display: out std_logic_vector(6 downto 0)
		);
end ssd;

architecture Behavioral of ssd is

begin

	process(num)
		begin
			case num is
			when 0 =>
			display <= "0000001";
			when 1 =>
			display <= "1001111";
			when 2 =>
			display <= "0010010";
			when 3 =>
			display <= "0000110";
			when 4 =>
			display <= "1001100";
			when 5 =>
			display <= "0100100";
			when 6 =>
			display <= "0100000";
			when 7 =>
			display <= "0001111";
			when 8 =>
			display <= "0000000";
			when 9 =>
			display <= "0000100";
			when others =>
			display <= "1111111";
		end case;
		end process;

end Behavioral;

