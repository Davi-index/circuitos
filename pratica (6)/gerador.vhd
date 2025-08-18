library ieee;
use ieee.std_logic_1164.all;

entity gerador is
    Port ( D : in STD_LOGIC_VECTOR(3 downto 0);
           P : out std_logic);
end gerador;

architecture estrutura of gerador is
begin
    P <= D(3) xor D(2) xor D(1) xor D(0);
end estrutura;