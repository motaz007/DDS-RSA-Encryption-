----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2019 09:07:43 PM
-- Design Name: 
-- Module Name: RSA - Behavioral
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

entity RSA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           M : in STD_LOGIC;
           result : in STD_LOGIC);
end RSA;

architecture Behavioral of RSA is

begin

U_data_path: entity work. data_path map port(


);

U_control_path: entity work.control_path map port(


);


end Behavioral;
