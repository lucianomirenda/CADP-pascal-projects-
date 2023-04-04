program ej6;
procedure parMasAlto;
var 
    num,parMax:integer;
begin
    parMax:= (-32768);
    readln(num);

    while(num >= 0)do begin
        if((num > parMax) AND (num mod 2 = 0))then
            parMax:=num;
        readln(num);
    end;
    writeln(parMax);
end;
begin
    parMasAlto;
end.