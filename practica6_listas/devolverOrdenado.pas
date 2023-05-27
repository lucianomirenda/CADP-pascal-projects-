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
procedure insertarDescendente(var l:lista;d:integer);
var
	act,ant,nuevo:lista;
begin
	new(nuevo);
	nuevo^.dato:= d;
	
	act:= l;
	ant:= l;

	while((act <> nil)and(d < act^.dato))do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(act = ant)then 
		l:=nuevo
	else
		ant^.sig:= nuevo;

	nuevo^.sig:= act;
	imprimirLista(l);
	writeln('');
	writeln('-------------------------------------------');

end;
procedure insertarAscendente(var l:lista;d:integer);
var
	act,ant,nuevo:lista;
begin
	new(nuevo);
	nuevo^.dato:= d;
	
	act:= l;
	ant:= l;

	while((act <> nil)and(d > act^.dato))do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(act = ant)then 
		l:=nuevo
	else
		ant^.sig:= nuevo;

	nuevo^.sig:= act;
	imprimirLista(l);
	writeln('');
	writeln('-------------------------------------------');

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
procedure cargarLista(var lasc,ldesc,l:lista);
var
	n:integer;
begin
	writeln('Escribe un número: ');
	readln(n);
	while(n <> 0)do begin
		insertarAscendente(lasc,n);
		insertarDescendente(ldesc,n);
		agregarAdelante(l,n);
		writeln('Escribe un número: ');
		readln(n);
	end;
end;
function estaOrdenada(l:lista):boolean;
var
	esta1,esta2:boolean;
	l2:lista;
begin
	esta1:=true;
	esta2:=true;
	l2:=l;
	while((l<> nil)AND(l^.sig <> nil)AND(esta1))do begin
		esta1:= (l^.dato <= l^.sig^.dato);
		l:= l^.sig;
	end;
	while((l2<> nil)AND(l2^.sig <> nil)AND(esta2))do begin
		esta2:= (l2^.dato >= l2^.sig^.dato);
		l2:= l2^.sig;
	end;

	estaOrdenada:= (esta1 or esta2);
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
var
	lasc,ldes,l:lista;
begin
	l:=nil;
	lasc:=nil;
	ldes:=nil;
	cargarLista(lasc,ldes,l);
	imprimirLista(l);
	writeln('');
	writeln(estaOrdenada(l));
	imprimirLista(lasc);
	writeln('');
	writeln(estaOrdenada(lasc));
	imprimirLista(ldes);
	writeln('');
	writeln(estaOrdenada(ldes));
	eliminador(l);
end.
