program pr_16;
uses Graph,Crt;
type
Rec = Record
  Gender :Char;
	Age,RecNum :ShortInt;
	end;
	RecAr = array [1..100] of Rec;
	PRecAr = ^RecAr;
	GendRecP = ^GendRec;
	GendRec = object
		RecP :PRecAr;
		constructor init;
		destructor done;
		procedure diagram(MaxAge:Integer);
		end;
	constructor GendRec.init;
		var i:byte;
		 begin
		  New(RecP);
		  if RecP = nil then Writeln('Out of memory');
		  for i:=1 to 100 do
		  with RecP^[i] do
			  begin
			    Gender:='N';
			    Age:=0;
			    RecNum:=0;
			  end;
		end;

	destructor GendRec.done;
		var i:byte;
		begin 
		 Dispose(RecP);
		 RecP:=Nil;
		end;

	procedure GendRec.diagram;
		var i,men,ag,wimen:byte;
        Xcur,Wid:integer;
        s:string;
	begin
   Wid:=3*(600 div MaxAge);
   i:=1;
   ag:=0;
   Xcur:=40;
   setcolor(white);
   setbkcolor(black);
   cleardevice;
   Rectangle(10,10,630,470);
   SetFillStyle(1,White);
   FloodFill(50,50,White);
   SetColor(Black);
   OutTextXY(30,410,'age');
   repeat
     i:=0;
     men:=0;
     wimen:=0;
     repeat
		  with RecP^[i] do
       begin
        if (Age > ag) and (Age <= ag+10) then 
         begin
          if Gender='M' then men:=men+RecNum;
          if Gender='F' then wimen:=wimen+RecNum;
         end;
       end;
     i:=i+1;
     until i>100;
     if men+wimen>0 then
      begin
       setcolor(black);
       str(ag,s);
       OutTextXY(Xcur+wid div 2 + 10,410,S);
      end;
     if men > wimen then
      begin
       if men >0 then
        begin
         SetColor(lightblue);
         Rectangle(Xcur,400,Xcur+wid,400-men);
         str(men,s);
         OutTextXY(Xcur+3,380-men,s);
         Xcur:=Xcur+wid;
         SetFillStyle(1,Blue);
         FloodFill(Xcur-3,401-men,lightBlue);
         if wimen > 0 then 
          begin
           SetColor(Red);
           Rectangle(Xcur,400,Xcur+wid,400-wimen);
           str(wimen,s);
           OutTextXY(Xcur+3,380-wimen,s);
           Xcur:=Xcur+wid;
           SetFillStyle(1,LightRed);
           FloodFill(Xcur-3,401-wimen,red);
          end;
      end;
    end
    else
    if wimen>0 then
    begin
     SetColor(Red);
     Rectangle(Xcur,400,Xcur+wid,400-wimen);
     str(wimen,s);
     OutTextXY(Xcur+3,380-wimen,s);
     Xcur:=Xcur+wid;
     SetFillStyle(1,LightRed);
     FloodFill(Xcur-5 div 4,401-wimen,red);
     if men > 0 then 
      begin
       SetColor(lightBlue);
       Rectangle(Xcur,400,Xcur+wid,400-men);
       str(men,s);
       OutTextXY(Xcur+3,380-men,s);
       Xcur:=Xcur+wid;
       SetFillStyle(1,Blue);
       FloodFill(Xcur-3,401-men,lightBlue);
      end;
   end;
   readkey;
   i:=i+1;
   ag:=ag+10;
  until (men=0) and (wimen=0);
  end;
VAR Jake: GendRecP;
    grDriver, grMode, ErrCode,j,MaxAge: Integer;
BEGIN
 randomize;
 grDriver:=Detect;
 InitGraph(grDriver,grMode,'C:\TP\BGI');
 ErrCode:=GraphResult;
 if ErrCode = GrOK then
	begin
   MaxAge:=50+Random(50);
   New(Jake,init);
   for j:=1 to 100 do
    begin
     Jake^.RecP^[j].Age:=random(MaxAge);
     if j mod 2 = 0 then
     Jake^.RecP^[j].Gender:='M'
     else
     Jake^.RecP^[j].Gender:='F';
     Jake^.RecP^[j].RecNum:=random(30)+1;
   end;
  Jake^.diagram(MaxAge);
  readkey;
  CloseGraph;
 end
 else Write('Graph problem');
END.
