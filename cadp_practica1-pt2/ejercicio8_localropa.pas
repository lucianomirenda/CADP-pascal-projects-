program localRopa;
var 
    monto,suma:real;
    i,ventas:integer;
begin
    suma:=0;
    ventas:=0;

    for i:=1 to 5 do begin

        writeln('Ingrese el monto: ');
        readln(monto);

        while(monto <> 0)do begin
            suma:=suma+monto;
            ventas:=ventas+1;
            writeln('Ingrese el monto: ');
            readln(monto);
        end;
    end;

    writeln('La cantidad de ventas totales es: ', ventas);
    writeln('La suma total de las ventas es: ',suma:6:2);

end.