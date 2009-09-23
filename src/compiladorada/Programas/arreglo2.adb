with Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io;
use Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io;




procedure Arreglo2 is
   type Arreglo is array (Integer range <>) of Float;
   A:Arreglo(1..6);
   W,D:Integer:=0;
begin
   for I in A'range loop
      Put("introduzca numeros del 0 a 1 "); Put(I);Put(":  ");
      Get(A(I));Skip_Line;
      if A(I) = 0.0 then
         D:=D + 1;
      else
         W:=W+1;
      end if;
   end loop;
   for I in 1..D loop
      Put(0);New_Line;
   end loop;
   for I in 1..W loop
      Put(1);New_Line;
   end loop;
end Arreglo2;