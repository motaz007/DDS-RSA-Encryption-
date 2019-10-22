library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_path is
    Port ( 
           clk : in STD_LOGIC;
           reset_n : in STD_LOGIC;
           p1 : in STD_LOGIC_VECTOR (255 downto 0); -- this is the result of the first adder which will go to the control path
           p2 : in STD_LOGIC_VECTOR (255 downto 0); -- this is the result ot the second adder which will go to the control path
           CS_1 : out STD_LOGIC; -- this is a conrtol signal coming from the control path to the first mux
           CS_2 : out STD_LOGIC; -- this is a conrtol signal coming from the control path to the second mux
           M : in STD_LOGIC_VECTOR (255 downto 0);
           data_MM_valid : out STD_LOGIC);
end control_path;

architecture Behavioral of control_path is

begin
           process (clk, reset_n) begin
            if(reset_n = '0')then
                    data_MM_valid <= '0';
                    CS_1 <= '0';
                    CS_2 <= '0';
                    
                elsif(clk'event and clk = '1') then
                    if (p1 > M) then
                        CS_1 <= '1';
                    else
                        CS_1 <= '0';
                    end if;
                    
                    if (p2 > M) then
                        CS_2 <= '1';
                    else
                        CS_2 <= '0';
                    end if;
              
                end if;
        end process;
end Behavioral;