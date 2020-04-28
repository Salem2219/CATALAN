library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity catalan_datapath is
port (clk, rst, i_ld, i_en, j_ld, j_en, wr: in std_logic;
      n: in std_logic_vector (3 downto 0);
      iGTn, iGTj: out std_logic;
      dout : out std_logic_vector(31 downto 0));
end entity;

architecture rtl of catalan_datapath is
    component count_up_4bit is
        port (clk, rst, ld, en: in std_logic;
              d: in std_logic_vector(3 downto 0);
              count: out std_logic_vector(3 downto 0));
    end component;

    component isGreater_4bit is
        port (x, y: in std_logic_vector (3 downto 0);
              isGreater: out std_logic);
    end component;

    component inc_4bit is
        port (x: in std_logic_vector (3 downto 0);
              y: out std_logic_vector (3 downto 0));
    end component;
    component c_ram is
port(clk, wr : in std_logic;
i, j, n : in std_logic_vector(3 downto 0);
dout : out std_logic_vector(31 downto 0));
end component;

    signal i, j, j_plus: std_logic_vector (3 downto 0);
begin
    u0: count_up_4bit port map (clk, rst, i_ld, i_en, "0010", i);
    u1: count_up_4bit port map (clk, rst, j_ld, j_en, "0000", j);
    u2: inc_4bit port map (j, j_plus);
    u3: isGreater_4bit port map (i, n, iGTn);
    u4: isGreater_4bit port map (i, j_plus, iGTj);
    ram : c_ram port map (clk, wr, i, j, n, dout);
end rtl;