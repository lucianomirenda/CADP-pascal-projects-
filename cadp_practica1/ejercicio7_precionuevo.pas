program productos;
var 
    codigo:integer;
    precio,precioNuevo:real;
begin
    repeat
        read(codigo);
        read(precio);
        read(precioNuevo);

        if(precioNuevo >= (precio+((precio/100)*10))) 
        then 
            writeln('El aumento del precio del producto ', codigo, ' es superior al 10%')
        else
            writeln('El aumento del precio del producto ', codigo,' no supera el 10%');

    until (codigo = 32767);
    
end.