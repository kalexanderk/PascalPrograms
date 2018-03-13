program pr_2_23;
uses crt;
var f, x, y: real;
s: string;
error:integer;
begin
clrscr;
repeat
begin
writeln (' Input x');
write ('x = ');
readln(s);
val(s,x,error);
end
until error=0;
repeat
begin
writeln (' Input y');
write ('y = ');
readln(s);
val(s,y,error);
end
until error=0;
if (x>0) and (x*y>1) then
 begin
 f:=(x+y)/(1-x*y);
 writeln ('f = ',f);
 end
else
begin
if x=0 then
begin
f:=(x*x-y)/(1-x*y);
writeln ('f = ',f);
end
else writeln('f does not exist');
end;
write ('Press Enter to Exit');
readln;
end.

