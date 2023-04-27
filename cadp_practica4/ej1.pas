program sumador;
type
	vnums = array [1 .. 10] of integer;
var
	numeros:vnums;
	i : integer;
begin
	for i:= 1 to 10 do 
		numeros[i]:= i;
	
	for i:= 1 to 9 do
		numeros[i+1]:= numeros[i];
	
	for i:= 1 to 10 do begin 
		write(' ',numeros[i],' ');
	end;
	writeln('');

end.
