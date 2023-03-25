program kiosqueroGloton;
var 
    clientes,caramelos,sobras,cociente:integer;
    cobro:real;
begin
    writeln('Ingrese la cantidad caramelos');
    read(caramelos);
    writeln('Ingrese la cantidad de clientes');
    read(clientes);

    sobras:= caramelos mod clientes;
    cociente:= caramelos div clientes;

    cobro:= cociente*clientes*1.60;

    writeln('La cantidad de caramelos para cada cliente es: ', cociente);
    writeln('Te sobran ', sobras,' caramelos');
    writeln('La suma total a cobrar es de: ',cobro:5:2);


end.

{Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, 
dividiendo cantidades iguales entre todos los clientes. 
Los que le sobren se los quedará para él. a. 
Realice un programa que lea la cantidad de caramelos que posee el kiosquero 
(X), la cantidad de clientes (Y), e imprima en pantalla un mensaje 
informando la cantidad de caramelos que le corresponderá a cada cliente, 
y la cantidad de caramelos que se quedará para sí mismo. b. 
Imprima en pantalla el dinero que deberá cobrar el kiosquero si 
cada caramelo tiene un valor de $1.60}