USES Crt;

CONST
n = 4;

TYPE
Polynomial = ARRAY[1..n+1] OF REAl;

FUNCTION Go(a:Polynomial; x:REAL):REAL;
VAR
  i: WORD;
  sum: REAL;
BEGIN
sum := sum + a[1]*x+a[2];
  IF n > 0 THEN
  BEGIN
    FOR i := 3 TO n+1 DO
      BEGIN
      sum := sum*x;
      sum := sum + a[i];
      END;
  END
  ELSE
  WriteLn(' ����童� ');
Go := sum;
END;



VAR
a: ARRAY [1..n+1] OF REAL;
x: REAL;
BEGIN
a[1] := 0; a[2] := 0; a[3] := 0; a[4] := 5; a[5] := 1;
x := 1;
WriteLn('���祭�� �����童�� � �窥',x:10:4,' ࠢ��   ',Go(a,x):10:5);
ReadKey;
END.