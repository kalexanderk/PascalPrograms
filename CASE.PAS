program pr_2a_8;
 uses crt;
 var month: integer;
 s: string; 
 error: integer;
begin
 clrscr;
 writeln('Input number of month');
 repeat
  begin
   write('Number of month = ');
   readln(s);
   val(s,month,error);
  end;
 until error=0; 
 case month of
  1: writeln('There are 31 days in this month');
  2: writeln('There are 28 days in this month');
  3: writeln('There are 31 days in this month');
  4: writeln('There are 30 days in this month');
  5: writeln('There are 31 days in this month');
  6: writeln('There are 30 days in this month');
  7: writeln('There are 31 days in this month');
  8: writeln('There are 31 days in this month'); 
  9: writeln('There are 30 days in this month');
  10: writeln('There are 31 days in this month');
  11: writeln('There are 30 days in this month');
  12: writeln('There are 31 days in this month');
  else writeln('Month with this number does not exist');
 end;
 writeln('Press ENTER to Exit');
 readln;
end.
