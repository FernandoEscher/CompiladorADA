with ada.text_io,ada.integer_text_io;
use ada.text_io,ada.integer_text_io;

procedure invertir is

type arreglo is array(integer range <>) of integer;
n:integer;

begin 
put("Ingrese el tamaño del arreglo");
get(n);skip_line;
declare 
a:arreglo (1..n):=(others=>0);
begin
for i in 1..n loop
put("ingrese un numero");
get(a(i));skip_line;
end loop;
--put(a(n),0);
for i in 1..n loop
put(A(n));new_line;
N:=n-1;

end loop;
end;
end invertir;