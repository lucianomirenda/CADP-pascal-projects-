program sumPares;
procedure parImpar(digito:integer;var impar,sumPar:integer);
begin
    if(digito mod 2 = 0)then
        sumPar:= sumPar + digito
    else
        impar:= impar + 1;
end;
procedure digitosParesImpares(num:integer;var impares,sumPares:integer);
var 
    dig:integer;
begin
    impares:= 0;
    sumPares:= 0;
    while(num <> 0)do begin
        dig:=num mod 10;
        parImpar(dig,impares,sumPares);
        num:= num div 10;
    end;
end;
var 
    numero,sumaPares,cantImp:integer;
begin
    writeln('Ingrese un número: ');
    readln(numero);
    while(numero <> 12345)do begin
        digitosParesImpares(numero,cantImp,sumaPares);
        writeln('La suma de sus digitos pares es: ', sumaPares);
        writeln('La cantidad de digitos impares que posee es: ', cantImp);
        readln();
        writeln('Ingrese un número: ');
        readln(numero);
    end;
end.