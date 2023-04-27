program sojaExport;
function rendimiento(ha,precio:real;zona:integer):real;
begin
	case zona of
		1: rendimiento:= precio*(ha*6);
		2: rendimiento:= precio*(ha*2.6);
		3: rendimiento:= precio*(ha*1.4);
	end;
end; 
var
	rend,h,pcio:real;
	zn:integer;
begin
	
	writeln('Introduzca las hectareas: '); 
	readln(h);
	writeln('Introduzca la zona: ');
	readln(zn);
	writeln('Introduzca el precio: '); 
	readln(pcio);
	
	rend:= rendimiento(h,pcio,zn);

	writeln('Su rendimiento ha sido de: ',rend:4:2);

end.

