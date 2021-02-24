with Ada.Numerics.Elementary_Functions;
with Ada.Numerics; use Ada.Numerics;
with Text_IO;

procedure Test_El_Funcs is
	Y : Float;
	P : Integer;

	subtype Line is String (1 .. 80);

	Filler  : Line := (others => ' ');
	Display : array (0 .. 24) of Line;

begin
	Text_IO.Set_Page_Length (Text_IO.Current_Output, 0);
	Text_IO.Put_Line ("Display of Sin, Cos and Arctan graphs");
	Text_IO.Put_Line ("Legend: Sin (O), Cos (X), Arctan (+)");

	for I in Display'range loop
		Display (I) := Filler;
	end loop;

	Display (10) := (1 .. 80 => '-');

	for I in 1 .. 20 loop
		Y := Elementary_Functions.Cos (Float (I) * Pi / 10.0);
		P := Integer (10.0 * Y) + 10;
		Display (P)(4 * I) := 'O';

		Y := Elementary_Functions.Sin (Float (I) * Pi / 10.0);
		P := Integer (10.0 * Y) + 10;
		Display (P)(4 * I) := 'X';

		Y := Elementary_Functions.Arctan (Float (I) * Pi / 10.0);
		P := Integer (10.0 * Y) + 10;
		Display (P)(4 * I) := '+';
	end loop;

	for I in Display'range loop
		Text_IO.Put_Line (Display (I));
	end loop;
end Test_El_Funcs;
