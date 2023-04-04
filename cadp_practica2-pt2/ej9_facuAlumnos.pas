program facuAlu;
procedure menorApellido(Inum:integer;var min1,min2:integer;apellido:string;var apmin1,apmin2:string);
begin
    if(Inum < min1)then begin
        min2:= min1;
        min1:= Inum;
        apmin2:= apmin1;
        apmin1:= apellido;
    end
    else if(Inum < min2)then begin
        min2:= Inum;
        apmin2:= apellido;
    end;
end;
procedure mayorNombre(Inum:integer;var max1,max2:integer;nombre:string;var nmmax1,nmmax2:string);
begin
    if(Inum > max1)then begin
        max2:= max1;
        max1:= Inum;
        nmmax2:= nmmax1;
        nmmax1:= nombre;
    end
    else if(Inum > max2)then begin
        max2:= Inum;
        nmmax2:= nombre;
    end;
end;
procedure InscripcionesPares(Inum:integer;var InsPares:integer);
begin
    if(Inum mod 2 = 0)then 
        InsPares:= InsPares + 1;    
end;
var 
    nombre,apellido,nmmax1,nmmax2,apmin1,apmin2:string;
    insNum,min1,min2,max1,max2,alPares:integer;
    alumnos,insPare:real;
begin
    min1:= 32767;
    max1:= -32768;
    alumnos:= 0;
    alPares:= 0;
    apmin1:= '';apmin2:='';
    nmmax1:= '';nmmax2:='';

    repeat
        writeln('Ingrese el nombre del alumno: ');
        readln(nombre);
        writeln('Ingrese el apellido del alumno: ');
        readln(apellido);
        writeln('Ingrese el número de inscripción del alumno: ');
        readln(insNum);

        menorApellido(insNum,min1,min2,apellido,apmin1,apmin2);
        mayorNombre(insNum,max1,max2,nombre,nmmax1,nmmax2);
        InscripcionesPares(insNum,alPares);
        alumnos:= alumnos + 1;
        
    until (insNum=1200);

    insPare:= ((100/alumnos)*alPares);

    writeln('Los apellidos con número de inscripción más chico son: ', apmin1, ' y ', apmin2);
    writeln('Los nombres con número de inscripción más alto son: ', nmmax1, ' y ', nmmax2);
    writeln('El porcentaje de alumnos con número de inscripción par es: ',insPare:3:2,'%');
end.