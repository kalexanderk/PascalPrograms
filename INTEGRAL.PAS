program probl_7;
uses crt;
type func=function(x: real):real;
const a=0;
      b=6;
var 
 F: func;
 S1, S2, eps: real;
 s: string;
 err: integer;

{$F+}
function CurrentFunction(x:real):real;
begin
 CurrentFunction:=1/sqrt(1+x*x*x*x);
end;
{$F-}

procedure Integral(F: func; var S1, S2: real; a, b, eps: real);
 var i, n: integer;
 f1, f2: real;
 begin
  n:=10;

  repeat
  S1:=0;
  S2:=0;
   for i:=1 to n do
    begin
     f1:=F(a+(i-1)*((a+b)/n)) * ((a+b)/n);
     f2:=F(a+i*((a+b)/n)) * ((a+b)/n);
     S1:=S1+f1;
     S2:=S2+f2;
    end;
   n:=n+10;
  until abs(S1-S2)<eps; 
 end;

BEGIN 
 clrscr;

 repeat
  repeat
  write('Input eps: eps>0: ');
  readln(s);
  val(s, eps, err);
  until err=0;
 until eps>0;
 
 F:=CurrentFunction;
 Integral(F, S1, S2, a, b, eps);
 write((S2+S1)/2);
 readkey;

 end.
  