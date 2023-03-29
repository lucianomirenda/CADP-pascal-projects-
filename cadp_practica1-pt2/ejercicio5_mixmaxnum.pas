program maxminsuma;
var 
    num,min,max,suma:integer;
begin 
    min:=32767;
    max:=(-32768);
    suma:= 0;

    repeat
        readln(num);
        suma:=suma+num;

        if(num > max) then
            max:=num;
        if(num < min) then
            min:=num;

    until (num=100);

    writeln('El número máximo ingresado fue: ', max);
    writeln('El número mínimo ingresado fue: ',min);
    writeln('La suma de todos lo números es: ',suma);

end. 