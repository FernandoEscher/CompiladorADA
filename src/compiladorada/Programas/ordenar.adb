
with Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io;
use Ada.Text_Io,Ada.Integer_Text_Io,Ada.Float_Text_Io;

procedure Ordenar is

   type Arreglo is array (Integer range <>) of Integer;

Temp, Pos,  Menor:integer:=0;
 a :Arreglo(1..5);
 J :Arreglo(1..5);

begin
   for I in A'range loop
      Get (A(I));Skip_Line;
   end loop;
   for I in A'First..(A'Last - 1) loop
      Menor:=A(I);
      Pos:=I;
      for J in (I + 1).. A'Last loop
         if A(J)< Menor
               then Menor:=A(J);
               Pos:=J;
            end if;
         end loop;
         Temp:=A(I);
      A(I):=Temp;
   end loop;
   for I in A'range loop
      Put(A(I));New_Line;
   end loop;
end Ordenar;
