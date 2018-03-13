program probl_4;
 uses crt;
 type ar=array[1..100,1..100] of real;
 var a:ar; i, j, k_min, k_max, k, m, n, error:integer;
     t:real; c:char; s: string;

begin
 clrscr;
 randomize;

 repeat
  write('Input number of rows. M:= ');
  readln(m);
  write('Input number of columns. N:= ');
  readln(n);
 until (m>0) and (m<=100) and (n>0) and (n<=100);

 writeln('Do you want to input the array randomly? Input "Y" or "N".');
 readln(c);
 if upcase(c)='Y' then
  for i:=1 to m do for j:=1 to n do a[i,j]:=random*1876
  else
  for i:=1 to m do for j:=1 to n do
   repeat
    write('a[',i,',',j,'] = ');
    readln (s);
    val(s,a[i,j],error);
   until error=0;



 for i:=1 to m do 
  begin
   writeln;
   for j:=1 to n do
    write(a[i,j]:5);
  end;

  writeln;
  
  for i:=1 to m do
   for j:=1 to n do
    begin  
      if i mod 2 = 0 then 
       begin
        k_min:=j;
        for k:=j+1 to n do
         if a[i,k_min]>a[i,k] then
          k_min:=k;
        t:=a[i,j];
        a[i,j]:=a[i,k_min];
        a[i,k_min]:=t;
       end;
      
      if i mod 2 = 1 then
       begin
        k_max:=j;
        for k:=j+1 to n do
         if a[i,k_max]<a[i,k] then
          k_max:=k;
        t:=a[i,j];
        a[i,j]:=a[i,k_max];
        a[i,k_max]:=t;
       end;
    end;
    
  for i:=1 to m do 
  begin
   writeln;
   for j:=1 to n do
    write(a[i,j]:5);
  end;
    
 readln;
 end.