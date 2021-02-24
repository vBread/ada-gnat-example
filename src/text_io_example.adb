with Ada.Text_Io; use Ada.Text_Io;
with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Float_Text_Io; use Ada.Float_Text_Io;

procedure Text_IO_Example is
	type Color is (red, blue, green);

	package Color_Io is new Enumeration_Io (Color); use Color_Io;

	X : Float;
	Last : Positive;

begin
	Put_Line ("The following should be a five in base two:");
	Put (5, Width => 7, Base => 2);
	New_Line;

	Get ("  23.4567 ", X, Last);
	Put_Line ("The following should be 2.34567E+01");
	Put (X);
	New_Line;
	
	Put_Line ("The following should be RED");
	Put (red, Set => Upper_Case);
	New_Line;
end Text_IO_Example;
