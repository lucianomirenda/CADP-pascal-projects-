program buscarTest;
type
	lista = ^nodo;
	nodo = record
		num:integer;
		sig:lista;
	end;
procedure imprimirLista(l:lista);
begin
	writeln('');
	while(l<>nil)do begin
		write('[',l^.num,'] ');
		l:=l^.sig;
	end;
	writeln('');
end;
procedure eliminar(var l:lista;d:integer);
var
	ant,act:lista;
begin
	act:= l;
	while((act <> nil)and(act^.num <> d))do begin
		ant:= act;
		act:= act^.sig;
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
procedure eliminarMultiple(var l:lista;d:integer);
var
	act,ant:lista;
begin
	act:= l;
	while(act <> nil)do begin
		if(act^.num <> d)then begin
			ant:= act;
			act:= act^.sig;
		end
		else begin
			if(act= l)then
				l:= l^.sig
			else 
				ant^.sig:= act^.sig;
			dispose(act);
			act:= ant;
			imprimirLista(l);
		end;
	end;
end;
procedure insertarOrdenado(var l:lista;d:integer);
var
	ant,act,nuevo:lista;
begin
	new(nuevo);
	nuevo^.num:= d;
	ant:=l;
	act:=l;
	while((act <>nil)AND(act^.num < d))do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(ant = act)then
		l:=nuevo
	else 
		ant^.sig:=nuevo;
	nuevo^.sig:= act;
end;
procedure agregarAdelante(var l:lista;d:integer);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.num:= d;
	nuevo^.sig:=nil;

	if(l = nil)then l:=nuevo
	else begin
		nuevo^.sig:= l;
		l:= nuevo;
	end;
end;
procedure cargarLista(var l:lista);
var
	n:integer;
begin
	writeln('Ingrese un número');
	readln(n);
	while(n<>0)do begin
		insertarOrdenado(l,n);
		imprimirLista(l);
		writeln('Ingrese un número');
		readln(n);
	end;
end;
function buscarOrdenado(l:lista;d:integer):boolean;
begin
	writeln('');
	while((l <> nil)AND(l^.num < d))do begin 
		write('[',l^.num,'] ');
		l:=l^.sig;
	end;

	writeln('');
	buscarOrdenado:= ((l<>nil)and(l^.num = d));
end;
function buscar(l:lista;d:integer):boolean;
var
	esta:boolean;
begin
	esta:=false;
	writeln('');
	while((l<>nil)AND(not esta))do begin
		write('[',l^.num,'] ');
		if(l^.num = d)then
			esta:=true
		else
			l:= l^.sig;
	end;
	writeln('');
	buscar:= esta;
end;
procedure eliminarmientras(var l:lista);
var 
	n:integer;
begin
	imprimirLista(l);
	writeln('ingresa el número a eliminar');
	readln(n);
	while(n <> 0)do begin
		eliminarMultiple(l,n);
		writeln('');
		writeln('Ingresa el número a eliminar');
		readln(n);
	end;
end;
procedure buscarmientras(l:lista);
var
	n:integer;
begin
	writeln('ingresa el número a buscar');
	readln(n);
	while(n <> 0)do begin
		if(buscarOrdenado(l,n))then
			writeln('El número esta!')
		else
			writeln('El número no esta :(');

		writeln('');
		writeln('Ingresa el número a buscar');
		readln(n);
	end;

end;
var
	l:lista;
begin
	l:=nil;
	cargarLista(l);
	buscarMientras(l);
	eliminarmientras(l);
end.
