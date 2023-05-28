program listaMax;
const
	dMax = 10;
type
	lista = ^nodo;
	egresado = record
		numero:integer;
		apellido:string;
		nombre:string;
		promedio:real;
	end;
	nodo = record
		alumno:egresado;
		sig:lista;
	end;
	range = 1 .. dMax;
	maximos = array[range] of real;
procedure inicializarMax(var v:maximos);
var
	i:integer;
begin
	for i:=1 to dMax do
		v[i]:= -32768;
end;
procedure leerAlumno(var a:egresado;codigo:integer);
begin
	a.numero:=codigo;
	writeln('Ingresar nombre de alumno');
	readln(a.nombre);
	writeln('Ingresar apellido de alumno');
	readln(a.apellido);
	writeln('Ingresar promedio de alumno');
	readln(a.promedio);
end;
procedure agregarAdelante(var l:lista;alu:egresado);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.alumno:= alu;
	nuevo^.sig:= nil;
	if(l = nil)then l:= nuevo
	else begin
		nuevo^.sig:= l;
		l:= nuevo;
	end;
end;
procedure cargarLista(var l:lista);
var
	a:egresado;
	cod:integer;
begin
	writeln('Ingresar código de alumno');
	readln(cod);
	while(cod <> 0)do begin
		leerAlumno(a,cod);
		agregarAdelante(l,a);
		writeln('Ingresar código de alumno');
		readln(cod);
	end;
end;
procedure contMax(var vc:maximos;n:real);
var
	i,j:integer;
begin
	j:=1;
	while((j<=dMax)AND(vc[j] > n))do 
		j:= j+1;
	if(j<=dMax)then begin
		for i:= (dMax-1) downto j do
			vc[i+1]:= vc[i];
		vc[j]:= n;
	end;
end;
procedure sacarMaximos(l:lista;var vc:maximos);
begin
	while(l<>nil)do begin
		contMax(vc,l^.alumno.promedio);
		l:= l^.sig;
	end;
end;
procedure imprimirMax(v:maximos);
var
	i:integer;
begin
	writeln('');
	for i:=1 to dMax do
		write('[',v[i],'] ');
	writeln('');
end;
var
	l:lista;
	vc:maximos;
begin
	l:=nil;
	cargarLista(l);	
	sacarMaximos(l,vc);
	imprimirMax(vc);	
end.

