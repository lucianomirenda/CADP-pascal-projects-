program insertarOrdenado;
type
	lista = ^nodo;
	nodo = record
		dato:integer;
		sig:lista;
	end;
procedure imprimirLista(l:lista);
begin
	while(l<>nil)do begin
		write('[',l^.dato,']');
		l:= l^.sig;
	end;
end;
procedure insertarOrdenado(var l:lista;d:integer);
var
	act,ant,nuevo:lista;
begin
	writeln('Se crea un espacio en memoria "Nuevo"');
	new(nuevo);
	writeln('Se le asigna al espacio "Nuevo" el valor: ',d);
	nuevo^.dato:= d;
	
	act:= l;
	ant:= l;

	if(l <> nil)then begin
		writeln('act:= l (', l^.dato,')');
		writeln('ant:= l (', l^.dato,')');
		write('¿act(',act^.dato,') <> nil');
		writeln(' Y ',d,' es mayor que act^.dato(',act^.dato,')?');
	end else begin
		writeln('act:= l (NIL)');
		writeln('ant:= l (NIL)');
		write('¿act(NIL) <> nil');
		writeln(' Y ',d,' es mayor que act^.dato(NIL)?');
	end;

	while((act <> nil)and(d < act^.dato))do begin
		writeln('true');
		writeln('ant(',ant^.dato,'):= act (',act^.dato,')');
		ant:= act;
		if(act^.sig <> nil)then
			writeln('act(',act^.dato,'):= act^.sig(',act^.sig^.dato,')')
		else
			writeln('act(',act^.dato,'):= act^.sig(NIL)');
		act:= act^.sig;
		if(act <> nil)then begin
			write('¿act(',act^.dato,') <> nil');
			writeln(' Y ',d,' es mayor que act^.dato(',act^.dato,')?');
		end else begin
			write('¿act(NIL) <> nil');
			writeln(' Y ',d,' es mayor que act^.dato(NIL)?');
		end;
	end;
	writeln('false');
	if(act<>nil)then begin
		writeln('¿act(',act^.dato,') = ant(',ant^.dato,')?');
	end else begin
		if(ant <> nil)then
			writeln('¿act(NIL) = ant(',ant^.dato,')?')
		else
			writeln('¿act(NIL) = ant(NIL)?');
	end;
	if(act = ant)then begin
		writeln('True');
		if(l<>nil)then
			writeln('l(',l^.dato,'):= nuevo(',nuevo^.dato,')')
		else
			writeln('l(NIL):= nuevo(',nuevo^.dato,')');
		l:=nuevo;
	end else begin
		writeln('false');		
		if(ant^.sig <> nil)then
		writeln('ant(',ant^.dato,')^.sig(',ant^.sig^.dato,'):= NUEVO(',nuevo^.dato,')')
		else 
			writeln('ant(',ant^.dato,')^.sig(NIL):= NUEVO(',nuevo^.dato,')');
		ant^.sig:= nuevo;
	end;
	if(nuevo^.sig <> nil)then
		writeln('nuevo^.sig(',nuevo^.sig^.dato,'):= act(',act^.dato,')')
	else if(act <> nil)then
		writeln('nuevo^.sig(NIL):= act(',act^.dato,')')
		else
		writeln('nuevo^.sig(basura):= act(NIL)');
	nuevo^.sig:= act;
	
	imprimirLista(l);
	writeln('');
	writeln('-------------------------------------------');

end;
procedure cargarLista(var l:lista);
var
	n:integer;
begin
	writeln('Escribe un número: ');
	readln(n);
	while(n <> 0)do begin
		insertarOrdenado(l,n);
		writeln('Escribe un número: ');
		readln(n);
	end;
end;
function estaOrdenada(l:lista):boolean;
var
	ant:lista;
	esta:boolean;
begin
	esta:=true;
	while((l<> nil)AND(l^.sig <> nil)AND(esta))do begin
		ant:= l;
		esta:= (ant^.dato <= l^.sig^.dato) OR (ant^.dato >= l^.sig^.dato);
		l:= l^.sig;
	end;
	estaOrdenada:= esta;
end;
var
	l:lista;
begin
	l:=nil;
	cargarLista(l);
	imprimirLista(l);
	writeln('');
	writeln(estaOrdenada(l));
end.
