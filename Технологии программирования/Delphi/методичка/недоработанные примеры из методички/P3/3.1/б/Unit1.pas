unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, StdCtrls, Math;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    Chart1: TChart;
    Series1: TLineSeries;
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

procedure TForm1.Button1Click(Sender: TObject);
var x,y,u:real;
begin
  try
    x:=StrToFloat(Edit1.text);
    y:=StrToFloat(Edit1.Text);
  except
    ShowMessage('�� ���������� ����');
    exit;
  end;

  if x<=0 then
    begin
      ShowMessage('x ������ ���� ������ 0');
      exit;
    end;

  u:=tan(x+y*y)+y*ln(x);
  Memo1.Lines.Add(FloatToStrF(u,fffixed,8,3));
end;

procedure TForm1.FormCreate(Sender: TObject);
var x,h:real;
begin
  h:=0.01;
  x:=h;
  Chart1.LeftAxis.SetMinMax(-10,10);
  Chart1.BottomAxis.PositionPercent:=50;
  while x<10 do
    begin
      if (tan(x)+ln(x)-tan(x+h)-ln(x+h))>1 then
        series1.AddNullXY(x+h,tan(x+h)+ln(x+h),'')
      else Series1.AddXY(x,tan(x)+ln(x),'',clRed);
      x:=x+h;
    end;
end;

end.
