program test;
const 
	dimLugares = 100;
	dimAnios = 50;
type
	range1 = 1 .. dimLugares;
	range2 = 1 .. dimAnios;

	vectorLugares = array [range1] of real;
	vectorAnios = array [range2] of vectorLugares;
procedure cargarPromedios(var v:vectorAnios);
var
	i,k:integer;
begin
	for i:= 1 to dimAnios do 
		for k:=1 to dimLugares do begin 
			writeln('Ingrese la temperatura promedio del lugar ',k,' en el ',i,'° año');	
			v[i][k]:=random(abs(100));
			writeln('Temperatura: ',v[i][k]:3:2);
		end;
end;
function MaxMundialProm(v:vectorAnios):integer;
var
	i,k,maxMundial:integer;
	sumaMundial,promMundial,max:real;
begin
	max:= -32768;
	for i:=1 to dimAnios do begin
		sumaMundial:= 0;
		for k:=1 to dimLugares do begin
			sumaMundial:= v[i][k] + sumaMundial;
		end;
		promMundial:= sumaMundial / dimLugares;
		if(max < promMundial)then begin
			max:= promMundial;
			maxMundial:= i;
		end;
	end;
	maxMundialProm:= maxMundial;
end;
function temperaturaMaxima(v:vectorAnios):integer;
var
	i,k,max:integer;
	maxAnio,maxLugar:real;
begin
	maxAnio:= -32768;
	maxLugar:= -32768;
	for i:=1 to dimAnios do begin
		for k:=1 to dimLugares do begin
			if(maxLugar < v[i][k])then
				maxLugar:= v[I][k]
		end;
		if(maxAnio < maxLugar)then begin
			maxAnio:= maxLugar;
			max:= i;
		end;
	end;
	temperaturaMaxima:= max;
end;

var
	vA:vectorAnios;
begin
	cargarPromedios(vA);
	writeln('El año con un promedio mundial de temperatura más alto fue el año ', maxMundialProm(vA));
	writeln('El año con la mayor temperatura detectada en el planeta en estos 50 años fue el: ',temperaturaMaxima(vA),'°');
end.

