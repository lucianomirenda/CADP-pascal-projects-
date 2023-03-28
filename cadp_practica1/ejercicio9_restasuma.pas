program restaSuma;
var
    signo:char;
    resultado,numUsuario:integer;
begin
    
    writeln('Ingrese un signo + o -:');
    read(signo);

    if(signo = '+')
    then begin
        resultado:=0;
        writeln('Ingrese los números que desea sumar: ');
        readln(numUsuario);
        while(numUsuario<>0) do
        begin
            resultado:= resultado + numUsuario;
            readln(numUsuario);
        end;
    end
    else if(signo = '-')
        then begin
            writeln('Ingrese los números que desea restar: ');
            readln(numUsuario);
            resultado:=numUsuario;
            readln(numUsuario);
            while(numUsuario<>0) do
            begin
                resultado:= resultado - numUsuario;
                readln(numUsuario);
            end;
            
        end
        else
            writeln('ERROR');
    
    if ((signo = '+') OR (signo = '-'))
    then
        writeln('Su resultado es: ',resultado);
end.