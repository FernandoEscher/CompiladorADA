with Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Text_IO;
use Ada.Integer_Text_IO;

procedure Hello_World is
   id1,id2 : Integer;
   id3:Boolean;
   id4:float;
   id5 : constant := 1;
   type gaby is record null; end record;

   function mi_funcion(retval1, retval2:INTEGER) return INTEGER is begin return retval1+retval2; end mi_funcion;
   type DATE (tuz:Integer := 3; tuz2:integer := 3) is
      record
         Month : INTEGER range 1..12;
         Day : INTEGER range 1..31;
         Year : INTEGER range 1776..2010;
      end record;
   Independence_Day : DATE;
   procedure nada (Width: in float) is begin null; end nada;
   id6:integer := 34;
   id7:gaby;
begin
   id1 := 12 rem 4;
   id6 := 4;
   id4 := 7_0.0_9;
   nada(8.0);
   id1 := mi_funcion(2+3,id1);
   for i in reverse 1..5 loop
      id1 := i;
      put (id1);
   end loop;
   while true = false loop
      id2 := 1;
   end loop;
   el_loop: loop
               id3 := true;
               exit el_loop when id3 = true;
            end loop el_loop;
   if true then
      id4 := 4.0;
   end if;
   pUt ("Hello world!!");

end Hello_World;
