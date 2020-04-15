unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Memo1: TMemo;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
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

procedure TForm1.FormCreate(Sender: TObject);
begin
 RadioButton1.Checked:=true;
end;


procedure TForm1.Button1Click(Sender: TObject);
var a,b,y,h:real;
    n,i:integer;

function f(x:real):real;
 begin
  if RadioButton1.Checked then f:=x*x+3;

  if RadioButton2.Checked then
   if x=0 then
    begin
     ShowMessage('���������� ������� �� ����');
     f:=0;
     exit;
    end
   else f:=x*x*x-1/x;

  if RadioButton3.Checked then
   if sin(x)=0 then
    begin
     ShowMessage('���������� ������� �� ����');
     f:=0;
     exit;
    end
   else f:=x/sin(x);
 end;

begin
 try a:=StrToFloat(Edit1.text)
  except ShowMessage('������ ����� ����� A');
        exit;
 end;
 try b:=StrToFloat(Edit2.text)
  except ShowMessage('������ ����� ����� B');
        exit;
 end;
 try n:=StrToInt(Edit3.text)
  except ShowMessage('������ ����� ����� N');
        exit;
 end;
 h:=(b-a)/n;
 y:=0;
 for i:=1 to n-1 do y:=y+f(((a+i*h)+(a+i*h+h))/2)*h;
 Memo1.Lines.Add(FloatToStr(y));
end;

end.
