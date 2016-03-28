library IEEE;
use IEEE.std_logic_1164.all;
 
 
-- top module
entity uart is port(
    clk:     in std_logic;
    rst:     in std_logic;
    txd:     out std_logic;
    rxd:     in std_logic;
    din:     in std_logic_vector(7 downto 0);
    dout:    out std_logic_vector(7 downto 0);
    en_tx:   in std_logic;
    en_rx:   in std_logic;
    stby_tx: out std_logic;
    stby_rx: out std_logic);
end uart;
 
architecture Behavioral of uart is
    signal clk_tx: std_logic;
    signal clk_rx: std_logic;
     
    component clk_generator port(
        clk: in std_logic;
        rst: in std_logic;
        clk_tx: out std_logic;
        clk_rx: out std_logic);
    end component;
     
    component tx port(
        clk: in std_logic;
        rst: in std_logic;
        clk_tx: in std_logic;
        txd: out std_logic;
        din: in std_logic_vector(7 downto 0);
        en: in std_logic;
        stby: out std_logic);
    end component;
     
    component rx port(
        clk: in std_logic;
        rst: in std_logic;
        clk_rx: in std_logic;
        rxd: in std_logic;
        dout: out std_logic_vector(7 downto 0);
        en: in std_logic;
        stby: out std_logic);
    end component;
     
    begin
        uclk_generator: clk_generator port map(
            clk => clk,
            rst => rst,
            clk_tx => clk_tx,
            clk_rx => clk_rx);
         
        utx: tx port map(
            clk => clk,
            rst => rst,
            clk_tx => clk_tx,
            txd => txd,
            din => din,
            en => en_tx,
            stby => stby_tx);
         
        urx: rx port map(
            clk => clk,
            rst => rst,
            clk_rx => clk_rx,
            rxd => rxd,
            dout => dout,
            en => en_rx,
            stby=> stby_rx);
 
end Behavioral;
