program pr_1_23;
uses crt;
var a1, a2, a3, a4, max, min, z: real;
s: string;
error: integer;
begin
clrscr;
repeat
begin
writeln ('Input a1');
write (' a1 = ');
readln (s);
val (s, a1, error);
end;
until error=0;
repeat
begin
writeln ('Input a2');
write (' a2 = ');
readln (s);
val (s, a2, error);
end;
until error=0;
if a1<a2 then
 begin
 min:=a1;
 max:=a2;
 end
else
 begin
 min:=a2;
 max:=a1;
 end;
z:=sqrt(min+a1*a1+a2*a2);
if (z<>0) then
begin
a3:=(max*max+exp(a2)*sin(a1))/z;
writeln('a3 = ', a3);
end
else
writeln('a3 does not exist');
if a1<>0 then
 begin
a4:=ln(abs(a1))-sqr(sin(a2)/cos(a2))*sin(a1);
writeln('a4 = ',a4);
 end
 else writeln ('a4 does not exist');
write ('Press ENTER to Exit') ;
readln;
end.


