program test7.pas;
type
	lista = ^nodo;
	autos = record
		marca:string;
		color:string;
	end;
	nodo = record
		dato:autos;
		next:lista;
	end;
procedure crearlista(var l:lista);
begin
	l:=nil;
end;
procedure agregarAdelante(var l:lista;car:autos);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dato:= car;
	nuevo^.next:= nil;

	if(l = nil)then l := nuevo
	else begin
		nuevo^.next:= l;
		l:= nuevo;
	end;
end;
procedure agregarFinal(var l:lista;car:autos);
var
	nuevo,aux:lista;
begin
	new(nuevo); 
	nuevo^.dato:= car;
	nuevo^.next:= nil;

	if(l = nil)then l:= nuevo
	else begin
		aux:=l;
		while(aux^.next <> nil)do
			aux:= aux^.next;
		aux^.next:= nuevo;
	end;
end;
procedure agregarFinal2(var l,z:lista;a:autos);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.dato:= a;
	nuevo^.next:=nil;

	if(l = nil)then l:= nuevo
	else 
		z^.next:= nuevo;		
		
	z:=nuevo;
end;
procedure leerAuto(var a:autos;colour:string);
begin
	a.color:= colour;
	writeln('marca: ');
	readln(a.marca);
end;
procedure cargarlista(var l:lista);
var
	a:autos;
	color:string;
	z:lista;
begin
	writeln('color: ');
	readln(color);
	while(color <> 'red')do begin
		leerAuto(a,color);
		agregarFinal2(l,z,a);
		writeln('color: ');
		readln(color);	
	end;
end;
procedure recorrer(l:lista);
begin
	while(l <> nil)do begin
		if(l^.dato.color = 'azul')then
			writeln('AZUL');
		l:= l^.next;
	end;
end;
var
	l:lista;
begin
	crearlista(l);
	cargarlista(l);
	recorrer(l);
end. 

