library ieee;
use ieee.std_logic_1164.all;
entity part is
    port(
        D : in STD_LOGIC_VECTOR(3 downto 0);
        E : in STD_LOGIC_VECTOR(3 downto 0);
        Erro : out std_logic);
end part;

architecture estrutura of part is
    signal P : std_logic;
    signal Ds : STD_LOGIC_VECTOR(3 downto 0);
begin
    G: entity work.gerador
    port map ( D => D,
                P => P
    );

    B: entity work.bsc
    port map (
        D => D,
        E => E,
        Ds => Ds
    );

    V: entity work.verificador
    port map (
        Ds => Ds,
        P => P,
        Erro => Erro
    );
end estrutura;
    