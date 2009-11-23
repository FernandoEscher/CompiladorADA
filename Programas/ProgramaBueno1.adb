procedure Sueldos is
   A:integer:=5;
   Z:boolean:=false;
   Q:float:=5.6;
   casilla,n:integer;

   procedure Sueldo2 is
      B:integer;

      procedure Sueldo3 is
          C:integer;
      begin
          C:=((5.9**5.8)**(8.7**6.5))**8.4;
	  C:=abs (5*6**9);
	  if not true then
             C:=(9**56);
          end if;
      end Sueldo3;

      procedure Sueldo4 is
          C:integer;
      begin
          A:=1;
      end Sueldo4;

   begin
      A:=1;
   end Sueldo2;

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
end Sueldos;
