program test6;
type
	lista = ^nodo;

	becados = record
		nombre:string;
		sueldo:real;
		dni:integer;
		solicitud:boolean;
	end;
	
	nodo = record
		dato:becados;
		sig:lista;
	end;
function aprobacion(sueldo:real):boolean;
begin
	aprobacion:= sueldo < 10000;
end;
procedure leerBeca(var b:becados;sueldito:real);
begin
	writeln('Escriba su nombre');
	readln(b.nombre);
	b.sueldo:=sueldito;
	writeln('Escriba su dni');
	readln(b.dni);
	b.solicitud:= aprobacion(b.sueldo);
end;
procedure crearL(var l:lista);
begin
	l:=nil;
end;
procedure agregarAdelante(var l:lista;beca:becados);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dato:= beca;
	nuevo^.sig:= nil;

	if(l = nil)then l:= nuevo
	else begin
			nuevo^.sig:= l;
			l:= nuevo;
		end;
end;
procedure cargarLista(var l:lista);
var
	b:becados;
	sueldo:real;
begin
	writeln('Escriba su sueldo');
	readln(sueldo);
	while(sueldo <> 0)do begin
		leerBeca(b,sueldo);
		agregarAdelante(l,b);
		writeln('Escriba su sueldo');
		readln(sueldo);
	end;
end;
function aprobados(l:lista):integer;
var
	cont:integer;
begin
	cont:= 0;
	while(l <> nil)do begin
		if(l^.dato.solicitud)then cont:= cont + 1;
		l:= l^.sig;	
	end;
	aprobados:= cont;
end;
var
	l:lista;
begin
	crearL(l);
	cargarLista(l);
	writeln('La cantidad de aprobados es de: ', aprobados(l));
end.
