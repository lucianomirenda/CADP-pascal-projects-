program casamientos;
type
	casa = record
		dia,mes,ano:integer;
	end;
procedure leer(var ca:casa);
begin
	with ca do begin
		writeln('Ingrese el dia : ');
		readln(dia);
		writeln('Ingrese el mes : ');
		readln(mes);
		writeln('Ingrese el año : ');
		readln(ano);
	end;
end;
function casVerano(ca:casa):integer;
begin
	if(ca.mes <= 3)then 
		casVerano:= 1
	else
		casVerano:= 0;
end;
function casDiez(ca:casa):integer;
begin
	if(ca.dia <= 10)then 
		casDiez:= 1
	else
		casDiez:= 0;
end;
var
	cas:casa;
	cantD,cantV:integer;
begin
	cantD:= 0;
	cantV:= 0;

	leer(cas);

	while(cas.ano <> 2020)do begin
		cantV:= cantV + casVerano(cas);
		cantD:= cantD + casDiez(cas);
		leer(cas);
	end;

	writeln('Casamientos realizados en verano : ', cantV);
	writeln('Casamientos realizados en los primeros 10 dias de cada mes: ', cantD);
	
end.
