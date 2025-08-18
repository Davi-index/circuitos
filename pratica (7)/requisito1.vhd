library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity requisito1 is
    Port (
        S  : in  STD_LOGIC_VECTOR(1 downto 0); -- S1 e S0
        Y  : out STD_LOGIC_VECTOR(3 downto 0)  -- saída de 4 bits
    );
end requisito1;

architecture Behavioral of requisito1 is
    -- Constantes com valores fixos para simulação ou implementação
    constant I0 : STD_LOGIC_VECTOR(3 downto 0) := "0001";
    constant I1 : STD_LOGIC_VECTOR(3 downto 0) := "0010";
    constant I2 : STD_LOGIC_VECTOR(3 downto 0) := "0100";
    constant I3 : STD_LOGIC_VECTOR(3 downto 0) := "1000";
begin
    process(S)
    begin
        case S is
            when "00" => Y <= I0;
            when "01" => Y <= I1;
            when "10" => Y <= I2;
            when "11" => Y <= I3;
            when others => Y <= (others => '0');
        end case;
    end process;
end Behavioral;
