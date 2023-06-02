program eliminar;
type
	lista = ^nodo;
	nodo = record
		n:integer;
		sig:lista;
	end;
procedure imprimirLista(l:lista);
begin
	writeln('');
	while(l<>nil)do begin
		write('[',l^.n,'] ');
		l:= l^.sig;
	end;
	writeln('');
end;
procedure insertarAlFinal(var l:lista;var z:lista;num:integer);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.n:=num;
	nuevo^.sig:=nil;

	if(l = nil)then
		l:=nuevo
	else
		z^.sig:= nuevo;
	z:=nuevo;
end;
procedure cargarLista(var l:lista);
var
	z:lista;
	num:integer;
begin
	writeln('Ingrese un número');
	readln(num);
	while(num <> 0)do begin
		insertarAlFinal(l,z,num);
		imprimirLista(l);
		writeln('Ingrese un número');
		readln(num);
	end;
end;
procedure eliminar(var l:lista;num:integer);
var
	act,ant:lista;
begin
	act:=l;
	while((act <> nil)AND(act^.n <> num))do begin
		ant:=act;	
		act:=act^.sig;
	end;
	if(act <> nil)then begin
		if(act = l)then
			l:= l^.sig
		else 
			ant^.sig:= act^.sig;
		dispose(act);
	end;
	imprimirLista(l);
end;
procedure eliminarHasta(var l:lista);
var
	num:integer;
begin
	writeln('Ingrese un número a eliminar');
	readln(num);
	while(num <> 0)do begin
		eliminar(l,num);
		writeln('Ingrese un número a eliminar');
		readln(num);
	end;
end;
var
	l:lista;
begin
	cargarLista(l);
	eliminarHasta(l);
	
end.
