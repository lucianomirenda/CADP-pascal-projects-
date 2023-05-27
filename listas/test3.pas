program test3;
type
	lista = ^nodo;

	nodo = record
		dato:char;
		sig:lista;
	end;
procedure crearLista(var l:lista);
begin
	l:=nil;
end;
procedure agregar(var l:lista;vocal:char);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dato:=vocal;
	nuevo^.sig:= nil;

	if(l = nil)then l:= nuevo  {agrega el primer valor, que se convertira en el ultimo}
	else begin
		nuevo^.sig:= l; {guarda en el nuevo elemento, la dirección del viejo}
		l:= nuevo; {reemplaza el viejo con el nuevo}
	end;

end;
procedure cargarLista(var l:lista);
var
	vocal:char;
begin
	readln(vocal);
	while(vocal <> 'f')do begin
		agregar(l,vocal);
		readln(vocal);
	end;
end;
procedure recorrer(l:lista);
begin
	while(l <> nil)do begin
		writeln(l^.dato);
		l:= l^.sig;	
	end;
end;
var
	l:lista;
begin
	crearLista(l);	
	cargarLista(l);
	recorrer(l);

end.
