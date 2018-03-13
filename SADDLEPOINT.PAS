program probl_4;
 uses crt;
 type ar=array[1..100,1..100] of real;
 var a:ar; i, j, j_min, k, z, m, n, l, counter, error:integer;
     min,max:real; c:char; s: string;

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



 for i:=1 to m do begin
  writeln;
  for j:=1 to n do
   write(a[i,j]:4);
  end;

  writeln;
  counter:=0;

  for i:=1 to m do
   begin

    min:=a[i,1];
    k:=i+1;
    j_min:=1;
    for j:= 2 to n do
     if min>a[i,j] then
      begin
       min:=a[i,j];
      j_min:=j;
       k:=j+i;
       end;

    max:=a[1,j_min];
    z:=i+j_min;

    for l:=2 to m do
     if max<a[l,j_min] then
      begin
       max:=a[l,j_min];
       z:=l+j_min;
      end;

      writeln;

    if (max=min) and (z=k) then
     begin
      writeln('Saddle point {row ',(k-j_min),' ,column ',j_min,'} is ',max:4);
      counter:=counter+1;
     end;


  end;

  if counter=0 then writeln('Saddle point in this array does"nt exist.');

   readln;
   end.




