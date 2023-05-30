program vectorCargar;
const
	df = 5;
type
	range = 1 .. df;
	vector = array[range] of integer;
procedure initVector(var v:vector);
var
	i:integer;
begin
	for i:=1 to df do 
		v[i]:= 10101;
end;
procedure imprimirVector(v:vector);
var 
	i:integer;
begin
	writeln('');
	for i:=1 to df do 
		write('[',v[i],'] ');
	writeln('');
		
end;
procedure cargarVector(var v:vector;var dl:integer);
var
	aux:integer;
begin
	dl:=0;
	readln(aux);
	while((dl < df) AND (aux <> 0))do begin
		dl:= dl + 1;
		v[dl]:= aux;
		imprimirVector(v);
		readln(aux);
	end;
	imprimirVector(v);
end;
procedure insertarVector(var v:vector;var dl:integer;var pude:boolean;position:integer;valor:integer);
var
	i:integer;
begin
	pude:=false;
	if((position >= 1)AND(position <= dl)AND(dl < df))then begin
		pude:=true;
		for i:=dl downto position do
			v[i+1]:= v[i];
		v[position]:= valor;
		dl:= dl + 1;
	end;
	imprimirVector(v);
end;
procedure eliminarVector(var v:vector;var dl:integer;var pude:boolean;position:integer);
var
	i:integer;
begin
	pude:=false;
	if((position >= 1)AND(position <= dl))then
		pude:=true;
		for i:=position to (dl-1) do 
			v[i]:= v[i+1];
		dl:= dl - 1;	
	end;
end;
var
	v:vector;
	dl,num,num2:integer;
	pude:boolean;
begin
	initVector(v);
	cargarVector(v,dl);
	writeln('Inserte una posicion donde quiere ingresar un número');
	readln(num);
	writeln('Ahora diga que número quiere insertar');
	readln(num2);
	insertarVector(v,dl,pude,num,num2);
	if(pude)then
		writeln('Se inserto')
	else 
		writeln('No pudo insertarse');
end.
