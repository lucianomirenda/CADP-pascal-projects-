program localRopa;
var 
    monto,suma:real;
    i,ventasTotales,ventasDia,dia,max:integer;
begin
    suma:=0;
    ventasTotales:=0;
    max:= (-32768);

    for i:=1 to 5 do begin

        writeln('Ingrese el monto: ');
        readln(monto);
        ventasDia:=0;

        while(monto <> 0)do begin
            suma:=suma+monto;
            ventasDia:= ventasDia + 1;
            ventasTotales:=ventasTotales+1;
            writeln('Ingrese el monto: ');
            readln(monto);
        end;

        if(ventasDia > max)then begin
            max:= ventasDia;
            dia:= i;
        end;

    end;

    writeln('La cantidad de ventas totales es: ', ventasTotales);
    writeln('La suma total de las ventas es: ',suma:6:2);
    writeln('El día con más ventas fue el ',dia,' del mes');

end.