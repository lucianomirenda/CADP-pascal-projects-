program test5;
type
	lista = ^nodo;
	nodo = record
		name:string;
		sig:lista;
	end;
procedure crearLista(var l:lista);
begin
	l:=nil;
end;
procedure agregarAdelante(var l:lista;nombre:string);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.name:= nombre;
	nuevo^.sig:= nil;

	if(l = nil)then l:= nuevo
	else begin
		nuevo^.sig:= l;
		l:= nuevo;
		end;
end;
procedure cargarLista(var l:lista);
var
	name:string;
begin
	readln(name);
	while(name <> 'mishamoto')do begin
		agregarAdelante(l,name);
		readln(name);
	end;
end;
procedure procesoLista(l:lista);
begin
	while(l <> nil)do begin
		writeln(l^.name);
		l:= l^.sig;
	end;
end;
var
	l:lista;
begin
	crearLista(l);
	cargarLista(l);
	procesoLista(l);
end.

