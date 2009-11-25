procedure Holamundo (Holamundo: in integer) is
      type registro is record
         x : integer;
         a : integer := 55;
      end record;

      variable: integer;
begin
   null;
   variable := a**x+44;
   if a<x then
      x:=57;
   end if;

end Holamundo;
