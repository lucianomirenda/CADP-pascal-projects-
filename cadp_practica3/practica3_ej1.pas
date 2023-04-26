program registros;
type
	alumno = record
		codigo: integer;
		nombre: string;
		promedio: real;
	end;
	maximo = record
		max: real;
		maxAlu: string;
	end;
procedure mejorPromedio(alu:alumno;var mx:maximo);
begin
	if(alu.promedio > mx.max)then begin
		mx.max:= alu.promedio;
		mx.maxAlu:= alu.nombre;
	end;
end;
var
	a:alumno;
	m:maximo;
	cant:integer;
begin
	m.max:= -32768;
	m.maxAlu:= ' ';
	cant:= 0;
	writeln('Ingrese el código de alumno: ');
	readln(a.codigo);
	writeln('Ingrese el nombre del alumno: ');
	readln(a.nombre);
	writeln('Ingrese el promedio del alumno: ');
	readln(a.promedio);
	
	while(a.codigo <> 0)do begin
		mejorPromedio(a,m);
		cant:= cant + 1;
		writeln('Ingrese el código de alumno: ');
		readln(a.codigo);
		if(a.codigo <> 0)then begin
			writeln('Ingrese el nombre del alumno: ');
			readln(a.nombre);
			writeln('Ingrese el promedio del alumno: ');
			readln(a.promedio);
		end;
	end;

	writeln('La cantidad de alumnos ingresados fue: ', cant);
	writeln('El alumno con mayor promedio fue: ', m.maxAlu);

end.
