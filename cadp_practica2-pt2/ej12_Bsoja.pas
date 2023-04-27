program ARBA;
const
	precio=320;
function rendimiento(ha:real;zn:integer):real;
begin
	case zn of
		1: rendimiento:= (precio * 6 * ha);
		2: rendimiento:= (precio * 2.6 * ha);
		3: rendimiento:= (precio * 1.4 * ha);
	end;
end;
procedure mayorRendimiento(local:string;rend:real;var max:real;var maxRendLocal:string);
begin 
	if(rend > max)then begin
		max:=rend;
		maxRendLocal:=local;
	end;
end;
procedure menorRendimiento(local:string;rend:real;var min:real;var minRendLocal:string);
begin 
	if(rend < min)then begin
		min:=rend;
		minRendLocal:=local;
	end;
end;
var
	min,max,rendProm,rendTotal,ha,rend:real;
	tdf,cantCamp,zn:integer;
	local,maxRendLocal,minRendLocal:string;
begin
	
	min:= 32768;
	max:= -32767;
	maxRendLocal:= ' ';
	minRendLocal:= ' ';
	cantCamp:= 0;
	tdf:= 0;
	rendTotal:=0;


	Repeat

		writeln('Introduzca la  localidad');
		readln(local);	
		writeln('Introduzca las hectareas');
		readln(ha);	
		writeln('Introduzca la  zona: ');
		readln(zn);	
	
		rend:= rendimiento(ha,zn);

		if((local='Tres de Febrero') AND (rend > 10000))then
			tdf:= tdf+1;

		mayorRendimiento(local,rend,max,maxRendLocal);
		menorRendimiento(local,rend,min,minRendLocal);

		rendTotal:= rendTotal + rend;
		cantCamp:= cantCamp + 1;

	Until((local = 'Saladillo') AND (ha=900));

	rendProm:= (rendTotal / cantCamp);

	writeln('La localidad con mayor rendimiento fue: ', maxRendLocal);
	writeln('La localidad con menor rendimiento fue: ', minRendLocal);
	writeln('La localidad de Tres De Febrero supero en ',tdf,' los 10.000$ de rendimiento. ');
	writeln('el rendimiento promedio es de: ',rendProm:5:2,'$');




end.
