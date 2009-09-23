
procedure Sueldos is
A:arreglo;
Mayor:float:=0.0;
casilla,n:integer:=0;
nombre,nombre1:string;

begin

   for i in 1..2 loop
      put("ingrese nombre del empleado ");
      get_line(nombre,n);
      put("Ingrese sueldo #"); put(i);
      get(A(i));
      if A(i) > mayor
         then
           Mayor:=A(i);
           casilla:=i;
           nombre1:=nombre;
      end if;
   end loop;
   put ("el empleado con mayor sueldo es ");
   put (nombre1);
   put ("su sueldo es ");
   put(mayor,0,2,0);
   put ("en la casilla ");
   put(casilla);
end sueldos;
