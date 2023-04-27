program ej2;
type 
	vector = array [1 .. 4] of integer;
procedure leer(var v:vector;df:integer);
var
	i:integer;
begin
	for i:=1 to df do begin
		writeln('leer: ');
		readln(v[i]);
	end;
end;
procedure moduloA(v:vector;dl:integer);
var
	m,i:integer;
begin
	m:= dl div 2;

	for i:= 1 to m do
		write('[',v[m-i+1],'] ');

	writeln('');

	for i:= 1 to m do
		write('[',v[m+i],'] ');
end;
var
	v:vector;
	d:integer;
begin
	d:= 4;
		
	leer(v,d);
	moduloA(v,d);
	writeln('');
end.
