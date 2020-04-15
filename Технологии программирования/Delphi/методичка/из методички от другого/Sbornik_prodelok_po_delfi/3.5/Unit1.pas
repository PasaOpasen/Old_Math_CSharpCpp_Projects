unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditX: TEdit;
    EditY: TEdit;
    GroupBox1: TGroupBox;
    treug: TCheckBox;
    praymoug: TCheckBox;
    Krug: TCheckBox;
    Button1: TButton;
    Memo1: TMemo;
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
var x,y: Real;
    flag: Boolean;
begin
 try
   x:=StrToFloat(EditX.Text);
   y:=StrToFloat(EditY.Text);
 except
   ShowMessage('�������� �������� ������');
   Exit;
 end;
 flag:=true;
 if Krug.Checked then
   begin
    flag:=false;
    if x*x+y*y <=7 then
      Memo1.Lines.Add('����� ����������� �����')
    else
      Memo1.Lines.Add('����� �� ����������� �����');
   end;
 if Praymoug.Checked then
   begin
    flag:=false;
    if (x > 0.5) and (x < 3) and (y > -2) and (y < 4) then
      Memo1.Lines.Add('����� ����������� ��������������')
    else
      Memo1.Lines.Add('����� �� ����������� ��������������');
   end;
 if Treug.Checked then
   begin
    flag:=false;
    if (x > 0) and (y > 0) and (x+y < 5) then
      Memo1.Lines.Add('����� ����������� ������������')
    else
      Memo1.Lines.Add('����� �� ����������� ������������');
   end;
 if flag then
   Memo1.Lines.Add('�� ������ �� ���� ����� ��� ��������!');
 Memo1.Lines.Add('     ');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Memo1.Clear;
end;

end.
