program ej10;
const 
	size = 300;
type 
	range = 1 .. size;
	salario = array [range] of real;
procedure cargarSalario(var v:salario;var dl:integer);
var
	aux:real;
begin
	dl:= 0;
	writeln('Cargue el salario n°',dl+1,': ');
	readln(aux);
	while((aux <> 0) and (dl < size)) do begin
		dl:= dl + 1;
		v[dl]:= aux;
		writeln('Cargue el salario n°',dl+1,': ');
		readln(aux);
	end;
end;
procedure incremento(var v:salario;dl:integer;x:real);
var
	i:integer;
begin
	for i:=1 to dl do 
		v[i]:= v[i]*x;
end;
procedure promedio(v:salario;dl:integer);
var
	i:integer;
	suma:real;
begin
	suma:= 0;
	for i:=1 to dl do 
		suma:= suma + v[i];
	writeln('El salario promedio es ', (suma / dl):3:2);
end;
var
	v:salario;
	dimL:integer;
begin
	cargarSalario(v,dimL);
	incremento(v,dimL,1.15);
	promedio(v,dimL);
end.
