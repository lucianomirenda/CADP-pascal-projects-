program alu400;
const
	size = 4;
type 
	range = 1 .. size;
	alumnos = record
		nro:integer;
		dni:integer;
		ape:string;
		nom:string;
		ano:integer;
	end;
	infoA = array [range] of alumnos;
procedure leerAlu(var alu:alumnos);
begin
	writeln('Ingresa el numero de inscripción: ');
	readln(alu.nro);
	writeln('Ingresa el dni del alumno: ');
	readln(alu.dni);
	writeln('Ingresa el apellido del alumno : ');
	readln(alu.ape);
	writeln('Ingresa el nombre del alumno: ');
	readln(alu.nom);
	writeln('Ingresa el año de nacimiento del alumno: ');
	readln(alu.ano);
	writeln('-----------------------------------------');
end;
procedure cargar(var v:infoA);
var
	i:integer;
begin
	for i:=1 to size do
		leerAlu(v[i]);
end;
function dniPares(v:infoA):integer;
var
	d,i,cant:integer;
	esPar:boolean;
begin
	cant:=0;
	for i:= 1 to size do begin
		esPar:= true;
		while(v[i].dni <> 0)do begin
			d:= v[i].dni mod 10;
			if(d mod 2 = 1)then
				esPar:= false;
			v[i].dni:= v[i].dni div 10;  
		end;
		if(esPar)then
			cant:= cant + 1;
	end;
	dniPares:= cant;
end;
function porcentaje(v:infoA):real;
begin
	porcentaje:= (100/size)*dniPares(v);
end;
procedure mayoresEdades(v:infoA;var min1,min2:integer;var nomEdad1,nomEdad2,apEdad1,apEdad2:string);
var
	i:integer;
begin
	for i:=1 to size do begin
		if(min1 > v[i].ano)then begin
			min2:= min1;
			min1:= v[i].ano;
			nomEdad2:= nomEdad1;
			nomEdad1:= v[i].nom;
			apEdad2:= apEdad1;
			apEdad1:= v[i].ape;
		end
		else if(min2 > v[i].ano)then begin
				min2:= v[i].ano;
				nomEdad2:= v[i].nom;
				apEdad2:= v[i].ape;
			end;
	end;
end;
var
	min1,min2:integer;
	nombre1,nombre2,apellido1,apellido2:string;
	vector:infoA;
begin
	min1:= 32767;
	cargar(vector);
	mayoresEdades(vector,min1,min2,nombre1,nombre2,apellido1,apellido2);

	writeln('El porcentaje de alumnos con un dni de solo digitos pares es: ', porcentaje(vector):3:2,'%');
	writeln('El nombre y apellido de los alumnos con mayor edad son ', nombre1,' ', apellido1, ' y ', nombre2, ' ', apellido2);

end.
