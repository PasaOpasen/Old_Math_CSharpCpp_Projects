unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    PaintBox2: TPaintBox;
    ColorBox1: TColorBox;
    Button1: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    ColorBox2: TColorBox;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
var h,x,y,i:integer;
begin
  h:=30;
  x:=10;
  y:=10;
  PaintBox1.Canvas.Pen.Color:=ColorBox1.Selected;
  for i:=0 to 6 do
    begin
      PaintBox1.Canvas.TextOut(320,y-8,ComboBox1.Items[i]);
      PaintBox1.Canvas.Pen.Style:=TPenStyle(i);

      PaintBox1.Canvas.MoveTo(10,y);
      PaintBox1.Canvas.LineTo(300,y);
      y:=y+h;
    end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
 PaintBox2.Refresh;
 PaintBox2.Canvas.Brush.Color:=ColorBox2.Selected;
 PaintBox2.Canvas.Rectangle(0,0,PaintBox2.Width,PaintBox2.Height);
 PaintBox2.Canvas.Pen.Color:=ColorBox1.Selected;
 PaintBox2.Canvas.Pen.Style:=TPenStyle(ComboBox1.ItemIndex);
 PaintBox2.Canvas.Pen.Width:=1;
 PaintBox2.Canvas.MoveTo(0,PaintBox2.Height div 2);
 PaintBox2.Canvas.LineTo(PaintBox2.Width,PaintBox2.Height div 2);
end;

end.
