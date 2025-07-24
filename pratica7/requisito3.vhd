library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity requisito3 is
    Port (
        x : in  STD_LOGIC_VECTOR(3 downto 0); -- x(3)=x3 ... x(0)=x0
        m : out STD_LOGIC_VECTOR(1 downto 0); -- código binário
        v : out STD_LOGIC                    -- válido
    );
end requisito3;

architecture Behavioral of requisito3 is
begin
    process(x)
    begin
        if x(3) = '0' then
            m <= "11"; v <= '1';
        elsif x(2) = '0' then
            m <= "10"; v <= '1';
        elsif x(1) = '0' then
            m <= "01"; v <= '1';
        elsif x(0) = '0' then
            m <= "00"; v <= '1';
        else
            m <= "00"; v <= '0';
        end if;
    end process;
end Behavioral;
