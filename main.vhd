library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
	Port( rst: in std_logic;
			clk: in std_logic;
			button: in std_logic;
			display: out std_logic_vector(6 downto 0);
			anodo: out std_logic_vector(3 downto 0)
			
	);
end main;

architecture Behavioral of main is
component ssd is
	Port (char: in character;
			num: in integer;
			display: out std_logic_vector(6 downto 0));
end component;

component cronometro is 
	 Port ( rst : in  STD_LOGIC;
			  clk : in  STD_LOGIC;
			  Anodo : out  STD_LOGIC_VECTOR (3 downto 0);
			  Useg : out  INTEGER;
			  Dseg : out  INTEGER
		 );
end component;
signal char: character;
signal sel: std_logic_vector(3 downto 0):="1011";

signal useg: integer range 0 to 9;
signal dseg: integer range 0 to 9;
signal num: integer range 0 to 9;

begin

temporizador: cronometro PORT MAP (rst, clk, sel, Useg, Dseg);

process(sel)
		begin
			if(sel <= "1011") then
				num <= dseg;
			else 
				num <= useg;
			end if;
	end process;
	
anodo <= sel;

driver: ssd PORT MAP(char ,num, display);

end Behavioral;

