-- Programa Archivo pasa a Lista
-- Opciones de Reporte, Modificar, Consultar, borrar, ordenar, mayor saldo
-- al salir guarda en archivo los datos de la lista

with Ada.Text_Io, Ada.Integer_Text_Io, Ada.Float_Text_Io, Ada.Direct_Io,Ada.Unchecked_Deallocation;
use  Ada.Text_Io, Ada.Integer_Text_Io, Ada.Float_Text_Io;

procedure TAREA7 is

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

   Cabeza, Temp, Final, temp2: Puntero := null;
   Resp : Character;
   Op : Integer;

   -- FIN DECLARACIONES

--Instansiacion del paquete para borrar
Procedure Liberar is new Ada.Unchecked_Deallocation(Nodo,Puntero);
-- Lleva dos parametros el tipo de la memoria apuntada (nodo) y el tipo de puntero(Puntero)


---------- MENU PRINCIPAL ----------
procedure Menu is
begin
   Put(" MENU ");New_Line;
   Put("1. Agregar Final ");New_Line;
   Put("2. Reporte ");New_Line;
   Put("3. Modificar ");New_Line;
   Put("4. Consultar ");New_Line;
   Put("5. Borrar  ");New_Line;
   Put("6. Ordenar  ");New_Line;
   Put("7. Mayor saldo ");New_Line;
   Put("8. salir y Guardar en Archivo ");New_Line;
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
               Put(Temp.All.Info.Nombre);New_Line;
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
   Bl.Nombre:=(others=>' ');
   Get_Line(Bl.Nombre, Bl.L);
   Put("Ingrese la saldo: ");
   Get(Bl.Saldo);Skip_line;
end Leer;

---------- AGREGAR_FINAL_LISTA_REG ----------
procedure Agregar_Final_Lista_Reg (Cab:out Puntero) is
begin
   loop
      Leer(B);
      Temp:=new Nodo; -- Crea un nuevo nodo
      Temp.All.Info:=B;
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

--Modificar
procedure modificar (cab: in puntero) is 
   n:integer;
   enco:boolean:=false;
   
   begin
      put("Ingrese el codigo: ");
      get(n);skip_line;
      temp:=cab;
         while temp /= null and enco=false loop
            if temp.all.info.cuenta=n
               then
                  enco:=true;
               else
                  temp:=temp.all.sig;
            end if;
         end loop;
         if enco=true
            then
               put("Ingrese nuevo saldo:");skip_line; 
         else
            put("No se encontro el cliente");new_line;
         end if;   
   end modificar;

--Consulta   
procedure consulta (cab: in puntero) is 
   n:integer;
   enco:boolean:=false;
   
   begin
      put("Ingrese el codigo: ");
      get(n);skip_line;
      temp:=cab;
         while temp /= null and enco=false loop
            if temp.all.info.cuenta=n
               then
                  enco:=true;
               else
                  temp:=temp.all.sig;
            end if;
         end loop;
         if enco=true
            then
               put("codigo:");put(temp.all.info.cuenta,0);new_line;
               put("nombre:");put(temp.all.info.nombre(1..temp.all.info.l));new_line;
         else
            put("No se encontro el cliente");new_line;
         end if;   
   end consulta;


   --Borrar
procedure borrar (cab: in Out puntero) is
   n:integer;
   Encontrado:boolean:=false;
begin
   Put("Teclee el codigo del empleado a borrar:");
   Get(N); Skip_Line;
   Temp:=Cab;
   Encontrado:=False;
   While Temp/=Null And Encontrado=False Loop
       If N = Temp.all.Info.cuenta
              Then
                 Encontrado:=True;
              else
                 Temp:=Temp.all.sig;
       end If;   
   End Loop;
   If Encontrado = True
      Then
          If N=Cab.all.Info.cuenta
               --primer caso cuando el numero a borrar es el primero
               Then
                   Cab:=Cab.all.Sig;
                   Temp.all.sig:=Null;
                   Liberar(temp);--Aqui se llama al procedimiento para borrar
                Else
                --Cuando quiero borrar cualquier otro numero
                   Temp2:=Cab;
                   While Temp2.all.Sig /= Temp Loop
                      Temp2:=Temp2.all.sig;
                   End Loop;
                   Temp2.all.sig:=Temp.all.sig;
                   Temp.all.sig:=Null;
                   Liberar(temp);--Aqui se llama al procedimiento para borrar
            End if;  
         Else
            Put("El Numero no Existe en la Lista");
            New_Line;
   End if;
   --Imprimir la lista Nueva
   Temp:=Cab;
   While Temp/=Null loop
      Put(Temp.All.Info.Cuenta,0);
      Put(Temp.All.Info.Nombre(1..Temp.All.Info.L));
      Put(Temp.All.Info.saldo);
     Temp:=Temp.all.Sig;
   End Loop;
end borrar;

--oredenar

procedure ordenar (cab: in puntero) is
   temp2:puntero; 
   tc:clientes;
   begin
        temp:=cab;
         while temp /= null loop
            temp2:=temp;
            while temp2 /= null loop
               if temp.all.info.cuenta>temp2.all.info.cuenta then
                  tc:=temp.all.info;
                  temp.all.info:=temp2.all.info;
                  temp2.all.info:=tc;
               end if;
               temp2:=temp2.all.sig;
            end loop;
            temp:=temp.all.sig;
         end loop;
               
   end ordenar;

---mayor saldo
procedure m_saldo (cab: in puntero) is
   mayor:float;
   begin
        temp:=cab;
        mayor:=temp.all.info.saldo;
         while temp /= null loop
            if temp.all.info.saldo>mayor then
               mayor:=temp.all.info.saldo;
            end if;
            temp:=temp.all.sig;
          end loop;
          put("El mayor saldo es: ");put(mayor,0,2,0);skip_line;
                          
   end m_saldo;

---------- PRINCIPAL -----------
begin
   Extrae_Archivo(Cabeza);
   loop
      Menu;
      case Op is
         when 1 => Agregar_Final_Lista_Reg(Cabeza);
         when 2 => Reporte_Lista_Reg(Cabeza);
         when 3 => modificar(Cabeza);
         when 4 => consulta(Cabeza);
         when 5 => borrar (cabeza);  
         when 6 => ordenar (cabeza);
         when 7 => m_saldo (cabeza);
         when 8 => Guardar_Archivo(Cabeza);
         
            Put(" La lista ha sido almacenada en C:\Cliente.bin");New_Line(2);
            Put("  PRESIONE <<< ENTER >>> PARA SALIR  ");skip_line;
         when others => null;
      end case;
      exit when Op = 8;
   end loop;
end TAREA7;
