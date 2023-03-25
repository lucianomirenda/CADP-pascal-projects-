program naturales;
var
	num,max:integer;
begin
	read(num);
	max:= num;
	while(num <> 0)do
	begin
		if(num > max)then
			max:=num;
		read(num);
	end;
	writeln('');
	writeln('El mayor número es: ', max);
end.
