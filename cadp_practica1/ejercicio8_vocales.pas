program vocales;
var 
    i:integer;
    vocal:char;
    esVocal,noVocal:boolean;
begin
    noVocal:=True;
    for i:= 1 to 3 do
    begin
        readln(vocal);
        esVocal:= ((vocal = 'a') OR (vocal = 'e') OR (vocal = 'i') OR (vocal = 'o') OR (vocal = 'u'));
        if not(esVocal)then begin
            noVocal:= false;
        end;
        
    end;
    
    if(noVocal)
    then
        writeln('Los tres caracteres son vocales')
    else   
        writeln('Al menos un caracter no es vocal');
end.

