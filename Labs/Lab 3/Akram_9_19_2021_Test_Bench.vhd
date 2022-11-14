-- Test bench

library ieee;
use ieee.std_logic_1164.all;

entity Akram_9_19_2021_Test_Bench is
end Akram_9_19_2021_Test_Bench;

architecture behav_tb of Akram_9_19_2021_Test_Bench is
    signal A, B : std_logic;
    signal Sum, Carry : std_logic;
begin
    -- connecting test bench signals with half adder
    UUT : entity work.Akram_9_19_2021_N_Bit_Add_sub_Flags 
	 port map (A, B 						: in std_logic_vector (n-1 downto 0);
			Op 						: in std_logic; -- Operator
			Cf, Ovf, Negf, ZeroF : out std_logic; -- carry flag, overflow, Negative, Zero
			Sum 						: out std_logic_vector (n-1 downto 0));

    tb : process
        constant period: time := 100 ns;
        begin
            A <= "0000000000000000"; -- 16bits
            B <= "0000000000000000";
            wait for period;
            assert ((Sum = '0') and (Carry = '0'))  -- expected output
            -- Error: report  if sum or carry <> 0
            report "test failed for input 00000000000000000000000000000000" severity error;

            A <= "0000000000000000";
            B <= "0000000000000001";
            wait for period;
            assert ((Sum = '1') and (Carry = '0'))
            report "test failed for input 00000000000000000000000000000001" severity error;

            A <= "0000000000000001";
            B <= "0000000000000000";
            wait for period;
            assert ((Sum = '1') and (Carry = '0'))
            report "test failed for input 00000000000000010000000000000000" severity error;

            A <= "0000000000000001";
            B <= "0000000000000001";
            wait for period;
            assert ((Sum = '0') and (Carry = '1'))
            report "test failed for input 00000000000000010000000000000001" severity error;

            -- Fail test
            A <= "0000000000000000";
            B <= "0000000000000001";
            wait for period;
            assert ((sum = '0') and (Carry = '1'))
            report "test failed for input 00000000000000000000000000000001 (fail test)" severity error;


            wait; -- suspend process indefinitely
        end process;
end behav_tb;