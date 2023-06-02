program aseguradora;
type
	lista=^nodo;
	cliente = record
		codigo:integer;
		dni:integer;
		apellido:string;
		nombre:string;
		poliza:integer;
		monto:real;
	end;
	nodo = record
		c:cliente;
		sig:lista;
	end;
procedure leerCliente(var cli:cliente);
begin
	writeln('Codigo');
	readln(cli.codigo);
	if(cli.codigo <> 2211)then begin
		writeln('Dni');
		readln(cli.dni);
		writeln('Apellido');
		readln(cli.apellido);
		writeln('Nombre');
		readln(cli.nombre);
		writeln('Poliza');
		readln(cli.poliza);
		writeln('Monto');
		readln(cli.monto);
	end;
end;
procedure agregarAdelante(var l:lista;cli:cliente);
var
	nuevo:lista;
begin
	new(nuevo);
	nuevo^.c:=cli;
	nuevo^.sig:= nil;
	if(l = nil)then l:=nuevo
	else begin
		nuevo^.sig:= l;
		l:=nuevo;
	end;
end;
procedure cargarLista(var l:lista);
var
	cli:cliente;
begin
	leerCliente(cli);
	while(cli.codigo <> 2211)do begin
		agregarAdelante(l,cli);
		leerCliente(cli);
	end;
end;
function montoAdicional(poliza:integer):real;
begin
	case poliza of
		1: montoAdicional:= 200;
		2: montoAdicional:= 300;
		3: montoAdicional:= 500;
		4: montoAdicional:= 1000;
		5: montoAdicional:= 2000;
		6: montoAdicional:= 3000;
	end;
end;
function dniDigito(dni:integer):boolean;
var
	cant9:integer;
begin
	cant9:=0;
	while(dni <> 0)do begin
		if((dni mod 10) = 9)then cant9:= cant9 + 1;
		dni:= dni div 10;
	end;
	dniDigito:= (cant9 >=2);
end;
procedure eliminarCliente(var l:lista;cod:integer);
var
	act,ant:lista;
begin
	act:= l;
	while((act <> nil)AND(act^.c.codigo <> cod))do begin
		ant:=act;
		act:=act^.sig;
	end;
	if(act <> nil)then begin
		if(act = l)then
			l:=l^.sig
		else 
			ant^.sig:=act^.sig;
		dispose(act);
	end;
end;
procedure procesarInformar(l:lista);
begin
	while(l<>nil)do begin
	writeln('------');
	writeln('');
		writeln(l^.c.nombre);
		writeln(l^.c.apellido);
		writeln(l^.c.dni);
		writeln((l^.c.monto + montoAdicional(l^.c.poliza)):4:2);
	writeln('');
	writeln('');
		if(dniDigito(l^.c.dni))then begin
			writeln('correcto');
			writeln(l^.c.nombre);
			writeln(l^.c.apellido);
		end;
	writeln('');
		l:=l^.sig;	
	writeln('------');
	end;
end;
var
	l:lista;
begin
	l:=nil;
	cargarLista(l);
	procesarInformar(l);
end.









