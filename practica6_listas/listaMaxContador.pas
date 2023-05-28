program listaMax;
const
	dMax = 10;
type
	lista = ^nodo;
	nodo = record
		n:integer;
		sig:lista;
	end;
	range = 1 .. dMax;
	maximos = array[range] of integer;
procedure inicializarMax(var v:maximos);
var
	i:integer;
begin
	for i:=1 to dMax do
		v[i]:= -32768;
end;
procedure agregarAdelante(var l:lista;num:integer);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.n:= num;
	nuevo^.sig:= nil;
	if(l = nil)then l:= nuevo
	else begin
		nuevo^.sig:= l;
		l:= nuevo;
	end;
end;
procedure cargarLista(var l:lista);
var
	n:integer;
begin
	writeln('Ingresa un número');
	readln(n);
	while(n <> 0)do begin
		agregarAdelante(l,n);
		writeln('Ingresa un número');
		readln(n);
	end;
end;
procedure contMax(var vc:maximos;n:integer);
var
	i,j:integer;
begin
	j:=1;
	while((j<=dMax)AND(vc[j] > n))do 
		j:= j+1;
	if(j<=dMax)then begin
		for i:= (dMax-1) downto j do
			vc[i+1]:= vc[i];
		vc[j]:= n;
	end;
end;
procedure sacarMaximos(l:lista;var vc:maximos);
begin
	while(l<>nil)do begin
		contMax(vc,l^.n);
		l:= l^.sig;
	end;
end;
procedure imprimirMax(v:maximos);
var
	i:integer;
begin
	writeln('');
	for i:=1 to dMax do
		write('[',v[i],'] ');
	writeln('');
end;
var
	l:lista;
	vc:maximos;
begin
	l:=nil;
	cargarLista(l);	
	sacarMaximos(l,vc);
	imprimirMax(vc);	
end.

