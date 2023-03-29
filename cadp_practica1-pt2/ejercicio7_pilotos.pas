program pilotos;
var
    i,seg,minutos,horas,segmax1,segmax2,segmin1,segmin2:integer;
    piloto,priPiloto,segPiloto,ultPiloto,anteUltPiloto:string;
begin
    segmin1:=32767;
    segmin2:=32767;
    segmax1:= (-32768);
    segmax2:= (-32768);

    ultPiloto:='';
    anteUltPiloto:='';
    priPiloto:='';
    segPiloto:='';

    for i:=1 to 4 do
    begin
        writeln('Nombre el piloto: ');
        readln(piloto);
        writeln('Horas que tardo en terminar la carrera: ');
        readln(horas);
        writeln('Minutos que tardo en terminar la carrera: ');
        readln(minutos);
        writeln('Segundos que tardo en terminar la carrera: ');
        readln(seg);
        
        seg:= (seg + (minutos*60) + (horas*3600));

        if(seg > segmax1)then begin
            segmax2:=segmax1;
            segmax1:=seg;
            anteUltPiloto:=ultPiloto;
            ultPiloto:=piloto;
        end
        else if(seg > segmax2)then begin
                segmax2:=seg;
                anteUltPiloto:= piloto;
        end;

        if(seg < segmin1)then begin
            segmin2:= segmin1;
            segmin1:= seg;
            segPiloto:= priPiloto;
            priPiloto:= piloto;
        end
        else if(seg < segmin2)then begin
            segmin2:= seg;
            segPiloto:= piloto;
        end;    
    end;

    writeln('El piloto en primer lugar es: ',priPiloto);
    writeln('El piloto en segundo lugar es: ',segPiloto);
    writeln('El piloto en ante ultimo lugar es: ',anteUltPiloto);
    writeln('El piloto en ultimo lugar es: ',ultPiloto);

end. 