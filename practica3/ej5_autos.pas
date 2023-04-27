program concesionaria;
type
	auto = record
		marca:string;
		modelo:string;
		precio:real;
	end;
	caro = record
		max:real;
		marcaCara:string;
		modeloCaro:string;
	end;
	prom = record
		cantA:integer;
		suma:real;
	end;
procedure leerA(var a:auto);
begin
	with a do begin
		writeln('Ingrese el modelo del auto: ');
		readln(modelo); 
		writeln('Ingrese el precio del auto: ');
		readln(precio);
	end;
end;
procedure masCaro(var mc:caro; a:auto);
begin
	if(mc.max < a.precio)then begin
		mc.max:= a.precio;
		mc.marcaCara:= a.marca;
		mc.modeloCaro:= a.modelo;
	end;
end;
function promedio(p:prom):real;
begin
	promedio:= (p.suma) / (p.cantA);
end;
procedure analisisXmarca(a:auto;var mc:caro; p:prom);
var
	actual:string;
begin
	writeln('Ingrese la marca del auto: ');
	readln(a.marca);
	while(a.marca <> 'zzz')do begin
		p.suma:= 0;
		p.cantA:= 0;
		actual:= a.marca;
		while(a.marca = actual)do begin
			leerA(a);
			p.cantA:= p.cantA + 1;
			p.suma:= p.suma + a.precio;
			masCaro(mc,a);
			writeln('Ingrese la marca del auto: ');
			readln(a.marca);
		end;
		writeln('------------------------------------------------');
		writeln('El promedio de ', actual,' es ', promedio(p):4:2);
		writeln('------------------------------------------------');
	end;
end;
var 
	car:auto;
	maximo:caro;
	pr:prom;
begin
	analisisXmarca(car,maximo,pr);
	writeln('------------------------------------------------');
	writeln('La marca y modelo más caro es: ', maximo.marcaCara,', ', maximo.modeloCaro);	
	writeln('------------------------------------------------');
end.
