program mayorNumero;
var 
    i,position,max,num:integer;
begin
    max:= (-32768);

    for i:=1 to 10 do
    begin
        readln(num);

        if(num > max)
        then
        begin
            max:=num;
            position:=i;
        end;
    end;

    writeln('El mayor número leido fue: ', max,', en la posición: ', position);

end.