program ej2;
type 
	vector = array [1 .. 100] of integer;
procedure leer(var v:vector;df:integer);
var
	i:integer;
begin
	for i:=1 to df do
		v[i]:= i;
end;
function moduloA(v:vector;x:integer):integer;
var
	i:integer;
begin
	i:= 1;
	while((v[i] <> x) AND (i < 100))do
		i:= i + 1;
	
	if(v[i]=x)then
		moduloA:= i
	else
		moduloA:= -1;

end;
var
	v:vector;
	d,x,y:integer;
begin
	d:= 100;

	writeln('x: ');
	read(x);
		
	leer(v,d);
	writeln(moduloA(v,x));
	writeln('');
end.
