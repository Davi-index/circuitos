library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity requisito2 is
    Port (
        BCD : in  STD_LOGIC_VECTOR(3 downto 0);   -- Entrada binária
        SEG : out STD_LOGIC_VECTOR(6 downto 0)    -- Saída para segmentos (a até g)
    );
end requisito2;

architecture Behavioral of requisito2 is
begin
    process(BCD)
    begin
        case BCD is
            when "0000" => SEG <= "0000001"; -- 0
            when "0001" => SEG <= "1001111"; -- 1
            when "0010" => SEG <= "0010010"; -- 2
            when "0011" => SEG <= "0000110"; -- 3
            when "0100" => SEG <= "1001100"; -- 4
            when "0101" => SEG <= "0100100"; -- 5
            when "0110" => SEG <= "0100000"; -- 6
            when "0111" => SEG <= "0001111"; -- 7
            when "1000" => SEG <= "0000000"; -- 8
            when "1001" => SEG <= "0000100"; -- 9
            when "1010" => SEG <= "0001000"; -- A
            when "1011" => SEG <= "1100000"; -- b
            when "1100" => SEG <= "0110001"; -- C
            when "1101" => SEG <= "1000010"; -- d
            when "1110" => SEG <= "0110000"; -- E
            when "1111" => SEG <= "0111000"; -- F
            when others => SEG <= "1111111"; -- Tudo apagado
        end case;
    end process;
end Behavioral;
