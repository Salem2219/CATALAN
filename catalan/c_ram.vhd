library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity c_ram is
port(clk, wr : in std_logic;
i, j, n : in std_logic_vector(3 downto 0);
dout : out std_logic_vector(31 downto 0));
end c_ram;
architecture rtl of c_ram is
type ram_type is array (0 to 15) of
std_logic_vector(31 downto 0);
signal program: ram_type := ("00000000000000000000000000000001",
"00000000000000000000000000000001",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000",
"00000000000000000000000000000000") ;
signal a, l, e,m : unsigned(31 downto 0);
signal s : unsigned(3 downto 0);

begin
s <= unsigned(i) - unsigned(j) - "0001";
e <= unsigned(program(conv_integer(s)));
m <= unsigned(program(conv_integer(unsigned(j))));
a <= e(15 downto 0) * m(15 downto 0);
l <= unsigned(program(conv_integer(unsigned(i)))) + a;

process(clk)
begin
if (rising_edge(clk)) then
if (wr = '1') then
program(conv_integer(unsigned(i))) <= std_logic_vector(l);
end if;
end if;
end process;
dout <= program(conv_integer(unsigned(n)));
end rtl;