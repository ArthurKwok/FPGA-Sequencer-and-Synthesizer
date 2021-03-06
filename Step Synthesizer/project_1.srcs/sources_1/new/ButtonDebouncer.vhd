----------------------------------------------------------------------------------
-- Design Name: ButtonToggle
-- Description: Toggles output each time input goes from low to high
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ButtonToggle is
    Port ( clk : in STD_LOGIC;
			  rst : in STD_LOGIC;
			  Btn : in  STD_LOGIC;	-- PlayPause button in this project
           Q : out  STD_LOGIC);
end ButtonToggle;

architecture Behavioral of ButtonToggle is

-- hold indicates button is still being held and next transition will not occur until button is released
-- ready indicates button is not pressed and next transition will occur as soon as the button is pressed
-- correspond to the Button Toggle finite state machine
type state is (hold0,ready0,hold1,ready1);
signal PS,NS : state;	-- present state & next state
signal tempq : STD_LOGIC_VECTOR(1 downto 0);

begin

seq : process(clk, rst, ns)
begin 
	if (rising_edge(clk)) then
		if (rst='1') then
			PS <= hold0;
		else 
			PS <= NS;
		end if;
	end if;
end process seq;

comb : process(clk, rst, Btn, PS)
begin
	case PS is
		when hold0 => tempq <= "00";		-- left "Pause" state in FSM
					if (Btn = '0') then 
						NS <= ready0;
					else 
						NS <= PS;
					end if;
		when ready0 => tempq <= "01";		-- top "Pause" state in FSM
					if (Btn = '1') then 
						NS <= hold1;
					else 
						NS <= PS;
					end if;
		when hold1 => tempq <= "10";		-- right "Play" state in FSM
					if (Btn = '0') then 
						NS <= ready1;
					else 
						NS <= PS;
					end if;
		when ready1 => tempq <= "11";		-- bottom "Play" state in FSM
					if (Btn = '1') then 
						NS <= hold0;
					else 
						NS <= PS;
					end if;												
	end case;
end process comb;

Q <= tempq(1);

end Behavioral;

