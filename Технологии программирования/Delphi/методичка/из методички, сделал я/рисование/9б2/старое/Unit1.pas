unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    PaintBox1: TPaintBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
w,h,wm,hm,t:integer;
a,b,c,ab,ac,bc,aa,bb,cc,x,y,q: real;
  n,i: integer;
  p:array [0..4] of Tpoint;
begin
  t:=-20;h:=200;

  PaintBox1.Canvas.Pen.Width:= 2;
  PaintBox1.Canvas.Pen.Color:=clYellow;
  p[0].x:= -15*t; p[0].y:= 6*t;
  p[1].x:= 15*t;  p[1].y:= 6*t;
  PaintBox1.Canvas.MoveTo(p[0].x+h,p[0].y+h);
  PaintBox1.Canvas.LineTo(p[1].x+h,p[1].y+h);

  PaintBox1.Canvas.Pen.Color:=clMaroon;
  p[0].x:= -0*t; p[0].y:= 9*t;
  p[1].x:= -12*t;  p[1].y:= -9*t;
  PaintBox1.Canvas.MoveTo(p[0].x+h,p[0].y+h);
  PaintBox1.Canvas.LineTo(p[1].x+h,p[1].y+h);

  PaintBox1.Canvas.Pen.Color:=clNavy;
  p[0].x:= -10*t; p[0].y:= -10*t;
  p[1].x:= 10*t;  p[1].y:= 10*t;
  PaintBox1.Canvas.MoveTo(p[0].x+h,p[0].y+h);
  PaintBox1.Canvas.LineTo(p[1].x+h,p[1].y+h);

  PaintBox1.Canvas.Pen.Color:=clTeal;
  p[0].x:= -10*t; p[0].y:= 10*t;
  p[1].x:= 10*t;  p[1].y:= -10*t;
  PaintBox1.Canvas.MoveTo(p[0].x+h,p[0].y+h);
  PaintBox1.Canvas.LineTo(p[1].x+h,p[1].y+h);

  PaintBox1.Canvas.Pen.Color:=clRed;
  p[0].x:= -6*t; p[0].y:= 9*t;
  p[1].x:= 12*t;  p[1].y:= 0*t;
  PaintBox1.Canvas.MoveTo(p[0].x+h,p[0].y+h);
  PaintBox1.Canvas.LineTo(p[1].x+h,p[1].y+h);

  Brush.Color:=clAqua;PaintBox1.Canvas.Pen.Color:=clAqua;
  p[0].x:= 0*t+h; p[0].y:= 0*t+h;
  p[1].x:= StrToInt(FloatToStr(-3.5*t))+h;  p[1].y:= StrToInt(FloatToStr(3.5*t))+h;
  p[2].x:= -2*t+h; p[2].y:= 6*t+h;
  p[3].x:= 0*t+h;  p[3].y:= 6*t+h;
  p[4].x:= 4*t+h;  p[4].y:= 4*t+h;
  PaintBox1.Canvas.Polygon(p);


  PaintBox1.Canvas.Pen.Width:= 1;
  PaintBox1.Canvas.Pen.Color:=clBlack;
  p[0].x:= -12*t; p[0].y:= 0*t;
  p[1].x:= 10*t;  p[1].y:= 0*t;
  PaintBox1.Canvas.MoveTo(p[0].x+h,p[0].y+h);
  PaintBox1.Canvas.LineTo(p[1].x+h,p[1].y+h);

  p[0].x:= 0*t; p[0].y:= 8*t;
  p[1].x:= 0*t; p[1].y:= -8*t;
  PaintBox1.Canvas.MoveTo(p[0].x+h,p[0].y+h);
  PaintBox1.Canvas.LineTo(p[1].x+h,p[1].y+h);

  p[0].x:= 0*t; p[0].y:= 8*t;
  p[1].x:= StrToInt(FloatToStr(-0.5*t)); p[1].y:= StrToInt(FloatToStr(7.5*t));
  PaintBox1.Canvas.MoveTo(p[0].x+h,p[0].y+h);
  PaintBox1.Canvas.LineTo(p[1].x+h,p[1].y+h);

  p[0].x:= 0*t; p[0].y:= 8*t;
  p[1].x:= StrToInt(FloatToStr(0.5*t)); p[1].y:= StrToInt(FloatToStr(7.5*t));
  PaintBox1.Canvas.MoveTo(p[0].x+h,p[0].y+h);
  PaintBox1.Canvas.LineTo(p[1].x+h,p[1].y+h);

  p[0].x:= -12*t; p[0].y:= 0*t;
  p[1].x:= StrToInt(FloatToStr(-11.5*t)); p[1].y:= StrToInt(FloatToStr(0.5*t));
  PaintBox1.Canvas.MoveTo(p[0].x+h,p[0].y+h);
  PaintBox1.Canvas.LineTo(p[1].x+h,p[1].y+h);

  p[0].x:= -12*t; p[0].y:= 0*t;
  p[1].x:= StrToInt(FloatToStr(-11.5*t)); p[1].y:= StrToInt(FloatToStr(-0.5*t));
  PaintBox1.Canvas.MoveTo(p[0].x+h,p[0].y+h);
  PaintBox1.Canvas.LineTo(p[1].x+h,p[1].y+h);

  for i:=-11 to 9 do
  begin
  p[0].x:= i*t; p[0].y:= StrToInt(FloatToStr(0.5*t));
  p[1].x:= i*t; p[1].y:= StrToInt(FloatToStr(-0.5*t));
  PaintBox1.Canvas.MoveTo(p[0].x+h,p[0].y+h);
  PaintBox1.Canvas.LineTo(p[1].x+h,p[1].y+h);
  end;

  for i:=-7 to 7 do
  begin
  p[0].y:= i*t; p[0].x:= StrToInt(FloatToStr(0.5*t));
  p[1].y:= i*t; p[1].x:= StrToInt(FloatToStr(-0.5*t));
  PaintBox1.Canvas.MoveTo(p[0].x+h,p[0].y+h);
  PaintBox1.Canvas.LineTo(p[1].x+h,p[1].y+h);
  end;

end;

end.
