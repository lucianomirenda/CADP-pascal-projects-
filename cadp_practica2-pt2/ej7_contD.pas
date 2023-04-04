program conD;
procedure digysuma(num:integer;var cantDig, sumDig:integer);
var 
    dig:integer;
begin  
    cantDig:=0;
    sumDig:=0;
    while(num <>0)do begin
        dig:= num mod 10;
        cantDig:= cantDig + 1;
        sumDig:= dig + sumDig;
        num:= num div 10;
    end;
end;
var 
    num,cantD,sumaD,totalD:integer;
begin
    totalD:= 0;

    repeat
        writeln('Ingrese un número: ');
        readln(num);
        digysuma(num,cantD,sumaD);
        totalD:= cantD + totalD;
    until (sumaD = 10);

    writeln('La cantidad total de digitos de los números ingresados son: ', totalD);
end.
