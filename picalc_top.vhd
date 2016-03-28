library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity picalc_top is
end picalc_top;

entity picalc_top is port(
    clk : in std_logic;
    rst : in std_logic;
    tx : out std_logic;
    rx : in std_logic);
end picalc_top;

architecture Behavioral of picalc_top is
    component uart port(
        clk : in std_logic;
        rst : in std_logic;
        txd : out std_logic;
        rxd : in std_logic;
        din : in std_logic_vector(7 downto 0);
        dout : out std_logic_vector(7 downto 0);
        en_tx : in std_logic;
        en_rx : in std_logic;
        stby_tx : out std_logic;
        stby_rx : out std_logic);
    end component;
	 
	 component xorshift port(
  	     clk : in std_logic;
        rst : in std_logic;
        enable : in std_logic;
        result : out std_logic_vector(31 downto 0)
	 );
	 end component;
	 
	 signal din : std_logic_vector(7 downto 0);
	 signal dout : std_logic_vector(7 downto 0);
	 signal en_tx : std_logic;
	 signal en_rx : std_logic;
	 signal stby_tx : std_logic;
	 signal stby_rx : std_logic;
	 signal enable  : std_logic;
	 signal result  : std_logic_vector(31 downto 0);
	 
begin
    uart: uart port map(
        clk => clk,
		  rst => rst,
		  txd => txd,
		  rxd => rxd,
        din => din,
        dout => dout,
        en_tx => en_tx,
        en_rx => en_rx,
        stby_tx => stby_tx,
        stby_rx => stby_rx
	 );
				
	 xorshift: xorshift port map(
        clk => clk,
		  rst => rst,
        enable => enable,
        result => result
    );
end Behavioral;

