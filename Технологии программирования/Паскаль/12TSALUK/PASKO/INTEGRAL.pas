USES
Crt;

FUNCTION f(x:REAL):REAL;
BEGIN
f := x*x+1;
END;

FUNCTION int(a,b:REAL):REAL;
VAR
  s,d,c,exact: REAL;
  i,k: WORD;
  n: INTEGER;
BEGIN
  n:=10;
  exact := 252.0;
  FOR k := 1 TO 11 DO
    BEGIN
    d := abs(a-b)/n;
    s := f(a)+f(b);

    FOR i := 1 TO n-1 DO
      BEGIN
        s := s + f(a+i*d)*2;
      END;
    c := s/2*d;
    int := c;

  WriteLn('���᫥���� ���祭�� ��⥣ࠫ� ', c:10:8);
  WriteLn('�⪫������ �� ���������� ���祭�� ', (exact - c):10:8);
  WriteLn('�᫮ ��१��� ࠧ������ ', n);
  WriteLn();
  WriteLn();

  n := n*2;
  END;
END;

BEGIN
WriteLn(int(0.0,9.0):10:10);
Readkey;
END.
