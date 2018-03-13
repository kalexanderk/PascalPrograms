PROGRAM pr_12_13;
uses crt;
TYPE ptr=^elem;
     elem = record
     data: real;
     nxt: ptr;
     end;
VAR  rlt, prev, first1, first2,next : ptr;
     l1, l2, i, error: integer;
     s:string;
	
procedure common(first1, first2: ptr);
var next1, next2, next3, rlt1, rlt2, rlt3, first3, prev3: ptr;
    k, counter, i, j, l: integer;
begin
next1:=first1;
k:=0;
for i:= 1 to l1 do
  begin
    rlt1:=next1;
    next1:=rlt1^.nxt;
    counter:=0;
    l:=0;
    next2:=first2;
    for j:=1 to l2 do
      begin
        l:=l+1;
        rlt2:=next2;
        next2:=rlt2^.nxt;
        if rlt1^.data=rlt2^.data then
          begin
            counter:=counter+1;
            if counter=1 then
              begin
                k:=k+1;
                new(rlt3);
                if k>1 then prev3^.nxt:=rlt3;
                rlt3^.data:=rlt1^.data;
                rlt3^.nxt:=nil;
                prev3:=rlt3;
                if k=1 then first3:=rlt3;
              end;
            if l=1 then
              begin
                first2:=rlt2^.nxt;
                l:=l-1;
              end;
            dispose(rlt2);
          end;
      end;
  end;

writeln('List L3:');
next3:=first3;
for i:=1 to k do
  begin
    rlt3:=next3;
    next3:=rlt3^.nxt;
    writeln(rlt3^.data);
  end;
end;


BEGIN
clrscr;

repeat
  write ('Input number of records in L1 list: ');
  readln(s);
  val(s,l1, error);
until error=0;
{We create first record of L1}
new(rlt);
write('Input data: '); readln(rlt^.data);
rlt^.nxt:=nil; {We do not have next record}
prev:=rlt; first1:=rlt;
{We create other records of L1}
if l1>1 then
  begin
    for i:=2 to l1 do
      begin
        new(rlt);
        prev^.nxt:=rlt;
        write('Input data: '); readln(rlt^.data);
        rlt^.nxt:=nil; {We do not have next record}
        prev:=rlt;
      end;
  end;

repeat
  write ('Input number of records in L2 list: ');
  readln(s);
  val(s, l2, error);
until error=0;
{We create first record of L2}
new(rlt);
write('Input data: '); readln(rlt^.data);
rlt^.nxt:=nil; {We do not have next record}
prev:=rlt; first2:=rlt;
{We create other records of L2}
if l2>1 then
  begin
    for i:=2 to l2 do
      begin
        new(rlt);
        prev^.nxt:=rlt;
        write('Input data: '); readln(rlt^.data);
        rlt^.nxt:=nil; {We do not have next record}
        prev:=rlt;
      end;
  end;

writeln('List L1:');
next:=first1;
for i:=1 to l1 do
  begin
    rlt:=next;
    next:=rlt^.nxt;
    writeln(rlt^.data);
  end;
 
writeln('List L2:');
next:=first2;
for i:=1 to l2 do
  begin
    rlt:=next;
    next:=rlt^.nxt;
    writeln(rlt^.data);
  end;
 
common(first1, first2);

readln;
END.

  

