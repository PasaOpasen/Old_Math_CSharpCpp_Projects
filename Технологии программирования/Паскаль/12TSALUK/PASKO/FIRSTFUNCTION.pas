Uses
Crt;

CONST
  n = 6;

TYPE
  Massiv = ARRAY[1..n] OF INTEGER;

FUNCTION MinEl(x: Massiv):INTEGER;
VAR
  c, i: INTEGER;
BEGIN
  c := x[1];
  FOR i := 2 TO n DO
    BEGIN
    IF x[i] < c THEN c := x[i];
    END;
    MinEl := c;
END;

VAR
   m: Massiv;
BEGIN
  m[1] := 1; m[2] := -3; m[3] := 32; m[4] := -100; m[5] := -30; m[6] := 100;
  WriteLn (MinEl(m));

ReadKey;
END.