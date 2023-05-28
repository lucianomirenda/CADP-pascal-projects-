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

procedure agregarAdelante(var l:lista;d:integer);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dato:= d;
	nuevo^.sig:= nil;
	if(l = nil)then l:= nuevo
	else begin
		nuevo^.sig:=l;
		l:= nuevo;
	end;
	imprimirLista(l);
	writeln('');
	writeln('-------------------------------------------');
end;
procedure cargarLista(var l:lista);
var
	n:integer;
begin
	writeln('Escribe un número: ');
	readln(n);
	while(n <> 0)do begin
		agregarAdelante(l,n);
		writeln('Escribe un número: ');
		readln(n);
	end;
end;
procedure eliminar(var l:lista;n:integer);
var
	ant,act:lista;
begin
	writeln('------------');
	imprimirLista(l);
	act:= l;
	while((act <> nil)AND(act^.dato <> n))do begin
		ant:= act;
		act:= act^.sig;
	end;
			
	if(act <> nil)then begin
		if(act = l)then begin
			l:= act^.sig;
		end else begin
			ant^.sig:= act^.sig;
		end;
			dispose(act);
	end;
	writeln('------------');
	imprimirLista(l);
	writeln('');
end;
procedure eliminador(var l:lista);
var
	n:integer;
begin
	writeln('Numero a eliminar: ');
	readln(n);
	while(n <> (-1))do begin
		eliminar(l,n);
		writeln('Numero a eliminar: ');
		readln(n);
	end;
end;
procedure nuevaLista(l:lista;a:integer;b:integer;var nl:lista);
begin
	while(l <> nil)do begin
		if((l^.dato < b)AND(l^.dato > a))then
			agregarAdelante(nl,l^.dato);
		l:= l^.sig;
	end;
end;
procedure nuevaListaAsc(l:lista;a,b:integer;var nl:lista);
begin

	while((l<>nil)AND(l^.dato < b))do begin
		if(l^.dato > a)then
			agregarAdelante(nl,l^.dato);
		l:=l^.sig;
	end;
end;
procedure nuevaListaDesc(l:lista;a,b:integer;var nl:lista);
begin
	while((l<>nil)AND(l^.dato > a))do begin
		if(l^.dato < b)then
			agregarAdelante(nl,l^.dato);
		l:=l^.sig;
	end;
end;
var
	l,nl:lista;
	a,b:integer;
begin
	l:=nil;
	nl:=nil;
	cargarLista(l);
	imprimirLista(l);
	writeln('');
	writeln('Escribe un número a: ');
	readln(a);
	writeln('Escribe un número b: ');
	readln(b);
	
	nuevaListaDesc(l,a,b,nl);
	imprimirLista(nl);
	writeln('');
end.
