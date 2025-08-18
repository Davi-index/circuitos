library ieee;
use ieee.std_logic_1164.all;

entity verificador is
    Port( Ds : in STD_LOGIC_VECTOR(3 downto 0);
    P : in std_logic;
    Erro : out std_logic
    );
end verificador;
architecture estrutura of verificador is
    begin
    Erro <= Ds(3) xor Ds(2) xor Ds(1) xor Ds(0) xor P;
    end estrutura;