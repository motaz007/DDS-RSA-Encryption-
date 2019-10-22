----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2019 04:23:27 PM
-- Design Name: 
-- Module Name: data_path - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_path is
    Port ( A : in STD_LOGIC_VECTOR(255 downto 0);
           B : in STD_LOGIC_VECTOR(255 downto 0);
           M : in STD_LOGIC_VECTOR(255 downto 0);
           clk : in STD_LOGIC;
           reset_n: in STD_LOGIC;
           ready : out STD_LOGIC;
           CS_1 : in STD_LOGIC; -- this is a conrtol signal coming from the control path to the first mux
           CS_2 : in STD_LOGIC; -- this is a conrtol signal coming from the control path to the second mux
           p1 : out STD_LOGIC_VECTOR (255 downto 0); -- this is the result of the first adder which will go to the control path
           p2 : out STD_LOGIC_VECTOR (255 downto 0); -- this is the result ot the second adder which will go to the control path
           encrypted_msg : out STD_LOGIC_VECTOR);
end data_path;

architecture Behavioral of data_path is

begin

MM : entity work.MM port map (
           A => A,
           B => B,
           clk => clk,
           reset_n => reset_n,
           ready => ready,
           CS_1 => CS_1,
           CS_2 => CS_2,
           p1 => p1,
           p2 => p2,
           M => M, 
           MM_output => encrypted_msg);

end Behavioral;
