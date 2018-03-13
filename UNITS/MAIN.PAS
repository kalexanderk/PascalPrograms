program r1;
uses tables;
var a1, a2:ar_t;
    m, n: word;
    sum1, sum2: real;
begin
repeat
  write('m = ');
  readln(m);
until (m>0) and (m<=100);

repeat
  write('n = ');
  readln(n);
until (n>0) and (n<=100);
writeln('Please input 1st array.');
in_array(a1, m, n);
writeln('Please input 2d array.');
in_array(a2, m, n);
sum1:=sum_array(a1, m, n);
sum2:=sum_array(a2, m, n);
if sum1>sum2 then writeln('Sum1>Sum2');
if sum1<sum2 then writeln('Sum1<Sum2');
if sum1=sum2 then writeln('Sum1=Sum2');
readln;
end.