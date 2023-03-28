program mayorNumero;
var 
    i,max,num:integer;
begin
    max:= (-32768);

    for i:=1 to 10 do
    begin
        readln(num);

        if(num > max)
        then
            max:=num;
    end;

    writeln('El mayor número leido fue: ', max);

end.