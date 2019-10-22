----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/18/2019 05:54:45 PM
-- Design Name: 
-- Module Name: adder-256 - Behavioral
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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity adder_256 is
    Port ( A : in STD_LOGIC_vector (255 downto 0);
           B : in STD_LOGIC_vector (255 downto 0);
           result : out STD_LOGIC_vector (255 downto 0);
           clk : in STD_LOGIC);
           
          end adder_256;

architecture Behavioral of adder_256 is

--    -- the signals that will take the value of  A --
--        signal A1 : std_logic_vector(64 downto 0);
--        signal A2 : std_logic_vector(64 downto 0);
--        signal A3 : std_logic_vector(64 downto 0);
--        signal A4 : std_logic_vector(64 downto 0);
        
        
--         -- the signals that will take the value of  B --
--        signal B1 : std_logic_vector(64 downto 0);
--        signal B2 : std_logic_vector(64 downto 0);
--        signal B3 : std_logic_vector(64 downto 0);
--        signal B4 : std_logic_vector(64 downto 0);
         
        
--             -- the signals that will take the value of  the result --
--        signal R1 : std_logic_vector(64 downto 0);
--        signal R2 : std_logic_vector(64 downto 0);
--        signal R3 : std_logic_vector(64 downto 0);
--        signal R4 : std_logic_vector(64 downto 0);
        
--        --- carries of each of the addition operations
--        signal C1 : std_logic;
--        signal C2 : std_logic;
--        signal C3 : std_logic;
--        signal C4 : std_logic;
        
signal R : unsigned(255 downto 0):=(others => '0');        
begin

       process (clk,A,B) begin
--                if(reset_n = '0')then
--                    result <= (others => '0');
                
                if(clk'event and clk = '1') then
                
                        R <= unsigned(A) + unsigned(B);
                        result <= std_logic_vector (R);

                    
                    

                    
                    
--                    R1 <= std_logic_vector( unsigned (A1) + unsigned (B1));
--                    R2 <= std_logic_vector( unsigned (A2) + unsigned (B2));
--                    R3 <= std_logic_vector( unsigned (A3) + unsigned (B3));
--                    R4 <= std_logic_vector( unsigned (A4) + unsigned (B4));

                    
            
                 end if;
           
   
       
       end process;

--       result <= R4 & R3 & R2 & R1;


end Behavioral;
