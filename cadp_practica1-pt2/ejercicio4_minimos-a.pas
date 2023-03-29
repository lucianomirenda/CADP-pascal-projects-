program milnumeros;
var 
    num,min1,min2:integer;
begin 
    min1:=32767;
    min2:=32767;

    repeat
        read(num);
        
        if(num<min1)
        then begin
            min2:=min1;
            min1:=num;
        end
        else if(num<min2)
        then begin
            min2:= num;
            end;
            
    until (num = 0);

    writeln('los dos números minimos son: ',min1,' y ',min2);

end. 