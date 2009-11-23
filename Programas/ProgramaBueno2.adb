procedure Holamundo (x: in integer) is

type registro is
record
	x : integer;
	a : integer := 5;
end record;
variable: integer;

begin
null;
variable := a**x+44;
end Holamundo;

function F (i: out float) return float
