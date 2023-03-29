program notasAlumnos;
type
    notas = 0 .. 10;
var 
    aprobados7,aprobados8:integer;
    alumno:string;
    nota:notas;
begin
    aprobados7:= 0;
    aprobados8:= 0;

    repeat
        readln(alumno);
        readln(nota);

        if(nota >=8)
        then
            aprobados8:= aprobados8 + 1
        else if(nota = 7)
            then
                aprobados7:= aprobados7 + 1;

    until(alumno = 'zidane zinedine');

    writeln('Los alumnos aprobados con 7 son: ', aprobados7,' y los aprobados con 8 o más son: ',aprobados8);

end.