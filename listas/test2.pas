program test2;
type
	listaE = ^nodo;

	nodo = record
		dato:integer;
		dato2:string;
	end;
procedure cargarPuntero(p:listaE);
begin
	new(p);
	writeln('Escribe un entero ');
	readln(p^.dato);
	writeln(p^.dato);
	dispose(p);
end;
var
	l:listaE;
begin
	cargarPuntero(l);
end.
