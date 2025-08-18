library ieee;
use ieee.std_logic_1164.all;

entity bsc is
    Port ( D : in STD_LOGIC_VECTOR(3 downto 0);
        E : in STD_LOGIC_VECTOR(3 downto 0);
        Ds : out STD_LOGIC_VECTOR(3 downto 0)
    );
    end bsc;
architecture estrutura of bsc is
begin
    Ds(3) <= D(3) xor E(3);
    Ds(2) <= D(2) xor E(2);
    Ds(1) <= D(1) xor E(1);
    Ds(0) <= D(0) xor E(0);
    end estrutura;