program ej6;
const
	size = 7;
type
	range = 1 .. size;
	lista = ^nodo;
	sonda = record
		nombre:string;
		duracion:integer;
		costoConstruccion:real;
		costoMensual:real;
		rango:range;
	end;
	nodo = record
		dato:sonda;
		sig:lista;
	end;
procedure leerSonda(var s:sonda);
begin
	writeln('Nombre de la sonda: ');
	readln(s.nombre);
	writeln('Duración de la sonda: ');
	readln(s.duracion);
	writeln('costo de la construccion de la sonda: ');
	readln(s.costoConstruccion);
	writeln('Costo mensual de la sonda: ');
	readln(s.costoMensual);
	writeln('Rango de la sonda: ');
	readln(s.rango);

end;
procedure agregarAdelante(var l:lista;s:sonda);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dato:= s;
	nuevo^.sig:= nil;
	if(l = nil)then
		l:=nuevo
	else begin
			nuevo^.sig:= l;
			l:= nuevo;
		end;
end;
procedure cargarSondas(var l:lista);
var
	s:sonda;
begin
	repeat
		leerSonda(s);
		agregarAdelante(l,s);
	until(s.nombre = 'GAIA');
end;
function cumpleh2020(s:sonda):boolean;
begin
	cumpleh2020:= not((s.costoMensual > s.costoConstruccion) OR (s.rango = 1));
end;
procedure nuevosListados(l:lista;var lcumple,lnocumple:lista);
begin
	while(l<>nil)do begin
		if(cumpleh2020(l^.dato))then
			agregarAdelante(lcumple,l^.dato)
		else
			agregarAdelante(lnocumple,l^.dato);
		l:= l^.sig;
	end;
end;
function costoTotal(l:lista):real;
var
	costoT:real;
begin
	costoT:=0;
	while(l<>nil)do begin
		costoT:= costoT + l^.dato.costoConstruccion + l^.dato.costoMensual;
		l:= l^.sig;
	end;
	costoTotal:= costoT;
end;
procedure imprimirLista(l:lista);
begin
	while(l <> nil)do begin
		writeln('-------------------------------');
		writeln(l^.dato.nombre);
		writeln('-------------------------------');
		l:= l^.sig;
	end;
end;
var
	l,lCumple,lNoCumple:lista;
	costoNoFinanciados:real;
begin
	cargarSondas(l);
	nuevosListados(l,lCumple,lNoCumple);
	costoNoFinanciados:= costoTotal(lNoCumple);
	writeln('Lista que cumple: ');
	imprimirLista(lCumple);
	writeln('');
	writeln('Lista que no cumple: ');
	imprimirLista(lNoCumple);
	writeln('El costo total es: ',costoNoFinanciados);
end.
