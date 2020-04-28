library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity inc_4bit is
port (x: in std_logic_vector (3 downto 0);
      y: out std_logic_vector (3 downto 0));
end inc_4bit ;

architecture rtl of inc_4bit is
    signal y_temp: unsigned (3 downto 0);
begin
    y_temp <= unsigned(x) + 1;
    y <= std_logic_vector(y_temp);
end rtl;