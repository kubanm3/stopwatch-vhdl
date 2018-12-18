library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dzielnik is
    Port (
        clk_in50MHz : in  STD_LOGIC;
        clk_out10Hz: out STD_LOGIC
    );
end dzielnik;

architecture Behavioral of dzielnik is
    signal temp: STD_LOGIC;
    signal counter : integer range 0 to 4999999 := 0;
begin
    frequency_divider: process (clk_in50MHz) begin
        if rising_edge(clk_in50MHz) then
            if (counter = 4999999) then
                temp <= NOT(temp);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out10Hz <= temp;
end Behavioral;
