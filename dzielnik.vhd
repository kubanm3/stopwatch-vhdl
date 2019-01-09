library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dzielnik is
    Port (
        clk_in50MHz : in  STD_LOGIC; --wejscie ukladu
        clk_out10Hz: out STD_LOGIC	 --wyjscie ukladu
    );
end dzielnik;

architecture Behavioral of dzielnik is
    signal temp: STD_LOGIC;
    signal counter : integer range 2499999 downto 0 := 2499999;
begin
    frequency_divider: process (clk_in50MHz) begin
        if rising_edge(clk_in50MHz) then --sprawdzenie narastajacego zbocza zegara
            if (counter = 0) then -- przy zejsciu countera do zera zmieniamy wartosc tymczasowa na odwrotna i ustawiamy counter z powrotem na 2499999
                temp <= NOT(temp);
                counter <= 2499999;
            else						 -- jezeli counter nie jest rowny zero to zmniejszamy go
                counter <= counter - 1;
            end if;
        end if;
    end process;
    
    clk_out10Hz <= temp; -- przypisanie aktualnej wartosci tymczasowej zegara do wyjscia
end Behavioral;