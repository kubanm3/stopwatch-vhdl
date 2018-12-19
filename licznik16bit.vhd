library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity licznik16bit is	
	port (enable, CLOCK : in std_logic;
		  RST : in STD_LOGIC;
		  OUTPUT0 : out STD_LOGIC_VECTOR (3 downto 0);
		  OUTPUT1 : out STD_LOGIC_VECTOR (3 downto 0);
		  OUTPUT2 : out STD_LOGIC_VECTOR (3 downto 0);
		  OUTPUT3 : out STD_LOGIC_VECTOR (3 downto 0));
end licznik16bit;

architecture Behavioral of licznik16bit is
signal s_dziesietnaS, s_jednoscS, s_dziesiatkaS, s_minuta : std_logic_vector(3 downto 0) :="0000";

begin

process(CLOCK, RST)
begin

if RST='1' then
	s_dziesietnaS <= (others=> '0'); -- MIEJSCE: [---*]
	s_jednoscS <= (others=> '0'); -- MIEJSCE: [--*-]
	s_dziesiatkaS <= (others=> '0'); -- MIEJSCE: [-*--]
	s_minuta <= (others=> '0'); -- MIEJSCE: [*---]
	
elsif (enable = '1' and rising_edge(CLOCK)) then
	if s_dziesietnaS="1001" then
		s_dziesietnaS<="0000";
		if s_jednoscS="1001" then
			s_jednoscS<="0000";
			if s_dziesiatkaS="0101" then
				s_dziesiatkaS<="0000";
				if s_minuta="1001" then
					s_minuta<="0000";
				else 
					s_minuta <= s_minuta + 1;
				end if;
			else 
				s_dziesiatkaS <= s_dziesiatkaS + 1;
			end if;
		else
			s_jednoscS <= s_jednoscS + 1;
		end if;
	else
		s_dziesietnaS <= s_dziesietnaS + 1;
	end if;
end if;

end process;

OUTPUT0<=s_dziesietnaS;
OUTPUT1<=s_jednoscS;
OUTPUT2<=s_dziesiatkaS;
OUTPUT3<=s_minuta;

					
end Behavioral;			
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					
					