library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sistema_combinacional is
    Port (
        -- Entradas
        SW  : in  STD_LOGIC_VECTOR(1 downto 0);   -- para MUX (S1 e S0)
        BTN : in  STD_LOGIC_VECTOR(3 downto 0);   -- botões para conceitos (nível baixo)

        -- Saídas
        LED_MUX : out STD_LOGIC_VECTOR(3 downto 0); -- saída do MUX
        LED_ENC : out STD_LOGIC_VECTOR(2 downto 0); -- saída do codificador (m1, m0, v)
        SEG     : out STD_LOGIC_VECTOR(6 downto 0)  -- saída do display de 7 segmentos
    );
end sistema_combinacional;

architecture Behavioral of sistema_combinacional is

    -- Sinais internos
    signal mux_out : STD_LOGIC_VECTOR(3 downto 0);
    signal enc_out : STD_LOGIC_VECTOR(1 downto 0);
    signal valid    : STD_LOGIC;

begin

    -----------------------------------------------------------------------
    -- 1. MUX 4x1 com entradas fixas (4 bits cada)
    -----------------------------------------------------------------------
    process(SW)
        constant I0 : STD_LOGIC_VECTOR(3 downto 0) := "0001";
        constant I1 : STD_LOGIC_VECTOR(3 downto 0) := "0010";
        constant I2 : STD_LOGIC_VECTOR(3 downto 0) := "0100";
        constant I3 : STD_LOGIC_VECTOR(3 downto 0) := "1000";
    begin
        case SW is
            when "00" => mux_out <= I0;
            when "01" => mux_out <= I1;
            when "10" => mux_out <= I2;
            when "11" => mux_out <= I3;
            when others => mux_out <= (others => '0');
        end case;
    end process;

    LED_MUX <= mux_out;

    -----------------------------------------------------------------------
    -- 2. Codificador de prioridade 4x2 (nível baixo ativo)
    -----------------------------------------------------------------------
    process(BTN)
    begin
        if BTN(3) = '0' then
            enc_out <= "11"; valid <= '1';
        elsif BTN(2) = '0' then
            enc_out <= "10"; valid <= '1';
        elsif BTN(1) = '0' then
            enc_out <= "01"; valid <= '1';
        elsif BTN(0) = '0' then
            enc_out <= "00"; valid <= '1';
        else
            enc_out <= "00"; valid <= '0';
        end if;
    end process;

    LED_ENC <= enc_out & valid; -- LEDs mostram m1, m0, v

    -----------------------------------------------------------------------
    -- 3. Decodificador para conceitos A, B, C, D no display
    -----------------------------------------------------------------------
    process(enc_out, valid)
    begin
        if valid = '0' then
            SEG <= "1111111"; -- display apagado
        else
            case enc_out is
                when "00" => SEG <= "0001000"; -- A
                when "01" => SEG <= "1100000"; -- b
                when "10" => SEG <= "0110001"; -- C
                when "11" => SEG <= "1000010"; -- d
                when others => SEG <= "1111111";
            end case;
        end if;
    end process;

end Behavioral;
