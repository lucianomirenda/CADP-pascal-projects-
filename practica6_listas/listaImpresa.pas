program clientes;
type
	lista = ^nodo;
	cliente = record
		dni:integer;
		num:integer;
	end;
	nodo = record
		cl:cliente;
		sig:lista;
	end;
procedure recibirCliente(var l:lista;DNI:integer);
var
	aux,nuevo:lista;
begin
	new(nuevo);
	nuevo^.cl.dni:= dni;
	readln(nuevo^.cl.num);
	nuevo^.sig:= nil;
	if(l = nil)then l:= nuevo
	else begin
		aux:=l;
		while(aux^.sig <>nil)do
			aux:=aux^.sig;
		aux^.sig:= nuevo;
	end;
end;
procedure atenderCliente(var l:lista;var atendido:cliente);
var
	aux:lista;
begin
	if(l<>nil)then begin
		atendido:= l^.cl;
		aux:= l;
		l:= l^.sig;
		dispose(aux);
	end;
end;
var
	l:lista;
begin
	l:=nil;

end.
