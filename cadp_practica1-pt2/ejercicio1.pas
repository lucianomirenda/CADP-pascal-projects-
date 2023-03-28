program sumaEneros;
var 
    num,i,suma,may5:integer;
begin
    suma:=0;
    may5:=0;
    for i:=1 to 10 do
    begin
        readln(num);
        suma:= suma + num;
        if(num > 5)
        then
            may5:= may5 + 1;
    end;
    writeln('La suma es: ', suma);
    writeln('La cantidad de números mayores a 5 es: ', may5);
end.