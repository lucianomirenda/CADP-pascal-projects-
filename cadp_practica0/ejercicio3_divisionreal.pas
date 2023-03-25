program divisionReal;
var
    num1,num2,cociente:real;
begin
    writeln('Ingrese el divisior: ');
    read(num1);
    writeln('Ingrese el dividendo: ');
    read(num2);

    cociente:= num2/num1;

    writeln('La división de ambos números da como resultado: ', cociente:1:2);
end.