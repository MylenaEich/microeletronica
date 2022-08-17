library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cronometro is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Anodo : out  STD_LOGIC_VECTOR (3 downto 0);
           Useg : out  INTEGER;
           Dseg : out  INTEGER;
			  display: out std_logic_vector (6 downto 0)
			 );
end cronometro;

architecture Behavioral of cronometro is

component ssd is
	Port (num: in integer;
			display: out std_logic_vector(6 downto 0));
end component;

	constant timer: integer := 50000000; -- 1 segundo | Para Simulacao ==> 16
	constant display_frequency: integer := 32768; -- 32768; -- ~60Hz * 4 | Para Simulacao ==> 1
	
	signal count: integer range 0 to 50000000;
	signal limite: integer range 0 to 90 := 0;
	signal debounceDisplay: natural;
	signal sel: std_logic := '0';
	signal un_seg: integer range 0 to 9:= 0;
	signal dec_seg: integer range 0 to 9:= 9;
 	signal num: integer :=0;

begin
	process(rst, clk, count, debounceDisplay, un_seg, dec_seg, sel)
	begin
		if (rst = '1') then
			un_seg <= 0;
			dec_seg <= 9;
			count <= 0;
			debounceDisplay <= 0;
			sel <= '0';
			limite <= 0;
		elsif (clk'event and clk = '1') then
			
			if (count = timer) then
				if(limite < 81) then
					if (un_seg = 0) then
						un_seg <= 9;
						dec_seg <= dec_seg - 1;
						
					else 
						un_seg <= un_seg - 1;
						limite <= limite + 1;
					end if;
						
					count <= 0;
				end if;
			else count <= count + 1;
			end if;
			
			-- Mostrar tempo atual nos displays
			if (debounceDisplay = display_frequency) then
				if (sel = '1') then
					sel <= '0';
				else
					sel <= '1';
				end if;
				debounceDisplay <= 0;
			else 
				debounceDisplay <= debounceDisplay + 1;
			end if;
		end if;
	end process;
	
	Anodo <= "1110" WHEN sel = '0' ELSE
			"1101";
	num <= dec_seg when sel = '0' else un_seg;
	Useg <= un_seg;
	Dseg <= dec_seg;
			
	driver: ssd PORT MAP(num, display);
	
end Behavioral;

