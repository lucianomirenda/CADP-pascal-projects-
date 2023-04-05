program secuenAB;
function esVocal (c:char):boolean;
begin
    esVocal:= (c = 'a') or (c = 'e') or (c = 'i') or (c = 'o') or (c = 'u') 
end;
function esAlfa(c:char):boolean;
begin
    esAlfa:= ((c >= 'b') AND (c <= 'z')) AND (NOT esVocal(c));
end;
procedure cumpleA(var cumple:boolean);
var
    c:char;
begin
    readln(c);
    while((c<>'$') AND (cumple))do
        if (not esVocal(c)) then
            cumple:=false
        else
            readln(c);
end;
procedure cumpleB(var cumple:boolean);
var
    c:char;
begin
    readln(c);
    while((c <> '#') AND (cumple)) do 
        if (not esAlfa(c))then
            cumple:=false
        else
            readln(c);
end;
var 
    cumple:boolean;
begin
    cumple:=true;
    writeln('Escriba una secuencia de vocales y termine presionando "$": ');
    cumpleA(cumple);
    if(cumple)then begin {secuencia A de vocales}
        writeln('Escriba una secuencia de letras que no sean vocales y termine presionando "#": ');
        cumpleB(cumple);
        if(cumple)then  {secuencia B de alfabeto}
            writeln('Se cumplio la secuencia completa')
        else
            writeln('No se cumplio la secuencia B');
    end
    else
        writeln('No se cumplio la secuencia A');
end.