program procesadores;
type
	pro = record
		marca:string;
		linea:string;
		core:integer;
		ghz:integer;
		nm:integer;
	end;
	promax = record
		max1:integer;
		max2:integer;
		maxMarca1:string;
		maxMarca2:string;
	end;
	mghz = record
		cantIn:integer;
		cantAmd:integer;
	end;
procedure leerP(var p:pro);
begin
	with p do begin
		writeln('Marca del procesador: ');
		readln(marca);
		writeln('Linea del procesador: ');
		readln(linea);
		writeln('Core del procesador: ');
		readln(core);
		writeln('Ghz del procesador: ');
		readln(ghz);
		writeln('Nanometros del procesador: ');
		readln(nm);
	end;
end;
procedure p2core22nm(p:pro);
begin
	if((p.core > 2) and (p.nm <= 22))then
		writeln('Mas de 2 cores con a lo sumo 22 nm ', p.marca,', ', p.linea);
end;
procedure p14(p:pro;var p14cant:integer);
begin
	if(p.nm = 14)then
		p14cant:= p14cant + 1;
end;
procedure intelAmd(p:pro;var cgh:mghz);
begin
	if((p.marca = 'intel') AND (p.core > 1) AND (p.ghz >= 2))then
		cgh.cantIn:= cgh.cantIn + 1
	else if((p.marca = 'amd') AND (p.core > 1) AND (p.ghz >= 2))then
		cgh.cantAmd:= cgh.cantAmd + 1;
end;
procedure p14max(var pm:promax;actual:string;p14cant:integer);
begin
	if(p14cant > pm.max1)then begin
		pm.max2:= pm.max1;
		pm.max1:= p14cant;
		pm.maxMarca2:= pm.maxMarca1;
		pm.maxMarca1:= actual;
	end
	else if(p14cant > pm.max2)then begin
		pm.max2:= p14cant;
		pm.maxMarca2:= actual;
		end;
end;
procedure analisisProcesadores(p:pro;var pm:promax;var c:mghz);
var
	actual:string;
	p14cant:integer;
begin
	leerP(p);
	while(p.core <> 0)do begin
		actual:= p.marca;
		p14cant:= 0;
		while(actual = p.marca)do begin
			p2core22nm(p);
			p14(p,p14cant);
			intelAmd(p,c);
			leerP(p);
		end;
		p14max(pm,actual,p14cant);
	end;
end;
var 
	p:pro;
	pm:promax;
	c:mghz;
begin
	pm.max1:= (-32768);
	pm.max2:= (-32768);
	c.cantIn:= 0;
	c.cantAmd:= 0;
	
	analisisProcesadores(p,pm,c);
	writeln('Las dos marcas con mayor cantidad de procesadores con transistores de 14 nanometros son',pm.maxMarca1,' y ',pm.maxMarca2);
	writeln('Los procesadores multicore con 2ghz o más marca intel son: ',c.cantIn,' y marca AMD: ', c.cantAmd);
end.
























	
