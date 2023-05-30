program vlistas;
type
	lista = ^nodo;

	nodo = record
		num:integer;
		sig:lista;
	end;

	vector = array[1 .. 10] of lista;
procedure crearLista(var v:vector);
var
	i:integer;
begin
	for i:=1 to 10 do
		v[i]:= nil;
end;
procedure agregarAlFinal(var l:lista;n:integer);
var
	aux,nuevo:lista;
begin
	new(nuevo);
	nuevo^.num:= n; 
	nuevo^.sig:= nil;
	if(l = nil)then 
		l:=nuevo
	else begin
		aux:=l;
		while(aux^.sig <> nil)do 
			aux:= aux^.sig;
		aux^.sig:= nuevo;
	end;
end;
procedure cargarVector(var v:vector);
var
	l,n:integer;
begin
	writeln('Elige la lista');
	readln(l);
	writeln('Ingresa un número:');
	readln(n);
	while(n <> 0)do begin
		agregarAlFinal(v[l],n);
		writeln('Elige la lista');
		readln(l);
		writeln('Ingresa un número:');
		readln(n);
	end;
end;
procedure imprimirLista(v:vector);
var
	i:integer;
begin
	for i:= 1 to 10 do begin
		writeln('En la lista',i,' se guardan estos números: ');
		while(v[i] <> niL) do begin
			write('[',v[i]^.num,'] ');
			v[i]:= v[i]^.sig;
		end;
		writeln('');
	end;
end;
var
	v:vector;
begin
	cargarVector(v);
	imprimirLista(v);
end.
