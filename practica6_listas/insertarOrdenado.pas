program insertarOrdenado;
type
	lista = ^nodo;
	nodo = record
		dato:integer;
		sig:lista;
	end;
procedure imprimirLista(l:lista);
begin
	while(l<>nil)do begin
		write('[',l^.dato,']');
		l:= l^.sig;
	end;
end;
procedure insertarOrdenado(var l:lista;d:integer);
var
	act,ant,nuevo:lista;
begin
	new(nuevo);
	nuevo^.dato:= d;
	
	act:= l;
	ant:= l;

	while((act <> nil)AND(d > act^.dato))do begin
		ant:= act;
		act:= act^.sig;
	end;

	if(act = ant)then
		l:=nuevo
	else
		ant^.sig:= nuevo;

	nuevo^.sig:= act;
	
end;
procedure cargarLista(var l:lista);
var
	n:integer;
begin
	writeln('Escribe un número: ');
	readln(n);
	while(n <> 0)do begin
		insertarOrdenado(l,n);
		writeln('Escribe un número: ');
		readln(n);
	end;
end;
var
	l:lista;
begin
	l:= nil;
	cargarLista(l);
	imprimirLista(l);
end.
