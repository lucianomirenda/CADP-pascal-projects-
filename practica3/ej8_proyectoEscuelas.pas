program proyectosEscuelas;
type
	doc = record
		nomyape:string;
		dni:integer;
		mail:string;
	end;
	proyecto = record
		codigo: integer;
		titulo:string;
		docente:doc;
		cantAlu:integer;
		escuela:string;
		local:string;
	end;
	cantle = record
		cantL:real;
		cantE:real;
	end;
	maxAlu = record
		max1:integer;
		max2:integer;
		maxAlu1:integer;
		maxAlu2:integer;
		cantAluMax:integer;
	end;
procedure leerD(var d:doc);
begin
	with d do begin
		readln(nomyape);
		readln(dni);
		readln(mail);
	end;
end;
procedure leerP(var p:proyecto);
begin
	with p do begin
		readln(codigo);
		readln(titulo);
		leerD(docente);
		readln(cantAlu);
		readln(escuela);
		readln(local);
	end;
end;
function promedio(num1:real;num2:real):real;
begin
	promedio:= num1 / num2;
end;
function parImpar(p:proyecto):boolean;
var
	cantI,cantP:integer;
begin
	cantP:= 0;
	cantI:= 0;
	while(p.codigo <> 0)do begin
		if(((p.codigo mod 10)mod 2) = 0)then
			cantP:= cantP + 1
		else
			cantI:= cantI + 1;
		p.codigo:= p.codigo div 10;
	end;

	parImpar:= (cantP = cantI);
end;
function daiCondition(p:proyecto):integer;
begin
	if((p.local = 'daireaux') AND parImpar(p))then
		daiCondition:= 1
	else
		daiCondition:= 0;
end;
procedure maxEscuela(var m:maxAlu;a2:string);
begin
	if(m.cantAluMax > m.max1)then begin
		m.max2:= m.max1;
		m.max1:= m.cantAluMax;
		m.maxAlu2:= m.maxAlu1;
		m.maxAlu1:= a2;
	end
	else if(m.cantAluMax > m.max2)then begin
		m.max2:= m.cantAluMax;
		m.maxAlu2:= a2;
	end;
end;
begin

end.
























