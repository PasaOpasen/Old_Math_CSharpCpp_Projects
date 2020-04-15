unit UForm11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons;

type
  TForm1 = class(TForm)
    OpenModelessForm: TButton;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Button1: TButton;
    StringGrid1: TStringGrid;
    procedure OpenModelessFormClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses UForm12;

{$R *.dfm}

procedure TForm1.OpenModelessFormClick(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form3.Show;
end;

end.
