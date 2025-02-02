USES
 Polynomend,Crt;

FUNCTION PowerK(a:Polynom; z:REAL):Polynom;
VAR
  i:WORD;
  k:REAL;
BEGIN
  FOR i:=0 TO a.deg DO
  BEGIN
    k:= GetCoef(a,i)*z;
    SetCoef(a,i,k);
  END;
END;

VAR
 a,b:Polynom;
 k:REAL;
 n:WORD;
BEGIN
 ClrScr;

  WriteLn('input n (degree of polynom A)');
  ReadLn(n); a:=CreatePolynom(n);
  InPutP(a);OutPutP(a);

  WriteLn();
  WriteLn('input n (degree of polynom B)');
  ReadLn(n); b:=CreatePolynom(n);
  InPutP(b);OutPutP(b);

 Write('sum: ');OutPutP(SumPolynom(a,b));
 Write('difference: ');OutPutP(DifPolynom(a,b));
 Write('power: ');OutPutP(PowerPolynom(a,b));

 WriteLn('input k');
 Write('kA: ');OutPutP(PowerK(a,k));
 Write('kB: ');OutPutP(PowerK(b,k));

 ReadKey;
END.
