library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity controle_maquinas is
    Port (
        M : in  STD_LOGIC_VECTOR(3 downto 0);  -- M(3)=M4 ... M(0)=M1
        C : out STD_LOGIC_VECTOR(3 downto 0)   -- C(3)=C4 ... C(0)=C1
    );
end controle_maquinas;

architecture Behavioral of controle_maquinas is
    signal count : integer := 0;
begin
    process(M)
        variable liga : integer := 0;
    begin
        -- Inicializa
        C <= "0000";
        liga := 0;

        -- Prioridade: M1 > M2 > M3 > M4
        if M(0) = '1' and liga < 2 then
            C(0) <= '1';
            liga := liga + 1;
        end if;

        if M(1) = '1' and liga < 2 then
            C(1) <= '1';
            liga := liga + 1;
        end if;

        if M(2) = '1' and liga < 2 then
            C(2) <= '1';
            liga := liga + 1;
        end if;

        if M(3) = '1' and liga < 2 then
            C(3) <= '1';
            liga := liga + 1;
        end if;
    end process;
end Behavioral;

-- | Recurso da FPGA | Função Lógica | Pino FPGA |
-- | --------------- | ------------- | --------- |
-- | `SW0`           | M4            | PIN\_AB28 |
-- | `SW1`           | M3            | PIN\_AC28 |
-- | `SW2`           | M2            | PIN\_AC27 |
-- | `SW3`           | M1            | PIN\_AD27 |
-- | `LEDR0`         | C4            | PIN\_G19  |
-- | `LEDR1`         | C3            | PIN\_F19  |
-- | `LEDR2`         | C2            | PIN\_E19  |
-- | `LEDR3`         | C1            | PIN\_F21  |
-- Tabela de atribuição de pinos para a FPGA