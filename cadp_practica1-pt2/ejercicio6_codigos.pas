program productosBaratos;
type 
    codigos= 1 .. 200;
var 
    codigo:codigos;
    min1,min2,precio:real;
    i,codigoPar,barato1,barato2:integer;
begin 
    codigoPar:= 0;
    min1:= 32767;
    min2:= 32767;
    barato1:= -1;
    barato2:= -1;

    for i:=1 to 10 do
    begin
        writeln('Escriba el código: ');
        readln(codigo);
        writeln('Escriba el precio: ');
        readln(precio);

        if(precio < min1)
        then begin
            min2:=min1;
            min1:=precio;
            barato2:=barato1;
            barato1:=codigo;
        end
        else if(precio < min2)
            then begin
                min2:=precio;
                barato2:=codigo;
            end;

        if((precio > 16) AND ((codigo mod 2)=0))
        then begin
            codigoPar:= codigoPar+1;
        end;
    end;

    writeln('Los dos productos más baratos son: ',barato1,' y ',barato2);
    writeln('Los productos con precio mayor a 16 pesos y con codigos pares son: ', codigoPar);

end.