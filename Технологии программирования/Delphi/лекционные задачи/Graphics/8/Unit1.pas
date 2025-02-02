unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    PaintBox1: TPaintBox;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
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
var x,y,i:integer;
begin
 randomize;

 for i:=1 to 100 do
  begin
   x:=random(870);
   y:=random(320);

   PaintBox1.Canvas.Pixels[x,y]:=clRed;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var x,y,i:integer;
begin
 randomize;
 for i:=1 to 100 do
  begin
    PaintBox1.Canvas.Pen.Width:=random(5);
    PaintBox1.Canvas.Pen.Color:=RGB(random(255),random(255),random(255));
    PaintBox1.Canvas.Brush.Color:=RGB(random(255),random(255),random(255));
    PaintBox1.Canvas.Ellipse(random(300),random(150),random(870),random(320));
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var x,y,i:integer;
begin
 randomize;
 for i:=1 to 100 do
  begin
    PaintBox1.Canvas.Pen.Color:=RGB(random(255),random(255),random(255));
    PaintBox1.Canvas.Pen.Width:=random(5);
    PaintBox1.Canvas.MoveTo(random(870),random(320));
    PaintBox1.Canvas.LineTo(random(870),random(320));
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  PaintBox1.Refresh;
end;

end.
