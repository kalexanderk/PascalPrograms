Program pr_9_23;
uses crt;
var t: text;
    i: word;
    number1, number2, res: integer;
    endpoint: integer;
    number1STR, number2STR, resSTR: string;
    lengthRES, lengthNUM1, lengthNUM2: integer;
    counter: integer;
    helpcount: integer;
    filename: string;

procedure blankspace(endpoint: integer);
  var i: integer;
  begin
    for i:=1 to endpoint do
    write(t,' ');
  end;  
  
procedure underscore(endpoint: integer);
  var i: integer;
  begin
    for i:=1 to endpoint do
    write(t,'_');
  end;  
  
    

BEGIN

clrscr;

{$I-}{$R-}
repeat
  write('Input 1 (integer) number to multiple: ');
  readln(number1);
  i:=ioresult;
  if i=26 then writeln('Type mismatch! Try again.');
until i=0;
repeat
  write('Input 2 (integer) number to multiple: ');
  readln(number2);
  if i=26 then writeln('Type mismatch! Try again.');
until i=0;
{$R+}{$I+}

res:=number1*number2;

{$I-}
 repeat 
   writeln('Input file name (file must be in the current directory!)');
   readln(filename);
   assign(t, 'filename.txt');
   i:=ioresult;
   if i<>0 then writeln('File not found. Try again, please.');
 until i=0;
{$I+}

rewrite(t);

str(number1, number1STR);
str(number2, number2STR);
str(res, resSTR);

lengthRES:=ord(resSTR[0]);
lengthNUM1:=ord(number1STR[0]);
lengthNUM2:=ord(number2STR[0]);

blankspace(3+lengthRES-lengthNUM1);
writeln(t, number1STR); {Wrote 1st number in the 1st line}

blankspace(3+lengthRES-lengthNUM2-2);
write(t, '*'); 
blankspace(1);
writeln(t, number2STR); {Wrote 2d number in the 2d line}

underscore(3+lengthRES);
writeln(t); {Wrote underscores in the 3d line}

str(number2, helpnumSTR);
helpnumber:=number2;
workNUMBER:=number2 mod 10;
intendation:=0;
for counter:=1 to lentghNUM2-1 do
  begin
    if worknumber=0 then
     begin
       space:=1; {space - 0 in previous line identifier}
       break;
     end  
    else
      begin
        lineNUM:=number1*worknumber;
        str(lineNUM, lineNUMSTR);
        lengthLINENUM:= length(lineNUMSTR);
        j:=length(lineNUMSTR);
        blankspace(3+lentghRES-intendaion-space-lengthLINENUM);
        writeln(t, lineNUMSTR);
        intendation:=intendation+1;
        space:=0;
      end;
    str(helpnumber, helpnumSTR);
    lengthHELPNUM:=ord(helpnumSTR[0]);
    divNUM:=exp(lengthHELPNUM * ln(10)); {Defined how to crop our helpnumber}
    helpnumber:= helpnumber div divNUM;
    workNUMBER:=helpnumber mod 10;
  end;
  
underscore(3+lengthRES);
writeln(t); 

for counter:=1 to 3 do write(t, ' ');
write(t, res);  

close(t);

end.
    


  


