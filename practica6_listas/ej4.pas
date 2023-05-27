program ej4;
type
	lista = ^nodo;
	nodo = record
		num:integer;
		sig:lista;
	end;
procedure armarNodo(var l:lista;v:integer);
var
	aux:lista;
begin
	new(aux);
	aux^.num:= v;
	aux^.sig:= nil;
	if(l = nil)then l:= aux
	else begin
		aux^.sig:= l;
		l:= aux;
	end;
end;
function maximo(l:lista):integer;
var
	max:integer;
begin
	max:= -32768;
	while(l <> nil)do begin
		if(l^.num > max)then max:= l^.num;
		l:=l^.sig;
	end;
	maximo:=max;
end;
function minimo(l:lista):integer;
var
	min:integer;
begin
	min:= 32767;
	while(l <> nil)do begin
		if(l^.num < min)then min:=l^.num;
		l:= l^.sig;	
	end;
	minimo:=min;
end;
function multiplo(l:lista;a:integer):integer;
var
	cant:integer;
begin
	cant:=0;
	while(l <> nil)do begin
		if(l^.num mod a = 0)then cant:= cant + 1;
		l:= l^.sig;
	end;
	multiplo:= cant;
end;
var
	l:lista;
	valor,m:integer;
begin
	l:=nil;
	writeln('Ingrese un número ');
	readln(valor);
	while(valor <> 0)do begin
		armarNodo(l,valor);
		writeln('Ingrese un número ');
		readln(valor);
	end;
	writeln('El número máximo es: ',maximo(l));
	writeln('El número mínimo es: ',minimo(l));
	writeln('Escribe un multiplo');
	readln(m);
	writeln('La cantidad de multiplos de ',m,' es: ',multiplo(l,m));

end.
