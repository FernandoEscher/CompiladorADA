with Ada.Text_Io, Ada.Integer_Text_Io, Ada.Float_Text_Io;
use  Ada.Text_Io, Ada.Integer_Text_Io, Ada.Float_Text_Io;


procedure P3_10541035 is
   type almacen  is record
      Codigo : Integer;
      Decripcion : String(1..20);
      L : Natural;
      Precio : Float;
      Cantidad:Integer;
   end record;

   type Nodo;
   type Puntero is access Nodo;

   type Nodo is record
      Info : almacen;
      Sig : Puntero;
   end record;

   Cabeza, Temp, Final : Puntero;
   Resp : Character;
   al : almacen;
   Op : Integer;



   ----------leer
   procedure Leer (a:out almacen) is
   begin
     
      Put("cuenta: "); Get(a.Cuenta); Skip_Line;
      Put("descripcion: "); Get_Line(a.Nombre, a.L);
      Put("precio: "); Get(a.Saldo);
      Put("cantidad: "); Get(a.Cantidad);
   end Leer;


   ---------agreagar
   procedure Agregar(Cab:out Puntero; a:in almacen) is
   begin
      loop
         Leer(a);
         Temp:=new Nodo;
         Temp.all.Info:=a;
         Temp.all.Sig:=null;
         if Cab=null
               then
            Cab:=Temp;
            Final:=Temp;
         else
            Final.all.Sig:=Temp;
            Final:=Temp;
         end if;
         Put("Desea continuar S/N?: "); Get(Resp); Skip_Line;
         exit when Resp='N' or Resp='n';
      end loop;
   end Agregar;

   -------reporte
   procedure Reporte(Cab:in Puntero) is   
   begin

      Put("Reporte"); New_Line(2);
      Temp:=Cab;
      if Cab /= null
            then
         while Temp /= null loop
            Put(Temp.all.Info.Codigo,0); New_Line;
            Put(Temp.all.Info.Decripcion(1..Temp.all.Info.L));New_Line;
            Put(Temp.all.Info.Precio,0,2,0); New_Line;
            Put(Temp.all.Info.Cantidad,0); New_Line(2);

            Temp:=Temp.all.Sig;

         end loop;
      else
         Put("Lista Vacia");
      end if;
      Put("Teclee <<enter>>");
      Skip_Line;
   end Reporte;
   
-------consulta
Procedure Consulta(Cab:In Puntero) is   
   Existe : Boolean:=False;
   N : Integer;

begin
  
   Temp:=Cab;
   Put("codigo: "); Get(N); Skip_line;
   while Temp /= null and Existe=False loop
      if Temp.all.info.codigo=N
         then
            Existe:=True;
         else
            Temp:=Temp.all.sig;
      end if;
   end loop;
   if Existe = True
      then
         Put("Si se encontro");
      else
         Put("No se encontro");
   end if;
   Skip_line;
end Consulta;

-----------------menu

procedure Menu is
begin

   Put(" MENU "); New_Line;
   Put("1. Agregar "); New_Line;
   Put("2. Consulta "); New_Line;
   Put("3. Reporte "); New_Line;
   Put("4. Salir "); New_Line;
   Put("Teclee la opcion: "); Get(Op); skip_line;
end Menu;


-----------principal

begin
   loop
      Menu;
      case Op is
         when 1 => Agregar(Cabeza, al);
         when 2 => Consulta(Cabeza);
         when 3 => Reporte(Cabeza);
         when others => null;
      end case;
      exit when op = 4;
    end loop;
End P3_10541035 ;
