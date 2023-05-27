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
	vContador = array[range] of integer;
procedure inicializarCont(var vc:vContador);
var
	i:integer;
begin
	for i:=1 to size do
		vc[i]:=0;
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
procedure promedios(l:lista;var pDuracion,pCosto:real);
var
	sumaDuracion,cantSondas:integer;
	sumaCosto:real;
begin
	sumaDuracion:=0;
	sumaCosto:=0;
	cantSondas:=0;
	
	while(l <> nil)do begin
		cantSondas:= cantSondas +1;
		sumaCosto:= sumaCosto + l^.dato.costoConstruccion;
		sumaDuracion:= sumaDuracion + l^.dato.duracion; 
		l:= l^.sig;
	end;
	pDuracion:= sumaDuracion / cantSondas;
	pCosto:= sumaCosto / cantSondas;
end;
procedure maxCostosa(var max:real;var maxNombre:string;costoC:real;costoD:real;nombre:string);
var
	costoTotal:real;
begin
	costoTotal:= costoC + costoD;	
	if(max > costoTotal)then begin
		max:= costoTotal;
		maxNombre:= nombre;
	end;
end;
procedure imprimirRangos(vc:vContador);
var
	i:integer;
begin
	for i:=1 to size do
		writeln('El rango ', i,' tiene, ',vc[i],' sondas');

end;
procedure procesos(l:lista;promCosto,promDuracion:real;var vc:vContador);
var
	maximoCosto:real;
	sondaMaxCosto:string;
	cantSuperioresD:integer;
begin
	cantSuperioresD:= 0;
	maximoCosto:= -32768;
	while(l <> nil)do begin
		maxCostosa(maximoCosto,sondaMaxCosto,l^.dato.costoConstruccion,l^.dato.costoMensual,l^.dato.nombre);
		vc[l^.dato.rango]:= vc[l^.dato.rango] + 1;
		if(l^.dato.duracion > promDuracion)then
			cantSuperioresD:= cantSuperioresD + 1;
		if(l^.dato.costoConstruccion > promCosto)then
			writeln(l^.dato.nombre,' Supera el costo promedio');
		l:= l^.sig;
	end;
	writeln('La onda más costosa es: ',sondaMaxCosto);
	writeln('La cantidad de sondas que superan la duracion promedio es: ',cantSuperioresD);
	imprimirRangos(vc);	
end;
var
	vcont:vContador;
	l:lista;
	promDuracion,promCosto:real;
begin
	inicializarCont(vcont);
	cargarSondas(l);
	promedios(l,promDuracion,promCosto);
	procesos(l,promCosto,promDuracion,vcont);
	
end.
