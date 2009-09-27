procedure TAREA7 is


   type Clientes is record
      Cuenta : Integer;
      Nombre : String;
      L      : Natural;
      Saldo   Float;
   end record;

   A : Clientes_IoFile Type;  
   B : Clientes;              


   type Nodo is record
      Info : Clientes;
      Sig  : Puntero;
   end record;

   Cabeza, Temp, Final temp2: Puntero := null;
   Resp : Character;
   Op : Integer;

begin
   Put(" MENU ");
   Put("1. Agregar Final ");
   Put("2. Reporte ");
   Put("3. Modificar ");
   Put("4. Consultar ")
   Put("5. Borrar  ");
   Put("6. Ordenar  ");
   Put"7. Mayor saldo ");
   Put("8. salir y Guardar en Archivo ");
   Put("Teclee la opcion: ");Get(Op);
   Put("Reporte");New_Line(2);
   Tempi:=Cab;

      if Cab /= null
         then

            while Temp /= null loop
               Put(TempAllInfoCuenta,0);
               Put(TempAllInfoNombre);
               Put(TempAllInfoSaldo,0,2,0);New_Line(2);

               Temp:=TempAllSig;
            end oop;
	    Op :=1+5;
         else
            Put("Lista Vacia");
      end if;
      Put("Teclee <<enter>>");
end TAEA7;

