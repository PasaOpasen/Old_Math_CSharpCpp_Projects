unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    procedure ComboBox1Click(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ComboBox1Click(Sender: TObject);
 var st:string;
     n,i,nst,ind:integer;
begin
  n:=0;
  ind:=0;
  nst:=ComboBox1.ItemIndex;
  st:=ComboBox1.Items[nst];
  for i:=1 to length(st) do
   begin
    case ind of
     0: if st[i] <> ' ' then
      begin
       ind:=1;
       inc(n);
      end;
     1: if st[i]=' ' then ind:=0;
    end;
   end;
   Label3.Caption:=IntToStr(n);
end;

procedure TForm1.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then
  begin
   ComboBox1.Items.Add(Edit1.Text);
   Edit1.Text:='';
  end;
end;

end.
