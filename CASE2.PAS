program pr3_23;
 uses crt;
 label 1;
 var eps, x, s, a: real;
    str, st: string;
    k, error: integer;
begin
clrscr;
writeln('Input x');
repeat
 begin
  write('x = ');
  readln(str);
  val(str,x,error);
  end;
until error=0;
writeln('Input eps');
1: repeat
 begin
  write('eps = ');
  readln(st);
  val(st,eps,error);
  end;
until error=0;
if eps>0 then
 begin
  s:=0;
  a:=-1;
  k:=0;
  while (abs(a)>=eps) do
   begin
    s:=s+a;
    a:=a*(-1/((2*k+1)*(2*k+2)))*sqr(sqr(x/3));
    k:=k+1;
   end;
   writeln('s = ',s);
 end
else
 begin
  writeln('eps is incorrect!');
  writeln('type in eps again!');
  goto 1;
 end;
 readln;
 end.

