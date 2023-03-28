program vocales;
var 
    i:integer;
    vocal:char;
    esVocal:boolean;
begin
    esVocal:= True;
    for i:= 1 to 3 do
    begin
        readln(vocal);
        case vocal of
        'a': ;
        'e': ;
        'i': ;
        'o': ;
        'u': ;
        'A': ;
        'E': ;
        'I': ;
        'O': ;
        'U': ;
        else
            esVocal:=false;
        end;
    end;
    
    if(esVocal)
    then
        writeln('Los tres caracteres son vocales')
    else   
        writeln('Al menos un caracter no es vocal');

end.
