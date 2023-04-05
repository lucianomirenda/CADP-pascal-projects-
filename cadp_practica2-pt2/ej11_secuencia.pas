program secuenciaEj11;
function noDolar(c:char):boolean;
begin
    noDolar:= (c <> '$');
end;
function tripleArroba(arroba:integer):boolean;
begin
    tripleArroba:= (arroba <= 3);
end;
procedure cumpleA(var long:integer;var cumple:boolean);
var 
    c:char;
begin
    readln(c);
    while((c <> '%') AND (cumple))do begin
        if(not noDolar(c))then
            cumple:= false
        else
            readln(c);
        long:= long + 1;
    end;
end;
procedure cumpleB(long:integer; var cumple:boolean);
var
    c:char;
    arroba,long2:integer;
begin
    long2:= 0;
    arroba:= 0;
    readln(c);
    
    while((c <> '*') AND (cumple))do begin
        long2:= long2 + 1;
        if(c = '@')then
            arroba:= arroba + 1;
        if (not tripleArroba(arroba)) then
            cumple:= false
        else
            readln(c);
    end;
    cumple:= (long = long2);
end;
var
    cumple:boolean;
    long:integer;
begin
    cumple:= true;
    long:= 0;
    writeln('Inserte una secuencia de caracteres distinta de "$" y finalice presionando "%"');
    cumpleA(long,cumple);
    if(cumple)then begin
        writeln('Inserte una secuencia de caracteres con un máximo de 3 arrobas y misma longitud que la secuencia anterior y finalice presionando "*"');
        cumpleB(long,cumple);
        if(cumple)then
            writeln('Se cumplio la secuencia')
        else
            writeln('No se cumplio la secuencia B');
    end
    else
        writeln('No se cumplio la secuencia A');
end.

