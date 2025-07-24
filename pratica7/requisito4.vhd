library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity requisito4 is
    Port (
        BTN : in  STD_LOGIC_VECTOR(3 downto 0);  -- BTN(3)=D ... BTN(0)=A (nível baixo = pressionado)
        SEG : out STD_LOGIC_VECTOR(6 downto 0)   -- Saída para display de 7 segmentos (ânodo comum)
    );
end requisito4;

architecture Behavioral of requisito4 is
    signal M : STD_LOGIC_VECTOR(1 downto 0);
    signal V : STD_LOGIC;
begin
    -- Codificador de prioridade embutido
    process(BTN)
    begin
        if BTN(3) = '0' then
            M <= "11"; V <= '1';
        elsif BTN(2) = '0' then
            M <= "10"; V <= '1';
        elsif BTN(1) = '0' then
            M <= "01"; V <= '1';
        elsif BTN(0) = '0' then
            M <= "00"; V <= '1';
        else
            M <= "00"; V <= '0';
        end if;
    end process;

    -- Decodificador de 2 bits para letras A, B, C, D
    process(M, V)
    begin
        if V = '0' then
            SEG <= "1111111"; -- display apagado
        else
            case M is
                when "00" => SEG <= "0001000"; -- A
                when "01" => SEG <= "1100000"; -- b
                when "10" => SEG <= "0110001"; -- C
                when "11" => SEG <= "1000010"; -- d
                when others => SEG <= "1111111";
            end case;
        end if;
    end process;
end Behavioral;
