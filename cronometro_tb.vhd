
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY cronometro_tb IS
END cronometro_tb;
 
ARCHITECTURE behavior OF cronometro_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cronometro
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         Anodo : OUT  std_logic_vector(3 downto 0);
         display : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal Anodo : std_logic_vector(3 downto 0);
   signal display : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cronometro PORT MAP (
          rst => rst,
          clk => clk,
          Anodo => Anodo,
          display => display
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
