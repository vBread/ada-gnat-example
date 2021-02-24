with Ada.Command_Line;
with GNAT.IO; use GNAT.IO;

procedure Test_Command_Line is
begin
	Put ("      The command name : ");
	Put (Ada.Command_Line.Command_Name);
	New_Line;

	Put ("The number of arguments: ");
	Put (Ada.Command_Line.Argument_Count);
	New_Line;

	for I in 1 .. Ada.Command_Line.Argument_Count loop
		Put ("             Argument ");
		Put (I);
		Put (": ");
		Put (Ada.Command_Line.Argument (I));
		New_Line;
	end loop;
end Test_Command_line;
