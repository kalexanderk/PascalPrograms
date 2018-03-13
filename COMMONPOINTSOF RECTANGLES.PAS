program plobl_6;
 uses crt;
 type ar=array[1..100,1..100] of byte;
     ar_l=array[1..10000] of byte;
 var a:ar_l; 
     b, c, d:ar;
     min_x, max_x, min_y, max_y, S, S_b : longint; 
     k, i, j, n, N_k, error: integer;
     str: string;
     
  procedure zero(mx_x, mn_x, mx_y, mn_y: longint; var arr: ar);
   var i, j: byte;
  begin
   for j:=mn_x to mx_x do
    for i:= mx_y downto mn_y do
     arr[j,i]:=0;
  end;   
  
  procedure check(count: integer; mx_x, mn_x, mx_y, mn_y: longint; a: ar_l; var arr: ar);
   var i, j: byte;
  begin
   for j:=min_x to max_x do
    for i:= max_y downto min_y do
     if (j>=a[4*count-3]) and (j<=a[4*count-1]) and (i>=a[4*count-2]) and (i<=a[4*count]) then
      arr[j,i]:=1;
  end;
  
  procedure sum(mx_x, mn_x, mx_y, mn_y, S: longint; d: ar; n,k: integer; var S_b: longint);
   var i, j: byte;
  begin
   S:=0; 
    for j:=mn_x to mx_x do
    for i:= mx_y downto mn_y do
     S:=S+d[j,i];
     
     if S<>0 then
     writeln('Rectangles ', n,' and ',k,' intersect and they have ',S,' common points ')
     else writeln('Rectangles ', n,' and ',k,' do not intersect.');
     
     S_b:=S_b+S;
  end;   
         
begin
 clrscr;
 writeln('Input number of rectangle on the coordinate plane.');
 
 repeat
 write('N = ');
 readln(str);
 val(str, N_k, error);
 until error=0;
 
 writeln('Input coordinates of rectangle (left bottom point - (x1,y1) ; right top point - (x2,y2)).');
 for n:=1 to N_k do
  begin
   writeln('Coordinates of rectangle number ',n);
   repeat write('x1 = '); readln (str); val(str, a[4*n-3], error); until error=0;
   repeat write('y1 = '); readln (str); val(str,a[4*n-2], error); until error=0;
   repeat write('x2 = '); readln (str); val(str, a[4*n-1], error); until error=0;
   repeat write('y2 = '); readln (str); val(str, a[4*n], error); until error=0;
  end;
 
 min_x:=a[1]; min_y:=a[1];
 max_x:=a[1]; max_y:=a[1];
 
 i:=1;
 while i<=4*N_k do
  begin
   if a[i]<min_x then min_x:=a[i];
   if a[i]>max_x then max_x:=a[i];
   i:=i+2;
  end;
 
 i:=2;
 while i<=4*N_k do
 begin
  if a[i]<min_y then min_y:=a[i];
  if a[i]>max_y then max_y:=a[i];
  i:=i+2;
 end;
 
 S_b:=0;

 for n:=1 to N_k do
  begin
   k:=n+1;

   zero(max_x, min_x, max_y, min_y, b);
   
   check(n, max_x, min_x, max_y, min_y, a, b);      
   
   while k<=N_k do
    begin
    
    zero(max_x, min_x, max_y, min_y, c);
     
    check(k, max_x, min_x, max_y, min_y, a, c);  
    
    for j:=min_x to max_x do
    for i:= max_y downto min_y do
     d[j,i]:=b[j,i]*c[j,i];
     
    sum(max_x, min_x, max_y, min_y, S, d, n, k, S_b); 
     
    k:=k+1;
    end;
  end;
  
 writeln ('Amount of common points of rectangles is:');
 write (S_b,' points.');

 readln;
 end.
     
     
   
   
   
 