with Ada.Text_Io, Ada.Integer_Text_Io;
use  Ada.Text_Io, Ada.Integer_Text_Io;


-------ALFREDO ALCANTARA
----------10541035
procedure T4_10541035 is
   N,A:Integer:=0;


   function Fib(X : Integer) return Integer is
   begin
      if (x<1) then return 1;
      else return (Fib(x) + Fib(x-2));
      end if;
   end Fib;

begin
   Put("numero de terminos: ");
   Get(N);Skip_Line;
   Put(Fib(A),0);

end T4_10541035;
