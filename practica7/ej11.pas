program eventos;
const
	dimE;
type
	rangoEventos = 1 .. dimE;
	
	evento = record
		nombre:string;
		tipo:integer;
		lugar:string;
		capacidad:integer;
		precio:real;
	end;

	vEventos = array[rangoEventos] of evento;

	lista = ^nodo;

	ventas = record
		codigo:integer;
		numEvento:integer;
		dni:integer;
		cant:integer;
	end;

	nodo = record
		venta:ventas;
		sig:lista;
	end;

	vVentas = array[rangoEventos] of integer;
procedure leerEvento(e:evento); //Se dispone
procedure cargarEventos(v:vEventos); //Se dispone
procedure inicializarContador(var vc:vVentas);
var
	i:integer;
begin
	for i:=1 to dimE do
		vc[i]:= 0;
end;
procedure leerVenta(var v:ventas);
begin
	readln(v.codigo);
	if(v.codigo <> (-1))then begin
		readln(v.numEvento);
		readln(v.dni);
		readln(v.cant);
	end;
end;
procedure agregarAdelante(var l:lista;v:ventas);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.venta:= v;
	nuevo^.sig:l;
	l:=nuevo;
end;
procedure cargarLista(var l:lista);
var
	v:ventas;
begin
	leerVenta(v);
	while(v.codigo <> (-1))do begin
		agregarAdelante(l,v);
		leerVenta(v);
	end;
end;
function masPares(num:integer):boolean;
var
	cantPares:integer;
	cantImpares:integer;
begin
	cantPares:= 0;
	cantImpares:= 0;
	while(num <> 0)do begin
		if(((num mod 10)mod 2)= 0)then
			cantPares:= cantPares + 1
		else
			cantImpares:= cantImpares + 1;
		num:= num div 10;
	end;
	masPares:= cantPares > cantImpares;
end;
procedure minEventos(var min1,min2:real;evMin1,evMin2:integer;cantVentas,evento:integer);
begin
	if(cantVentas < min1)then begin
		min2:=min1;
		evMin2:= evMin1;
		min1:= cantVentas;
		evMin1:= evento;
	end
	else if(cantVentas < min2)then begin
			min2:=cantVentas;
			evMin2:= evento;
	end;
end;
procedure eventosMinimos(vc:vVentas;v:vEventos);
var
	i:integer;
	evMin1,evMin2:integer;
	min1,min2:real;
begin
	for i:=1 to dimE do begin
		minEventos(min1,min2,evMin1,evMin2,vc[i],i);
	end;
	writeln('El nombre y lugar de los eventos con menos recaudación son ', v[evMin1].nombre, v[evMin1].lugar, v[evMin2].nombre, v[evMin2].lugar);
end;
procedure procesar(l:lista;v:vEventos;var vc:vVentas);
var
	l:lista;
	cantCondicion,cantPersonas:integer;
begin
	cantCondicion:=0;	
	cantPersonas:= 0;
	while(l<>nil)do begin
		vc[l^.venta.codigo]:= vc[l^.venta.codigo] + (l^.venta.cant * v[l^.venta.codigo].precio);	
		if(paresImpares(l^.venta.dni) AND (v[l^.venta.codigo].tipo = 3))then 
			cantCondicion:= cantCondicion + 1;

		if(l^.venta.codigo = 50)then
			cantPersonas:= cantPersonas + l^.venta.cant;
		l:= l^.sig;
	end;
	
	if(cantPersonas = v[50].capacidad)then
		writeln('El evento número 50 alcanzo la capacidad máxima');

	eventosMinimos(vc,v);

end;
var
	l:lista;
	vc:vVentas;
	v:vEventos;
begin
	l:nil;

	inicializarContador(vc);
	cargarEventos(v);
	procesar(l,v,vc);
end.


















