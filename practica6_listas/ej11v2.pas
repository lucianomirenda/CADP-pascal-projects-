program ej11v2;
type
	lista = ^nodo;
	alumno = record
		numero:integer;
		nombre:string;
		apellido:string;
		promedio:real;
	end;
	nodo = record
		alu:alumno;
		sig:lista;
	end;
procedure insertarOrdenado(var l:lista;a:alumno);
var
	ant,act,nuevo:lista;
begin
	new(nuevo);
	nuevo^.alu:= a;
	nuevo^.sig:= nil;

	ant:=l;
	act:=l;
	while((act <> niL) AND (act^.alu.promedio > a.promedio))do begin
		ant:=act;
		act:= act^.sig;
	end;
	if(act = ant)then l:= nuevo
	else begin
		ant^.sig:= nuevo;
	end;
	nuevo^.sig:= act;
end;
procedure leerAlumno(var a:alumno;cod:integer);
begin
	a.numero:= cod;	
	writeln('Ingrese nombre del alumno');
	readln(a.nombre);
	writeln('Ingrese apellido del alumno');
	readln(a.apellido);
	writeln('Ingrese promedio del alumno');
	readln(a.promedio);
end;
procedure cargarLista(var l:lista);
var
	cod:integer;
	a:alumno;
begin
	writeln('Ingrese código del alumno');
	readln(cod);
	while(cod <> 0)do begin
		leerAlumno(a,cod);
		insertarOrdenado(l,a);
		writeln('Ingrese código del alumno');
		readln(cod);
	end;
end;
procedure imprimirMejores(l:lista);
var
	i:integer;
begin
	for i:=1 to 10 do begin
		writeln(i,'° Promedio de ', l^.alu.promedio,' al alumno ', l^.alu.nombre, l^.alu.apellido);
		l:= l^.sig;
	end;
end;
var
	l:lista;
begin
	cargarLista(l);
	imprimirMejores(l);
end.


















