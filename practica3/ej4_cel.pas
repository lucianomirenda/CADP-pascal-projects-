program companiaCelular;
type
	linea = record
		num:integer;
		min:real;
		mb:real;
	end;

	cliente = record
		codigo:integer;
		lin:linea;
	end;
function factura(min:real;mb:real):real;
begin
	factura:= (min*3.40) + (mb * 1.35);
end;
procedure leerLinea(var lin:linea);
begin
	with lin do begin
		writeln('Ingrese el número de cliente: ');
		readln(num);
		writeln('Ingrese los minutos consumidos: ');
		readln(min);
		writeln('Ingrese los megabytes consumidos: ');
		readln(mb);
	end;
end;
procedure leerLineasT(c:cliente;var minutos,megas:real;var actual:integer);
begin
	minutos:=0;
	megas:= 0;
	actual:= c.codigo;
	while(c.codigo = actual)do begin
		leerLinea(c.lin);
		minutos:= minutos + c.lin.min;
		megas:= megas + c.lin.mb;
		writeln('Ingrese el código de cliente: ');
		readln(c.codigo);
	end;
	writeln('--------------------------------------');
end;
var 
	actual,i:integer;
	c:cliente;
	minT,mbT:real;
begin
	writeln('Ingrese el código de cliente: ');
	readln(c.codigo);
	for i:= 1 to 3 do begin 
		leerLineasT(c,minT,mbT,actual);
		writeln('La factura del cliente ', actual, ' es de ', factura(minT,mbT):4:2);
		writeln('--------------------------------------');
	end;

end.

