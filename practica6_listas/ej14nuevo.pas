program ej14;
const
	df = 1300;
	dCont = 5;
type 
	rangeCont = 1 .. dCont;
	rangeDias = 1 .. 31;
	rangeAlumnos = -1 .. df;

	lista = ^nodo;

	viaje = record
		facultad:string;
		dias:rangeDias;
		medio:rangeCont;
	end;

	nodo = record
		pasaje:viaje;	
		sig:lista;
	end;

	vAlu = array[rangeAlumnos] of lista;

	vcont = array[rangeCont] of integer;
procedure crearListas(var v:vAlu);
var
	i:integer;
begin
	for i:=1 to df do begin
		v[i]:= nil;
	end;
end;
procedure initContador(var vc:vcont);
var 
	i:integer;
begin
	for i:=1 to dCont do
		vc[i]:= 0;
end;
procedure leerViaje(var v:viaje);
begin
		writeln('Ingrese al facultad');
		readln(v.facultad);
		writeln('Ingresa el día');
		readln(v.dias);
		writeln('Ingresa el medio de transporte: 1. cole 2. cole2 3. tren 4. tren2 5. bici');
		readln(v.medio);
end;
procedure insertarViajeOrdenado(var l:lista;v:viaje);
var
	ant,act,nuevo:lista;
begin
	new(nuevo);
	nuevo^.pasaje:= v;
	act:= l;
	ant:= l;
	while((act <> nil)AND(v.dias > act^.pasaje.dias))do begin
		ant:= act;
		act:= act^.sig;
	end;
	if(act = ant)then
		l:=nuevo
	else 
		ant^.sig:=nuevo;
	nuevo^.sig:=act;
end;
procedure cargarVector(var v:vAlu);
var
	p:viaje;
	codigo:integer;
begin
	writeln('Ingresa el código de alumno');
	readln(codigo);
	leerViaje(p);
	while(codigo <> 0)do begin
		insertarViajeOrdenado(v[codigo],p);
		leerViaje(p);
		writeln('Ingresa el código de alumno');
		readln(codigo);
	end;
end;
function gastosPorViaje(transporte:integer):real;
begin
	case transporte of 
		1: gastosPorViaje:= 50; 
		2: gastosPorViaje:= 50;
		3: gastosPorViaje:= 20;
		4: gastosPorViaje:= 25;
		5: gastosPorViaje:= 0;
	end;
end;
procedure maxTransporte(var max1,max2,medio1,medio2:integer;cantUsos,medio:integer);
begin
	if(cantUsos > max1)then begin
		max2:=max1;
		medio2:=medio1;
		max1:=cantUsos;
		medio1:=medio;	
	end
	else if(cantUsos > max2)then begin
		max2:= cantUsos;
		medio2:= medio;
	end;
end;
procedure procesamientoViajesVector(v:vAlu;var vc:vcont);
var
	max1,max2,medio1,medio2,cantViajesDia,cant6viajes,cantGasto,cantCombo,actualDia,i:integer;
	gasto:real;
	bici,otro,mas6viajes:boolean;
begin
	max1:= -32768;
	cant6viajes:=0;
	cantGasto:=0;
	cantCombo:=0;
	for i:=1 to df do begin
		gasto:=0;
		bici:=false;otro:=false;mas6viajes:=false;
		while(v[i] <> nil)do begin
			actualDia:= v[i]^.pasaje.dias;
			cantViajesDia:=0;
			while((v[i] <> nil)AND(v[i]^.pasaje.dias = actualDia))do begin
				vc[v[i]^.pasaje.medio]:= vc[v[i]^.pasaje.medio] + 1; 
				cantViajesDia:= cantViajesDia + 1;
				gasto:= gastosPorViaje(v[i]^.pasaje.medio) + gasto;
				if(v[i]^.pasaje.medio = 5)then bici:=true;
				if(v[i]^.pasaje.medio <> 5)then otro:=true;
				v[i]:= v[i]^.sig;
			end;
			if(cantViajesDia > 6)then mas6viajes:= true;
		end;
		if(mas6viajes)then cant6viajes:= cant6viajes + 1;
		if(gasto > 80)then cantGasto:= cantGasto + 1;
		if(bici and otro)then cantCombo:= cantCombo + 1;
	end;

	for i:=1 to dCont do
		maxTransporte(max1,max2,medio1,medio2,vc[i],i);

	writeln('La cantidad de alumnos que hacen más de 6 viajes son: ', cant6viajes);
	writeln('La cantidad de alumnos que gasta más de 80$ son: ',cantGasto);
	writeln('La cantidad de alumnos que combinan con la bici son: ',cantCombo);
	writeln('Los transporte más usados son ',medio1,' y ',medio2);
end;
var
	v:vAlu;
	vc:vcont;
begin
	crearListas(v);
	cargarVector(v);
	initContador(vc);
	procesamientoViajesVector(v,vc);
end.
