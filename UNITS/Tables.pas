unit tables;
interface
  type ar_t= array[1..100, 1..100] of real;
  procedure in_array(var a: ar_t; m, n: word);
  procedure out_array(a: ar_t; m, n: word);
  function sum_array(a: ar_t; m, n: word): real;


implementation

  procedure in_array();
    var i,j: word;
    begin
      for i:=1 to m do
        for j:=1 to n do
          begin
            write('a[',i,',',j,'] = ');
            readln(a[i, j]);
          end;
    end;

  procedure out_array();
    var i,j: word;
    begin
      for i:=1 to m do
        for j:=1 to n do
            write(a[i,j]:4);
    end;
   
  function sum_array():real;
    var i,j: word;
        sum: real;
    begin
      sum:=0;
      for i:=1 to m do
        for j:=1 to n do
            sum:=sum + a[i,j];
      sum_array:=sum;
    end;
end.