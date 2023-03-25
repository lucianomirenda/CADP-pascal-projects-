program circulo;
const 
    pi=3.1416;
var 
    diametro,radio:real;
begin
    writeln('Ingrese el diámetro del circulo: ');
    read(diametro);

    radio:= diametro/2;

    writeln('El radio del circulo es: ', radio:5:2);
    writeln('El área del circulo es: ', ((radio*radio)*pi):5:2);
    writeln('El perímetro del circulo es: ', (diametro*pi):5:2);


end.