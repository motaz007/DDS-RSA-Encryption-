library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MM is
    Port ( A : in STD_LOGIC_vector (255 downto 0);
           B : in STD_LOGIC_vector (255 downto 0);
           clk : in STD_LOGIC;
           reset_n : in STD_LOGIC;
           ready : out STD_LOGIC;
           CS_1 : in STD_LOGIC; -- this is a conrtol signal coming from the control path to the first mux
           CS_2 : in STD_LOGIC; -- this is a conrtol signal coming from the control path to the second mux
           p1 : out STD_LOGIC_VECTOR (255 downto 0); -- this is the result of the first adder which will go to the control path
           p2 : out STD_LOGIC_VECTOR (255 downto 0); -- this is the result ot the second adder which will go to the control path
           M : in STD_LOGIC_VECTOR (255 downto 0); -- M is the negative value of the Modulus for the RSA encryption/Decryption 
           MM_output : out STD_LOGIC_vector (255 downto 0));
end MM;

architecture Behavioral of MM is

    signal i : integer:= 255;
    signal inter : std_logic_vector (255 downto 0):=(others => '0');
--    signal result_1 : std_logic_vector (255 downto 0):=(others => '0');
--    signal result_2 : std_logic_vector (255 downto 0):=(others => '0');
--    signal result_3 : std_logic_vector (255 downto 0):=(others => '0');
    signal Reg_R1 : std_logic_vector (255 downto 0):=(others => '0');
    signal Reg_R2 : std_logic_vector (255 downto 0):=(others => '0');
    signal Reg_R3 : std_logic_vector (255 downto 0):=(others => '0');

    

begin



    adder_1 :entity work.adder_256 port map (
           clk => clk,
           A => inter,
           B => (others => '0') ,
           result => Reg_R1); 
        
        
        sub_1 :entity work.sub_256 port map (
           clk => clk,
           A => Reg_R1,
           B => M,
           result => Reg_R2); 
           
         sub_2 :entity work.sub_256 port map (
           clk => clk,
           A => Reg_R2,
           B => M,
           result => Reg_R3); 
        

           
    process (clk,reset_n) begin -- this process prepare the two inputs for the 256-bit adder where 'inter' and output will be the inout of the adder
                if(reset_n = '0')then
                    MM_output <= (others => '0');
--                     result_1 <= (others => '0');
--                     result_2 <= (others => '0');
                    i <= 255;

                    
                elsif(clk'event and clk = '1') then
                    
                    if (A(i) = '1') then
                        inter <= B ;
                     else 
                        inter <=(others => '0');
                     end if;
--                     if (CS_2 ='1') then
--                        MM_output <= Reg_R3 ;
--                     elsif(CS_1 ='1')then
--                        MM_output <= Reg_R2 ;
--                     else
--                        MM_output <= Reg_R1 ;
--                     end if;
                     i <= i -1;
                     MM_output <= Reg_R1;
                      
                end if;


    end process;
        
        


        
end Behavioral;
