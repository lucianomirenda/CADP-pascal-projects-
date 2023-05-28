program contadorMax;
const 
	dfV = 10;
	dfMax = 5;
type
	rangeV = 1 .. dfV;
	rangeMax = 1 .. dfMax;
	
	vector = array[rangeV] of integer;
	vMax = array[rangeMax] of integer;
procedure imprimirVectores(v:vector;vM:vMax);
var
	i:integer;
begin
	writeln('');
	for i:=1 to dfV do 
		write('[',v[i],'] ');
	writeln('');
	for i:=1 to dfMax do 
		write('[',vM[i],'] ');
	writeln('');
end;
procedure cargarVector(var v:vector);
var
	i:integer;
begin
	for i:= 1 to dfV do begin
		writeln('Escribe un número');
		readln(v[i]);
	end;
end;
procedure inicializarMaximos(var v:vMax);
var
	i:integer;
begin
	for i:=1 to dfMax do begin
		v[i]:= -32768;
	end;
end;
procedure insertar(var v:vMAx;position:integer;valor:integer);
var
	i:integer;
begin
	for i:=(dfMax-1) downto position do 
		v[i+1]:=v[i];
	v[position]:= valor;
end;
procedure ordenarMax(v:vector;var vM:vMax);
var
	i,j:integer;
begin
	for i:=1 to dfV do begin
		j:=1;
		while(j <= dfV)AND(vM[j] > v[i])do 
			j:= j + 1;
		if(j <= dfV)then
			insertar(vM,j,v[i]);
		imprimirVectores(v,vM);
	end;
end;
var
	v:vector;
	vM:vMax;
begin
	inicializarMaximos(vM);
	cargarVector(v);	
	ordenarMax(v,vM);
	imprimirVectores(v,vM);
end.
