program empresasCultivos;
const
	dimCultivos = 20;
type
	rangeCultivos = 1 .. dimCultivos;

	cultivos = record
		tipo:string;
		hect:integer;
		meses:integer;
	end;

	vCultivos = array[rangeCultivos] of cultivos;

	empresa = record
		codigo:integer;
		nombre:string;
		propiedad:string;
		ciudad:string;
		cultivo:vCultivos;
		dl:integer;
	end;

	lista = ^nodo;
	
	nodo = record
		emp:empresa;
		sig:lista;
	end;
procedure leerCultivo(var c:cultivos);
begin
	readln(c.hect);
	if(c.hect <> 0)then begin
		readln(c.tipo);
		readln(c.meses);
	end;
end;
procedure leerVectorCultivos(var v:vCultivos;var dl:integer);
var
	aux:cultivos;
begin
	leerCultivo(aux);
	dl:=0;
	while((dl < dimCultivos)AND(aux.hect <> 0))do begin
		dl:= dl + 1;
		v[dl]:= aux;
		leerCultivo(aux);
	end;
end;
procedure leerEmpresa(var e:empresa);
begin
	readln(e.codigo);
	if(e.codigo <> (-1))then begin
		readln(e.nombre);
		readln(e.propiedad);
		readln(e.ciudad);
		leerVectorCultivos(e.cultivo,e.dl);
	end;
end;
procedure agregarAdelante(var l:lista;e:empresa);
var
	nuevo:lista;
begin
	new(nuevo);	
	nuevo^.emp:= e;
	nuevo^.sig:= l;
	l:= nuevo;
end;
procedure cargarLista(var l:lista);
var
	e:empresa;
begin
	leerEmpresa(e);
	while(e.codigo <> (-1))do begin
		agregarAdelante(l,e);
		leerEmpresa(e);
	end;
end;
function dosCeros(num:integer):boolean;
var
	cant:integer;
begin
	cant:=0;
	while(num <> 0)do begin
		if((num mod 10) = 0)then
			cant:= cant + 1;
		num:= num div 10;
	end;
	dosCeros:= cant >= 2;
end;
procedure maxMaiz(var max:integer;var maxEmp:string;meses:integer;nombre:string);
begin
	if(meses > max)then begin
		max:= meses;
		maxEmp:=nombre;
	end;
end;
procedure incrementoMes(e:empresa;var c:cultivos);
begin
	if((e.propiedad <> 'Estatal')AND(c.tipo = 'Girasol')AND(c.hect < 5))then
		c.meses:= c.meses + 1;
end;
procedure ProcesarLista(l:lista); 
var
	max,hectTotal,hectSoja,i:integer;
	maxEmp:string;
begin
	max:= -32768;
	hectTotal:=0;
	hectSoja:=0;
	while(l <> nil)do begin
		i:= 1;
		while(i <= l^.emp.dl)do begin
			if(l^.emp.ciudad = 'San Miguel Del Monte') AND (l^.emp.cultivo[i].tipo = 'Trigo') AND (dosCeros(l^.emp.codigo))then
				writeln(l^.emp.nombre);

			hectTotal:= hectTotal + l^.emp.cultivo[i].hect;

			if(l^.emp.cultivo[i].tipo = 'Soja')then
				hectSoja:= hectSoja + l^.emp.cultivo[i].hect;
		
			if(l^.emp.cultivo[i]. tipo = 'Maiz')then
				maxMaiz(max,maxEmp,l^.emp.cultivo[i].meses,l^.emp.nombre);
		
			incrementoMes(l^.emp,l^.emp.cultivo[i]);
		end;
	end;
	writeln('El procentaje de hectareas de soja con respecto al total es de: ', ((100/hectTotal)*hectSoja));
	writeln('La empresa que dedica más tiempo al cultivo de maiz es: ',maxEmp);
end;
var
	l:lista;
begin
	l:=nil;
	cargarLista(l);
	procesarLista(l);
end.





































