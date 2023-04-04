program falsoAbsoluto;
var
    i,num:integer;
    var1,var2:boolean;
begin
    var1:= true;

    for i:=1 to 5 do
    begin
        read(num);
        var2:= num > 0;
        if not(var2)then
            var1:= false;
    end;

    if(var1)
    then
        writeln('Todos lo números son positivos')
    else
        writeln('No todos los números son positivos');


end.