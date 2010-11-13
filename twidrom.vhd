library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Created from twid.bin
-- On 5/26/2010

entity twidrom is
	port (
	addra: in std_logic_vector(9 downto 0);
	addrb: in std_logic_vector(9 downto 0);
	clk: in std_logic;
	dina: in std_logic_vector(15 downto 0);
	douta: out std_logic_vector(15 downto 0);
	doutb: out std_logic_vector(15 downto 0);
	wea: in std_logic);
end twidrom;

architecture syn of twidrom is
   type ram_type is array (0 to 1023) of std_logic_vector(15 downto 0);
   signal RAM : ram_type := 
   (
   x"0000", x"0000", x"0000", x"601A", x"6030", x"7401", x"B013", x"0B00",
   x"A00F", x"3018", x"7400", x"0900", x"B400", x"7014", x"C001", x"B014",
   x"7013", x"A011", x"3016", x"7402", x"B900", x"1018", x"7900", x"B402",
   x"6037", x"1005", x"0100", x"B000", x"B014", x"B400", x"0101", x"B00A",
   x"B001", x"0102", x"B00B", x"0104", x"B00C", x"0108", x"B00D", x"0110",
   x"B00E", x"0120", x"B00F", x"0140", x"B010", x"0180", x"B011", x"1800",
   x"0101", x"B481", x"01F0", x"B480", x"0100", x"B603", x"1800", x"7700",
   x"307A", x"B700", x"0101", x"B603", x"74B0", x"A00A", x"203C", x"0102",
   x"B603", x"7600", x"B003", x"7601", x"B490", x"0103", x"B491", x"B4A0",
   x"0000", x"0102", x"B481", x"0103", x"B603", x"0108", x"E001", x"204E",
   x"0103", x"B481", x"0104", x"B603", x"74B0", x"A00A", x"3054", x"0101",
   x"B481", x"0105", x"B603", x"0104", x"E001", x"205C", x"74B0", x"A00A",
   x"205E", x"0106", x"B603", x"0000", x"7003", x"B480", x"0000", x"0100",
   x"B481", x"0107", x"B603", x"0108", x"E001", x"206C", x"0108", x"B603",
   x"0101", x"B481", x"74B0", x"A00A", x"3072", x"0104", x"E001", x"2076",
   x"0100", x"B603", x"1800", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000",
   x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"0000", x"ABCD"
);

signal daddra: std_logic_vector(9 downto 0);
signal daddrb: std_logic_vector(9 downto 0);

begin
   atwidrom: process (clk)
   begin
      if (clk'event and clk = '1') then
         if (wea = '1') then
            RAM(conv_integer(addra)) <= dina;
         end if;
         daddra <= addra;
         daddrb <= addrb;
      end if; -- clk 
   end process;

   douta <= RAM(conv_integer(daddra));
   doutb <= RAM(conv_integer(daddrb));
end;
