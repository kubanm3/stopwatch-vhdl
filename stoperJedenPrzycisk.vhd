library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stoperJedenPrzycisk is
	Port ( 
		clock50MHz : in STD_LOGIC; --CLOCK 
		button : in STD_LOGIC; --przycisk wejscie
		OUT1 : out STD_LOGIC_VECTOR (6 downto 0); --wyjscie dziesietne sekundy
		OUT2 : out STD_LOGIC_VECTOR (6 downto 0); --wyjscie jednosci sekund
		OUT3 : out STD_LOGIC_VECTOR (6 downto 0); --wyjscie dziesiatki sekund
		OUT4 : out STD_LOGIC_VECTOR (6 downto 0)  --wyjscie minuty 
		);
end stoperJedenPrzycisk;


architecture Behavioral of stoperJedenPrzycisk is

	component dzielnik port (
		clk_in50MHz : in STD_LOGIC;
		clk_out10Hz : out STD_LOGIC);
	end component;

	component sevenSeg port (
		clk : in std_logic;
		bcd : in std_logic_vector(3 downto 0);
		segment7 : out std_logic_vector(6 downto 0));
	end component;
	
	component licznik16bit port (
		enable : in std_logic;
		CLOCK : in std_logic;
		OUTPUT0 : out STD_LOGIC_VECTOR (3 downto 0);
		OUTPUT1 : out STD_LOGIC_VECTOR (3 downto 0);
		OUTPUT2 : out STD_LOGIC_VECTOR (3 downto 0);
		OUTPUT3 : out STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component buttonLogika port (
		button : in std_logic; 
		CLK_btn : in std_logic;
		start : out std_logic;
		reset : out std_logic);
	end component;
		
	
	
		
begin

end Behavioral;