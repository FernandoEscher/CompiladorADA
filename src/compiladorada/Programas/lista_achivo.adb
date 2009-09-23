-- Lista-Archivo
-- 

with Ada.Text_Io, Ada.Integer_Text_Io, Ada.Float_Text_Io, Ada.Direct_Io;
use  Ada.Text_Io, Ada.Integer_Text_Io, Ada.Float_Text_Io;

procedure Lista_Achivo is 

-- DECLARACIONES 

   -- Archivo
   type Clientes is record 
      -- Crear el registro
      Cuenta : Integer;  
      Nombre : String (1 .. 20);  
      L      : Natural;  
      Saldo  : Float;  
   end record; 

   package Clientes_Io is new Ada.Direct_Io(Clientes);
   use Clientes_Io;

   A : Clientes_Io.File_Type; -- Variable de tipo File_type 
   B : Clientes;              -- Variable de tipo registro 

   -- Lista
   type Nodo; 
   type Puntero is access Nodo; 
   type Nodo is record 
      Info : Clientes;  
      Sig  : Puntero;  
   end record; 

   Cabeza, Temp, Final : Puntero := null;  
   Resp : Character;
   Op : Integer;  

   -- FIN DECLARACIONES
   

---------- MENU PRINCIPAL ----------
procedure Menu is 
begin
   Put(" MENU ");New_Line;
   Put("1. Agregar Final ");New_Line;
   Put("2. Reporte ");New_Line;
   Put("3. Salir ");New_Line;
   Put("Teclee la opcion: ");Get(Op);Skip_Line;
end Menu;

---------- REPORTE ---------- 
procedure Reporte_Lista_Reg (Cab : in Puntero) is   -- Clase 4
   begin
      Put("Reporte");New_Line(2);
      Temp:=Cab;
      if Cab /= null
         then
            while Temp /= null loop
               Put(Temp.All.Info.Cuenta,0);New_Line;
               Put(Temp.All.Info.Nombre(1..Temp.All.Info.L));New_Line;
               Put(Temp.All.Info.Saldo,0,2,0);New_Line(2);
               Temp:=Temp.All.Sig;
            end loop;
         else
            Put("Lista Vacia");
      end if;
      Put("Teclee <<enter>>");
      Skip_Line;
end Reporte_Lista_Reg;


---------- LECTURA ----------
procedure Leer (Bl : out Clientes ) is 
begin
   Put("Ingrese la cuenta: ");
   Get(Bl.Cuenta);Skip_Line;
   Put("Ingrese Nombre: ");
   Get_Line(Bl.Nombre, Bl.L);
   Put("Ingrese la saldo: ");
   Get(Bl.Saldo);Skip_line;
end Leer;

---------- AGREGAR_FINAL_LISTA_REG ----------
procedure Agregar_Final_Lista_Reg (Cab:out Puntero;Bl: in Clientes ) is 
begin
   loop
      Leer(B);
      Temp:=new Nodo; -- Crea un nuevo nodo
      Temp.All.Info:=Bl;
      Temp.All.Sig:=null;
      if Cab=null --si la lista esta vacia
         then
            Cab:=Temp;
            Final:=Temp;
         else
            Final.All.Sig:=Temp;
            Final:=Temp;
      end if;
      Put("Desea continuar S/N?: ");
      Get(Resp);Skip_Line;
      exit when Resp='N' or Resp='n';
   end loop;
end Agregar_Final_Lista_Reg;

---------- AGREGAR_FINAL ----------
procedure Agregar_Final (Cab:in out Puntero;Bl: in Clientes ) is 
begin
   
   Temp:=new Nodo; -- Crea un nuevo nodo
   Temp.All.Info:=Bl;
   Temp.All.Sig:=null;
   if Cab=null --si la lista esta vacia
      then
         Cab:=Temp;
         Final:=Temp;
      else
         Final.All.Sig:=Temp;
         Final:=Temp;
    end if;
end Agregar_Final;

--------- PROCEDIMIENTO GUARDAR EN ARCHIVO DATOS DE LISTA  --------------

procedure Guardar_Archivo (Cab : in out Puntero ) is 
begin
   begin -- Exception
         Open(A, Inout_File, "C:\Cliente.bin");  -- En InOut extraigo y almaceno
      exception
         when Clientes_Io.Name_Error => Create(A, Out_File, "C:\Cliente.bin");
   end;  -- Exception
   temp:=cab;
   while Temp/= null loop
      Write(A,Temp.All.Info);
      Temp:= Temp.All.Sig;
   end  loop;
   Close(A);
end Guardar_Archivo;


----- PROCEDIMIENTO EXTRAE DE ARCHIVO GUARDA EN LISTA ----------
procedure Extrae_Archivo (Cab : in out Puntero )is 

Existe : Boolean := True;  

begin
   begin -- Exception
         Open(A, In_File, "C:\Cliente.bin");
      exception
         when Clientes_Io.Name_Error => Existe:=False;
   end;  -- Exception
   if Existe = True
      then
         for I in 1..Size(A) loop
            Read(A,B);
            Agregar_Final(Cab,B);
         end loop;
         Close(A);
      else
         Put(" ***** NO EXISTE ARCHIVO DE CLIENTES ***** ");New_Line(3);
   end if;
end Extrae_Archivo;


---------- PRINCIPAL -----------
begin
   Extrae_Archivo(Cabeza);
   loop
      Menu;
      case Op is
         when 1 => Agregar_Final_Lista_Reg(Cabeza, B);
         when 2 => Reporte_Lista_Reg(Cabeza);
         when 3 => Guardar_Archivo(Cabeza);
            Put(" La lista ha sido almacenada en C:\Cliente.bin");New_Line(2);
            Put("  PRESIONE <<< ENTER >>> PARA SALIR  ");skip_line;
         when others => null;
      end case;
      exit when Op = 3;
   end loop;
end Lista_Achivo;
