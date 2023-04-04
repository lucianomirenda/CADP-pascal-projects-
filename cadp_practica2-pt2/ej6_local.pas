program tiendaDeRopa;
procedure barato(codigo:integer;precio:real;var prod1, prod2:integer;var min1, min2:real);
begin
    if(precio < min1)then begin
        min2:=min1;
        min1:=precio;
        prod2:=prod1;
        prod1:=codigo;
    end
    else if(precio < min2)then begin
        min2:=precio;
        prod2:=codigo;
    end;
end;
procedure caro(codigo:integer;precio:real;var max1:real;var Pcaro:integer);
begin
    if(precio > max1)then begin
        max1:= precio;
        Pcaro:= codigo;
    end;
end;
var 
    i,cod,prod1,prod2,codCaro:integer;
    suma,precio,promedio,min1,min2,max1:real;
    tipo:string;
begin
    min1:= 32767;
    min2:= 32767;
    max1:= (-32768);
    suma:=0;

    for i:=1 to 5 do begin
        writeln('Introduzca el código del producto: ');
        readln(cod);
        writeln('Introduzca el precio del producto: ');
        readln(precio);
        writeln('Introduzca el tipo de producto: ');
        readln(tipo);
        
        barato(cod,precio,prod1,prod2,min1,min2);
        if(tipo = 'pantalon')then
            caro(cod,precio,max1,codCaro);

        suma:= suma + precio;
    end;

    promedio:= (suma/5);

    writeln('Los codigos de los producos más baratos son: ', prod1,' y ',prod2);
    writeln('El pantalon más caro es: ', codCaro);
    writeln('El precio promedio es: $',promedio:6:2);

end.


