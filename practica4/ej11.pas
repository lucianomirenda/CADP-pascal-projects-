program ej11;
const
	size = 3;
type
	range = 1..size;
	infoFoto = record
		titulo:string;
		autor:string;
		mg:integer;
		coments:integer;
		clics:integer;
	end;
	fotos = array [range] of infoFoto;
procedure leerFoto(var f:infoFoto);
begin
	writeln('Titulo: ');
	readln(f.titulo);
	writeln('Autor: ');
	readln(f.autor);
	writeln('Me gustas: ');
	readln(f.mg);
	writeln('Comentarios: ');
	readln(f.coments);
	writeln('Clics: ');
	readln(f.clics);
end;
procedure cargarFotos(var v:fotos);
var
	i:integer;
begin
	for i:=1 to size do
		leerFoto(v[i]);
end;
function popularFoto(v:fotos):integer;
var
	i,max,maxI:integer;
begin
	max:= -32768;
	for i:=1 to size do
		if(max < v[i].clics)then begin
			max:= v[i].clics;
			maxI:=i;
		end;
	popularFoto:= maxI;
end;
function mgArtVan(v:fotos):integer;
var
	i,cant:integer;
begin
	cant:=0;
	for i:=1 to size do
		if(v[i].autor = 'Art Vandelay')then
			cant:= cant + v[i].mg;

	mgArtVan:= cant;
end;
function comentariosTotales(v:fotos):integer;
var
	i,cant:integer;
begin
	cant:=0;
	for i:=1 to size do
		cant:= cant + v[i].coments;
	
	comentariosTotales:= cant;
end;
var
	vector:fotos;
begin
	cargarFotos(vector);
	writeln('El titulo de la foto más vista es: ',vector[popularFoto(vector)].titulo);
	writeln('La cantidad de likes en las fotos de Art Vandelay es: ',mgArtVan(vector));
	writeln('La cantidad de comentarios en todas las fotos es: ',comentariosTotales(vector));
end.
