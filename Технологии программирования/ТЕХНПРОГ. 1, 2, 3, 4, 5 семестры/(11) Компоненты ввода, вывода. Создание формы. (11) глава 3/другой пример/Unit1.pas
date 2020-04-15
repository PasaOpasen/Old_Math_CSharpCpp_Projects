unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
var a:integer;
begin
a:=StrToInt(Edit1.Text);
a:=sqr(a);
Label1.Caption:=IntToStr(a);
end;

procedure TForm1.Button2Click(Sender: TObject);
var a:integer;
begin
  a:=StrToInt(Edit1.Text);
  a:=sqr(a);
  ShowMessage(IntToStr(a));
end;

procedure TForm1.Button3Click(Sender: TObject);
var a:integer;
begin
  a:=StrToInt(Edit1.Text);
  MessageDlg('������� ����� ' + IntToStr(a)   + ' ����� ' + IntToStr(sqr(a)), mtInformation,[mbCancel],0);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 Edit1.Text:='13';
end;

end.
