----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/19/2019 04:36:35 PM
-- Design Name: 
-- Module Name: MM_tb - Behavioral
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
use ieee .Std_Logic_Arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MM_tb is
--  Port ( );
end MM_tb;

architecture Behavioral of MM_tb is

-- Constants
  constant msg : integer := 1234;
  constant e_key :integer := 5;
  constant n : integer := 119;
  constant COUNTER_WIDTH : natural := 8;
  constant CLK_PERIOD    : time := 10 ns;
  constant RESET_TIME    : time := 10 ns;

  -- Clocks and resets 
  signal clk            : std_logic := '0';
  signal reset_n        : std_logic := '0';

  -- input message and keys           
  signal A  : std_logic_vector (255 downto 0) ;
  signal B  : std_logic_vector (255 downto 0);           
  signal M        : std_logic_vector (255 downto 0);
           
  --- control signals
  signal CS_1: std_logic; --:= '1';
  signal CS_2: std_logic; -- := '1';
  signal p1: std_logic_vector (255 downto 0); -- := '1';
  signal p2: std_logic_vector (255 downto 0); -- := '1';

  -- output signal           
  signal MM_output : std_logic_vector(255 downto 0);
  signal data_MM_valid : std_logic;

begin

  -- DUT instantiation
  dut: entity work.MM 
    port map (
    -- clk and reset
           clk => clk,
           reset_n => reset_n,
           
    -- input arguments       
           A => A, --: in STD_LOGIC_vector (255 downto 0);
           B => B, --: in STD_LOGIC_vector (255 downto 0);
           M => M, --: in STD_LOGIC_VECTOR (255 downto 0); -- M is the negative value of the Modulus for the RSA encryption/Decryption 

    -- control signals from the controller path
           CS_1 => CS_1, --: in STD_LOGIC; -- this is a conrtol signal coming from the control path to the first mux
           CS_2 => CS_2, --: in STD_LOGIC; -- this is a conrtol signal coming from the control path to the second mux
           p1 => p1, --: out STD_LOGIC_VECTOR (255 downto 0); -- this is the result of the first adder which will go to the control path
           p2 => p2, --: out STD_LOGIC_VECTOR (255 downto 0); -- this is the result ot the second adder which will go to the control path
  -- outputs           
           MM_output => MM_output --  : out STD_LOGIC_vector (255 downto 0));
         
    );
    
    
    dut_c: entity work.control_path 
        port map(
           clk => clk,
           reset_n => reset_n,
           p1 => p1, -- : in STD_LOGIC_VECTOR (255 downto 0); -- this is the result of the first adder which will go to the control path
           p2 => p2, --: in STD_LOGIC_VECTOR (255 downto 0); -- this is the result ot the second adder which will go to the control path
           CS_1 => CS_1, --: out STD_LOGIC; -- this is a conrtol signal coming from the control path to the first mux
           CS_2 => CS_2, -- : out STD_LOGIC; -- this is a conrtol signal coming from the control path to the second mux
           M => M,
           data_MM_valid => data_MM_valid --: out STD_LOGIC);
                    );

  -- Clock generation
  clk <= not clk after CLK_PERIOD/2;

  -- Reset generation
  reset_proc: process
  begin
    wait for RESET_TIME;
    reset_n <= '0';
    wait;
  end process;

  -- Stimuli generation
  stimuli_proc: process
  begin
  
    -- Send in first test vector
    wait for 10*CLK_PERIOD;
   
    A       <= conv_std_logic_vector(msg, A'length); --x"00000001";    
    B       <= conv_std_logic_vector(e_key, B'length);
    M     <= conv_std_logic_vector(n, M'length);
    
    
--      wait for 1*CLK_PERIOD;
--    A       <= (others => '0'); --x"00000001";    
--    B       <= (others => '0');
--    M_n     <= (others => '0');
    
--    wait for 1*CLK_PERIOD;
--    data_in       <= x"00000003";

--    wait for 1*CLK_PERIOD;
--    data_in       <= x"00000000";
    
--    wait for 1*CLK_PERIOD;
--    data_in       <= x"00000010";    

--    wait for 1*CLK_PERIOD;
--    data_in       <= x"00000020";    

--    wait for 1*CLK_PERIOD;
--    data_in       <= x"00000030";

--    wait for 1*CLK_PERIOD;    
--    data_in_valid <= '0';        
--    wait for 4*CLK_PERIOD;
       
    
--    -- Send in second test vector
--    wait for 10*CLK_PERIOD;
--    data_in_valid <= '1';
--    data_in       <= x"10000000";
    
--    wait for 1*CLK_PERIOD;
--    data_in       <= x"10000000";    

--    wait for 1*CLK_PERIOD;
--    data_in       <= x"10000000";    

--    wait for 1*CLK_PERIOD;
--    data_in       <= x"10000000";

--    wait for 1*CLK_PERIOD;
--    data_in       <= x"20000000";
    
--    wait for 1*CLK_PERIOD;
--    data_in       <= x"20000000";    

--    wait for 1*CLK_PERIOD;
--    data_in       <= x"20000000";    

--    wait for 1*CLK_PERIOD;
--    data_in       <= x"20000000";
    
--    wait for 1*CLK_PERIOD;
--    data_in       <= x"00000000";    
--    data_in_valid <= '0';
    
    -- Wait for results
    wait;
  end process;  


end Behavioral;
