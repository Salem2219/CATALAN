library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity catalan_toplevel is
port (clk, rst, start: in std_logic;
      n: in std_logic_vector (3 downto 0);
      dout: out std_logic_vector(31 downto 0));
end entity;

architecture rtl of catalan_toplevel is
    component catalan_datapath is
        port (clk, rst, i_ld, i_en, j_ld, j_en, wr: in std_logic;
      n: in std_logic_vector (3 downto 0);
      iGTn, iGTj: out std_logic;
      dout : out std_logic_vector(31 downto 0));
    end component;

    component catalan_controller is
        port (clk, rst, start, iGTn, iGTj: in std_logic;
              i_ld, i_en, j_ld, j_en, wr: out std_logic);
    end component;

    signal i_ld, i_en, j_ld, j_en, iGTn, iGTj, wr: std_logic;
begin
    u0: catalan_datapath port map (clk, rst, i_ld, i_en, j_ld, j_en, wr, n, iGTn, iGTj, dout);
    u1: catalan_controller port map (clk, rst, start, iGTn, iGTj, i_ld, i_en, j_ld, j_en, wr);
end rtl;

