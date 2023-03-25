program transaccion;
const 
    dolarHoy=205.01;
var
    dolares,comision:real;
begin
    writeln('Ingrese la comisión del banco: ');
    read(comision);
    writeln('Ingrese el monton en dolares de la transferencia: ');
    read(dolares);

    writeln('El valor de la transferencia será de : ',(((dolares*dolarHoy)+(((dolares*dolarhoy)/100))*comision)):6:2,' ARS.');

end. 