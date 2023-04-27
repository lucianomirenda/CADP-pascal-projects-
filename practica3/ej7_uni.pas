program centrosyunis;
type
	centroI = record
		nombre:string;
		uni:string;
		cantInv:integer;
		beca:integer;
	end;
	maximo = record
		max:integer;
		maxUni:string;
	end;
	minimo = record
		min1:integer;
		min2:integer;
		minCentro1:string;
		minCentro2:string;
	end;
procedure leerC(var c:centroI);
begin
	with c do begin
		writeln('Escriba el nombre del centro: ');
		readln(nombre);
		writeln('Escriba el nombre de la universidad: ');
		readln(uni);
		writeln('Escriba la cantidad de investigadores: ');
		readln(cantInv);
		writeln('Escriba la cantidad de becarios: ');
		readln(beca);
	end;
end;
procedure minBecas(c:centroI;var m:minimo);
begin
	if(c.beca < m.min1)then begin
		m.min2:= m.min1;
		m.min1:= c.beca;
		m.minCentro2:= m.minCentro1;
		m.minCentro1:= c.nombre;
	end
	else if(c.beca < m.min2)then begin
		m.min2:= c.beca;
		m.minCentro2:= c.nombre;
	end;
end;	
procedure maxInv(actual:string;var m:maximo;cantInv:integer);
begin
	if(cantInv > m.max)then begin
		m.max:= cantInv;
		m.maxUni:= actual;
	end;
end;
procedure analisisXcentro(c:centroI;var ma:maximo; var mi:minimo);
var
	actual:string;
	cantCentro,cantInvestigaciones:integer;
begin
	leerC(c);
	while(c.cantInv <> 0)do begin
		cantCentro:= 0;
		cantInvestigaciones:= 0;
		actual:= c.uni;
		while(c.uni = actual)do begin
			cantCentro:= cantCentro + 1;
			cantInvestigaciones:= cantInvestigaciones + c.cantInv;
			minBecas(c,mi);
			leerC(c);
		end;
		writeln('Los centros de investigacion de ',actual,' son: ',cantCentro);
		maxInv(actual,ma,cantInvestigaciones);
	end;
end;
var
	ma:maximo;
	c:centroI;
	mi:minimo;
begin
	ma.max:= (-32768);
	mi.min1:= 32767;

	analisisXcentro(c,ma,mi);

	writeln('La universidad con más investigaciones fue ', ma.maxUni);
	writeln('Los dos centros con menos becarios son: ', mi.minCentro1, ' y ', mi.minCentro2);
end.
