library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sistema_combinacional is
    Port (
        SW      : in  STD_LOGIC_VECTOR(1 downto 0);
        BTN     : in  STD_LOGIC_VECTOR(3 downto 0);
        LED_MUX : out STD_LOGIC_VECTOR(3 downto 0);
        LED_ENC : out STD_LOGIC_VECTOR(2 downto 0);
        SEG     : out STD_LOGIC_VECTOR(6 downto 0)
    );
end sistema_combinacional;

architecture Behavioral of sistema_combinacional is
    signal mux_out : STD_LOGIC_VECTOR(3 downto 0);
    signal enc_m   : STD_LOGIC_VECTOR(1 downto 0);
    signal enc_v   : STD_LOGIC;
    signal enc_led : STD_LOGIC_VECTOR(2 downto 0);

    component requisito1
        Port (
            S : in  STD_LOGIC_VECTOR(1 downto 0);
            Y : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component requisito3
        Port (
            x : in  STD_LOGIC_VECTOR(3 downto 0);
            m : out STD_LOGIC_VECTOR(1 downto 0);
            v : out STD_LOGIC
        );
    end component;

    component requisito2
        Port (
            BCD : in  STD_LOGIC_VECTOR(3 downto 0);
            SEG : out STD_LOGIC_VECTOR(6 downto 0)
        );
    end component;

begin
    mux_inst: requisito1
        port map(
            S => SW,
            Y => mux_out
        );
    LED_MUX <= mux_out;

    enc_inst: requisito3
        port map(
            x => BTN,
            m => enc_m,
            v => enc_v
        );
    LED_ENC <= enc_m & enc_v;

    dec_inst: requisito2
        port map(
            BCD => (enc_m & "0" & enc_v),
            SEG => SEG
        );
end Behavioral;
