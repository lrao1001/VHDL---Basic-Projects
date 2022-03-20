library ieee;
use ieee.std_logic_1164.all;


ENTITY PWM_LED IS
port
(
	clk 		: IN std_logic;
	pwm_out 	: OUT std_logic;
);

END ENTITY:


ARCHITECTURE logic OF PWM_LED IS

SIGNAL counter : integer range 0 to 50000000;

BEGIN

	-- process for implementing the counter
	PWM_Process: PROCESS(clk)
	BEGIN
		
		if rising_edge(clk) then
			
			-- Function: LED needs to be on for 1/2 s and off for 1/2 s and alternate
			
			if counter > 49000000 then
				counter <= '0';
			else
				counter <= counter + 1;
			end if;
			
			-- PWM implementation
			if counter > 25000000 then
				pwm_out <= '1';
			else
				pwm_out <= '0';
			end if;
		
		end if;
		
	END PROCESS;


END logic;