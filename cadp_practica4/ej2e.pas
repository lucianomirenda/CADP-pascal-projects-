program ej2;
type 
	vector = array [1 .. 10] of integer;
procedure leer(var v:vector;df:integer);
var
	i:integer;
begin
	for i:=1 to df do
		v[i]:= i;
end;
procedure moduloA(v:vector;x,y:integer);
var
	i:integer;
begin
	if(x < y)then begin
		y:= y div 2;
		
		for i:=x to y do 
			write('[',v[y-i+x],'] ');
		
		writeln('');

		for i:=x to y do
			write('[',v[y+i],'] ');

	end
	else 
		begin
			for i:=y to x do 
				write('[',v[x-i+y],'] ');
		end;
end;
var
	v:vector;
	d,x,y:integer;
begin
	d:= 10;

	writeln('x: ');
	read(x);
	writeln('y: ');
	read(y);
		
	leer(v,d);
	moduloA(v,x,y);
	writeln('');
end.
