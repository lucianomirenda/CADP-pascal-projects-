program ordenado;
type
	lista = ^nodo;
	nodo = record
		n:integer;
		sig:lista;
	end;
procedure imprimirLista(l:lista);
begin
	writeln('');
	while(l<>nil)do begin
		write('[',l^.n,'] ');
		l:=l^.sig;
	end;
	writeln('');
end;
procedure agregarAdelante(var l:lista;num:integer);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.n:=num;
	nuevo^.sig:=nil;
	if(l = nil)then 
		l:=nuevo
	else begin 
		nuevo^.sig:=l;
		l:=nuevo;
	end;
end;
procedure cargarLista(var l:lista);
var
	num:integer;
begin
	writeln('Ingrese un número');
	readln(num);
	while(num<>0)do begin
		agregarAdelante(l,num);
		imprimirLista(l);
		writeln('Ingrese un número');
		readln(num);
	end;
end;
procedure eliminarTodos(var l:lista;num:integer);
var
	ant,act:lista;
begin
	act:=l;
	while(act <> nil)do begin
		if(act^.n <> num)then begin
			ant:=act;
			act:=act^.sig;
		end
		else begin
			if(act = l)then begin
				l:= l^.sig;
				dispose(act);
				act:=l;
			end
			else begin  
				ant^.sig:= act^.sig;
				dispose(act);
				act:=ant;
			end;
		end;
	end;
	imprimirLista(l);
end;
procedure eliminarLista(var l:lista);
var
	num:integer;
begin
	writeln('Ingrese un número a eliminar');
	readln(num);
	while(num<>0)do begin
		eliminarTodos(l,num);
		imprimirLista(l);
		writeln('Ingrese un número a eliminar');
		readln(num);
	end;
end;
var
	l:lista;
	e:integer;
begin
	l:=nil;
	cargarLista(l);
	eliminarLista(l);
	
end.
