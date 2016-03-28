library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_misc.all;

entity xorshift is
    port(
        clk :    in std_logic;
        rst :    in std_logic;
        enable : in std_logic;
        result : out std_logic_vector(31 downto 0)
    );
end xorshift;

architecture Behavioral of xorshift is
signal x:    unsigned(31 downto 0);
signal y:    unsigned(31 downto 0);
signal z:    unsigned(31 downto 0);
signal w:    unsigned(31 downto 0);
begin
    process(clk)
        variable t:    unsigned(31 downto 0);
    begin
        if (clk'event and clk='1') then
            if (rst = '1') then
                x <= TO_UNSIGNED(123456789, 32);
                y <= TO_UNSIGNED(362436069, 32);
                z <= TO_UNSIGNED(521288629, 32);
                w <= TO_UNSIGNED(88675123, 32);
            elsif (enable = '1') then
                t := x xor (x(20 downto 0) & TO_UNSIGNED(0, 11));
                x <= y;
                y <= z;
                z <= w;
                w <= (w xor (TO_UNSIGNED(0, 19) & w(31 downto 19))) xor (t xor (TO_UNSIGNED(0, 8) & t(31 downto 8)));
            end if;
        end if;
    end process;
    result <= STD_LOGIC_VECTOR(w);
end Behavioral;

