PROGRAM pr_11_13;
uses crt;
CONST n=3; d=4;
TYPE s= string[n];
     sptr = ^s;
     ar= array [1..d+1] of sptr;
VAR arptr: ar;
    str: string;
    i, j, counter: longint;
    error: integer;
    mem: longint;
BEGIN
clrscr;
mem:=memavail;
writeln('Available memory: ', mem);
for i:=1 to d do
  begin
    getmem(arptr[i], n+1);
    repeat
    writeln('Input ', i,' line: ');
    readln(str);
    until ord(str[0])<=n;
    arptr[i]^:=str;
  end;

writeln;

for i:=1 to d do
writeln(arptr[i]^);

writeln;

repeat
write('i = ');
readln(str);
val(str, i, error);
until (error=0) and (i>=1) and (i<=d);

repeat
write('j = ');
readln(str);
val (str, j, error);
until (error=0) and (i>=1) and (i<=d);

str:=arptr[j]^;

getmem(arptr[d+1], n+1);
arptr[d+1]^:='';

for counter:=0 to d-1-i do
arptr[d+1-counter]^:=arptr[d-counter]^;

arptr[i+1]^:=str;

writeln;

for i:=1 to d+1 do
writeln(arptr[i]^);

for i:= 1 to d+1 do
  begin
    freemem(arptr[i], n+1);
    arptr[i]:=nil;
  end;

writeln;
mem:=memavail;
writeln('Available memory: ',mem);

readln;

END.