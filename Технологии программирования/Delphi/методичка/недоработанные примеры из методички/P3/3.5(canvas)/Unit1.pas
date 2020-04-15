unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    Button1: TButton;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


Procedure ClearScreen(Canvas:TCanvas);
var
L,T,R,B:Integer;
begin
  L:=Canvas.ClipRect.Left;
  T:=Canvas.ClipRect.Top;
  R:=Canvas.ClipRect.Right;
  B:=Canvas.ClipRect.Bottom;
  PatBlt(Canvas.Handle,L,T,R,B,WHITENESS)
end;

procedure TForm1.Button1Click(Sender: TObject);
var x,y:real;
begin
  Memo1.Clear;
  Image1.Hide;
  ClearScreen(Image1.Canvas);
  try x:=StrToFloat(Edit1.Text);
  except
    ShowMessage('����������� ������ X');
    exit;
  end;

  try y:=StrToFloat(Edit2.Text);
  except
    ShowMessage('����������� ������ Y');
    exit;
  end;
  image1.Canvas.Pen.Width:=3;
  if CheckBox1.Checked then
  begin
    Image1.Show;
    image1.Canvas.MoveTo(1,image1.Height-1);
    Image1.Canvas.LineTo(1,1);
    image1.Canvas.LineTo(Image1.Width-2,Image1.Height-2);
    Image1.Canvas.LineTo(0,Image1.Height-2);
    if (x>0) and (y>0) and ((x+y)<5)
      then
        Memo1.Lines.Add('����� ('+Edit1.Text+';'+Edit2.Text+') ����������� ������������')
      else
        Memo1.Lines.Add('����� ('+Edit1.Text+';'+Edit2.Text+') �� ����������� ������������');
  end;

  if CheckBox2.Checked then
  begin
    Image1.Show;
    Image1.Canvas.Rectangle(1,1,Image1.Width-2,Image1.Height);
    if (0.5<x) and (x<3) and (-2<y) and (y<4)
      then
        Memo1.Lines.Add('����� ('+Edit1.Text+';'+Edit2.Text+') ����������� ��������������')
      else Memo1.Lines.Add('����� ('+Edit1.Text+';'+Edit2.Text+') �� ����������� ��������������');
  end;

  if CheckBox3.Checked then
  begin
     Image1.Show;
     Image1.Canvas.Ellipse(0,0,Image1.Height,Image1.Height);
     if (x*x+y*y)<=7
       then
         Memo1.Lines.Add('����� ('+Edit1.Text+';'+Edit2.Text+') ����������� �����')
       else Memo1.Lines.Add('����� ('+Edit1.Text+';'+Edit2.Text+') �� ����������� �����');
   end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Image1.Hide;
end;

end.
