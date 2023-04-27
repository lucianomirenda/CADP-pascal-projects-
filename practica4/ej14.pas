program ej14;
const
	size = 1000;	
type 
	rangCod = 1 .. size;
	infoDev = record
		pais:string;
		codigo:rangCod;
		nameP:string;
		rol:integer;
		hs:integer;
	end;
	infoCont = record
		arq:integer;
		monto:real
	end;
	vCont = array [rangCod] of infoCont;

procedure inicializarCont(var v:vCont);
var
	i:integer;
begin
	for i:=1 to size do begin
		v[i].arq:= 0;
		v[i].monto:= 0;
	end;
end;
procedure leerDev(var dev:infoDev;cod:integer);
begin
	dev.codigo:=cod;
	writeln('PAIS: ');
	readln(dev.pais);	
	writeln('PROYECTO: ');
	readln(dev.nameP);	
	writeln('ROL: ');
	readln(dev.rol);	
	writeln('HORAS TRABAJADAS: ');
	readln(dev.hs);	
end;
function montoAnalisis(hs:integer;rol:integer):real;
begin
	case rol of
		1: montoAnalisis:= hs * 35.20;
		2: montoAnalisis:= hs * 27.45;
		3: montoAnalisis:= hs * 31.03;
		4: montoAnalisis:= hs * 44.28;
		5: montoAnalisis:= hs * 39.87;
	end;
end;
procedure devAnalisis(var vc:vcont;var montoArg:real;var hsBase:integer);
var
	cod:integer;
	infD:infoDev;
	monto:real;
begin
	writeln('CODIGO: ');
	readln(cod);
	
	while(cod <> (-1))do begin
		leerDev(infD,cod);	

		monto:= montoAnalisis(infD.hs,infD.rol);
		{sumo el monto en el proyecto correspondiente}
		vc[cod].monto:= monto + vc[cod].monto;
		{sumo el monto si el desarrollador es argentino}	
		if(infD.pais = 'Argentina')then
			montoArg:= montoArg + monto;

		{cuento si hay un arquitecto en el proyecto}
		if(infD.rol = 4)then
			vc[cod].arq:= vc[cod].arq + 1;

		{Cuento las horas si su rol era en base de datos}
		if(infD.rol = 3)then
			hsBase:= hsBase + infD.hs;

		writeln('CODIGO: ');
		readln(cod);
	end;
	
end;
function menorMonto(vc:vCont):integer;
var
	i,minI:integer;
	min:real;
begin
	min:= 32767;
	for i:= 1 to size do
		if(min > vc[i].monto)then begin
			min:= vc[i].monto;
			minI:= i;	
		end;
			
	menorMonto:= minI;
end;
procedure cantArquitectos(vc:vCont);
var
	i:integer;
begin
	for i:=1 to size do	
		writeln('La cantidad de arquitectos en el proyecto ', i,' es: ',vc[i].arq);

end;
var
	vectorC:vCont;
	montoTotalArg:real;
	hsBaseDatos:integer;
begin
	montoTotalArg:= 0;
	hsBaseDatos:= 0;
	inicializarCont(vectorC);	
	devAnalisis(vectorC,montoTotalArg,hsBaseDatos);


	writeln('El monto total invertido en desarrolladores argentinos es ', montoTotalArg:3:2,'$');
	writeln('Las horas en total de todos los administradores de bases de datos es: ', hsBaseDatos);
	cantArquitectos(vectorC);
	writeln('El código del proyecto con menor monto es ', menorMonto(vectorC));

end.
