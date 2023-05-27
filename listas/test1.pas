program test1;
type 
	lista = ^nodo; {creamos nuestro de tipo de dato puntero}

	nodo = record
		dato:integer;
		sig:lista; {este campo va a ser del tipo puntero}
	end;

procedure agregar(var l:lista);
var
	n:lista;
begin
	new(n);
	readln(n^.dato);
	n^.sig:= nil;

	if(l = nil)then
		l:= n
	else begin
			n^.sig:= l;
			l:= n;
		end;
end;
procedure cargar(var l:lista);
var
	aux:integer;
begin
	aux:= 1;
	while(aux <> 0)do begin
		agregar(l);
		aux:= l^.dato;
	end;		
end;
procedure recorrer(l:lista);
begin
	writeln('-----------');
	while(l <> nil)do begin
		writeln(l^.dato);
		l:= l^.sig;
	end;
end;
var
	l:lista;
begin
	l:= nil;
	
	cargar(l);

	recorrer(l);
end.
