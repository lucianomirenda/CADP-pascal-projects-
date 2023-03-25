program ejemplo;
var 
    numero,cant: integer;
begin
    cant:=0;
    read(numero);
    while(numero <> 0) do
    begin
        if(numero > 5) then
            cant:= cant+1;
        read(numero);
    end;
    writeln('La cantidad de números mayore que 5 es: ', cant);
end.