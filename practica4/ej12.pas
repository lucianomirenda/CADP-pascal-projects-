program ej12;
const
	size = 53;
	sizeCont = 4;
type
	range = 1 .. size;
	rangeCont = 1 .. sizeCont;
	
	cantV = array [rangeCont] of integer;
	
	infoGal = record
		nombre:string;
		tipo:integer;
		masa:real;
		pc:real;
	end;
	galaxias = array [range] of infoGal;
procedure inicializar(var vcont:cantV);
var
	i:integer;
begin
	for i:=1 to sizeCont do vcont[i]:= 0;
end;
procedure leerGalaxia(var g:infoGal);
begin
	writeln('Nombre: ');
	readln(g.nombre);
	writeln('');
	writeln('Tipo: 1.elíptica 2.espiral 3.lenticular 4.irregular');
	readln(g.tipo);
	writeln('');
	writeln('Masa: ');
	readln(g.masa);
	writeln('');
	writeln('PC: ');
	readln(g.pc);
	writeln('- ');
	writeln('');
end;
procedure cargarGalaxia(var vg:galaxias);
var
	i:integer;
begin
	for i:=1 to size do leerGalaxia(vg[i]);
end;
procedure contarTipos(vg:galaxias;var vcont:cantV);
var
	i:integer;
begin
	for i:=1 to size do 
		vcont[vg[i].tipo]:= vcont[vg[i].tipo] + 1;
end;
function porcentajeMasa(vg:galaxias):real;
var
	i:integer;
	suma,sumaTotal:real;
begin
	suma:= 0;sumaTotal:=0;
	for i:=1 to size do begin 
		if((vg[i].nombre = 'Via Lactea') OR (vg[i].nombre = 'Andromeda') OR (vg[i].nombre = 'Triangulo'))then suma:= vg[i].masa + suma;
		sumaTotal:= vg[i].masa + sumaTotal;
	end;
	porcentajeMasa:= (suma*100)/sumaTotal;
end;
function cantNoIrregulares(vg:galaxias):integer;
var
	i,cant:integer;
begin
	cant:=0;
	for i:=1 to size do begin
		if((vg[i].tipo <> 4) AND (vg[i].pc < 1000))then
			cant:= cant + 1;
	end;
	cantNoIrregulares:= cant;
end;
procedure mayorMenorMasa(vg:galaxias;var minI1,minI2,maxI1,maxI2:integer);
var
	i:integer;
	max1,max2,min1,min2:real;
begin
	max1:= -32768;	
	min1:= 32767;

	for i:=1 to size do begin
		if(vg[i].masa > max1)then begin
			max2:= max1;
			max1:= vg[i].masa;
			maxI2:= maxI1;
			maxI1:= i;
		end
		else if(vg[i].masa > max2)then begin
				max2:=vg[i].masa;
				maxI2:= i;
			end;
		if(vg[i].masa < min1)then begin
			min2:= min1;
			min1:= vg[i].masa;
			minI2:= minI1;
			minI1:= i;
		end
		else if(vg[i].masa < min2)then begin
				min2:= vg[i].masa;
				minI2:= i;
			end;
	end;
end;
var
	vectorG:galaxias;
	vectorCont:cantV;
	maxI1,maxI2,minI1,minI2:integer;
begin
	inicializar(vectorCont);	
	cargarGalaxia(vectorG);
	mayorMenorMasa(vectorG,minI1,minI2,maxI1,maxI2);
	contarTipos(vectorG,vectorCont);

	writeln('La cantidad de galaxias tipo Elíptica es: ', vectorCont[1]);
	writeln('La cantidad de galaxias tipo Espiral es: ', vectorCont[2]);
	writeln('La cantidad de galaxias tipo Lenticular es: ', vectorCont[3]);
	writeln('La cantidad de galaxias tipo Irregular es: ', vectorCont[4]);

	writeln('El porcentaje de masa de la Via Lactea, Andromeda y triangulo respecto a las demas galaxias es: ',porcentajeMasa(vectorG):3:2,'%');
	writeln('La cantidad de galaxias  No irregulares a menos de 1000 pc de distancia son: ', cantNoIrregulares(vectorG));
	writeln('Las galaxias con mayor masa son: ', vectorG[maxI1].nombre,' y ', vectorG[maxI2].nombre);
	writeln('Las galaxias con menor masa son: ', vectorG[minI1].nombre,' y ', vectorG[minI2].nombre);

end.
