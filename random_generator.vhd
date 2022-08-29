
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity random_generator is
    Port (		
			  clk: in std_logic;
			  display: out std_logic_vector(6 downto 0);
			  anodo: out std_logic_vector(3 downto 0));
end random_generator;

architecture Behavioral of random_generator is

component ssd is
		Port(	num: in Integer;
			   display: out std_logic_vector(6 downto 0)
		);
end component;

signal count: integer range 0 to 50000000;
signal num: integer;
signal saida: integer;
type vetor is array (0 to 4) of integer;
constant entrada: vetor := (0,1,2,3,4);

begin

anodo <= "1110";
process(clk)
	begin
		if(clk'event and clk = '1') then
			count <= count + 1;
			if(count < 10e6) then
				saida <= entrada(0);
			end if;
			if(count > 10e6 and count < 20e6) then
				saida <= entrada(1);
			end if;
			if(count > 20e6 and count < 30e6) then
				saida <= entrada(2);
			end if;
			if(count > 30e6 and count < 40e6) then
				saida <= entrada(3);
			end if;
			if(count > 40e6 and count < 50e6) then
				saida <= entrada(4);
			end if;
		end if;
end process;
num <= saida;
driver: ssd PORT MAP(num, display);

end Behavioral;

