procedure ProgramaBueno1 (x: in integer) is
   A:integer:=56;
   Z:boolean:=false;
   Q:float:=5.6;
   casilla,n:integer;
   i:integer:=0;
   Mayor:integer;
   procedure Sueldo2 (v:in integer) is
      B:integer;
      function Sueldo3 (s:in integer; y:out boolean) return integer is
          C:float;
	  M:integer := 3;
      begin
          C:=((5.9 / 4.6)*(8.7+6.5)-5.3)**8.4;
	  M:=64*98;
	  if ((5>=5) and (5<=6)) or (7>6) then
             C:=(9.0**5.6);
	s:=4;
          end if;
      end Sueldo3;

      procedure Sueldo4 is
          C:integer;
      begin
          A:=1;
      end Sueldo4;

   begin
      B:=Sueldo3(5*4,5<3);
      A:=5;
   end Sueldo2;

begin

   for I in 1..2 loop
      put("ingrese nombre del empleado ");
      put("Ingrese sueldo #"); put(i);

      get(i);

      if 5 > mayor
         then
           A:=5;
           mayor:=i;
           casilla:=i;
      end if;
   end loop;
   put ("el empleado con mayor sueldo es ");
   put ("su sueldo es ");
   put(mayor,0,2,0);
   put ("en la casilla ");
   put(casilla);

end ProgramaBueno1;
