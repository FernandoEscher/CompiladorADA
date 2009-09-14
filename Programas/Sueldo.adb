with Ada.Text_Io,ada.integer_text_io,Ada.Float_Text_Io;
use Ada.Text_Io,ada.integer_text_io,Ada.Float_Text_Io;




procedure Sueldos is
type arreglo is array (integer range <>) of float;


A:arreglo(1..10);
Mayor:float:=0.0;
casilla,n:integer:=0;
nombre,nombre1:string(1..20);

begin

   for i in A'range loop
      put("ingrese nombre del empleado ");new_line;
      get_line(nombre,n);
      put("Ingrese sueldo #"); put(i);new_line;
      get(A(i));skip_line;
      if A(i) > mayor
         then
           Mayor:=A(i);
           casilla:=i;
           nombre1:=nombre;
      end if;
   end loop;
   put ("el empleado con mayor sueldo es ");new_line;
   put (nombre1);new_line; 
   put ("su sueldo es ");
   put(mayor,0,2,0);new_line;
   put ("en la casilla ");
   put(casilla);new_line;
end sueldos;
