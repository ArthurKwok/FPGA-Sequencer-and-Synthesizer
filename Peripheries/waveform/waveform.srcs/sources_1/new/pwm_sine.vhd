----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/06/11 23:04:17
-- Design Name: 
-- Module Name: pwm_sine - Behavioral
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

entity pwm_sine is
    Port ( clk_total : in STD_LOGIC;
           pwm_out_total : out STD_LOGIC);
end pwm_sine;

architecture Behavioral of pwm_sine is

    component sine_wave is
        Port ( clk_sw : in STD_LOGIC;
           dataout : out STD_LOGIC_VECTOR (7 downto 0));
    end component;  

    component pwm is
        Port ( clk_pwm : in STD_LOGIC;
        pwm_in : in STD_LOGIC_VECTOR (7 downto 0);
        pwm_out : out STD_LOGIC);
    end component;

signal signal_total: STD_LOGIC_VECTOR (7 downto 0);

begin

UUT1: sine_wave port map(clk_sw=>clk_total, dataout=>signal_total);
UUT2: pwm port map(clk_pwm=>clk_total, pwm_in=>signal_total, pwm_out=>pwm_out_total);


end Behavioral;
