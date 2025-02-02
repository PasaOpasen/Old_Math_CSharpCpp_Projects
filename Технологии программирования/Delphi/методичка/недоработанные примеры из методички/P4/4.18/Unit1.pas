unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, Menus;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    StringGrid3: TStringGrid;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  n,m:integer;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var i,j:integer;
begin
 n:=4;
 m:=4;
 Edit1.Text:='4';
 Edit2.Text:='4';
 StringGrid1.ColCount:=n+1;
 StringGrid1.RowCount:=m+1;
 StringGrid2.ColCount:=n+1;
 StringGrid2.RowCount:=m+1;
 StringGrid3.ColCount:=n+1;
 StringGrid3.RowCount:=m+1;
 for i:=1 to n do
   begin
    StringGrid1.cells[0,i]:=intToStr(i);
    StringGrid1.cells[i,0]:=intToStr(i);
    StringGrid2.cells[0,i]:=intToStr(i);
    StringGrid2.cells[i,0]:=intToStr(i);
    StringGrid3.cells[0,i]:=intToStr(i);
    StringGrid3.cells[i,0]:=intToStr(i);
   end;
 radioButton1.checked:=true
end;

procedure TForm1.Button1Click(Sender: TObject);
var i,j:integer;
begin
 n:=StrToInt(Edit1.text);
 m:=StrToInt(Edit2.text);
 StringGrid1.ColCount:=m+1;
 StringGrid1.RowCount:=n+1;
 StringGrid2.ColCount:=m+1;
 StringGrid2.RowCount:=n+1;
 StringGrid3.ColCount:=m+1;
 StringGrid3.RowCount:=n+1;
  for i:=1 to n do
   begin
    StringGrid1.Cells[0,i]:=IntToStr(i);
    StringGrid2.Cells[0,i]:=IntToStr(i);
    StringGrid3.Cells[0,i]:=IntToStr(i);
   end;
  for i:=1 to m do
   begin
    StringGrid1.Cells[i,0]:=IntToStr(i);
    StringGrid2.Cells[i,0]:=IntToStr(i);
    StringGrid3.Cells[i,0]:=IntToStr(i);
   end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var i,j:integer;
begin
  for i:=1 to 2*n do
    for j:=1 to 2*m do
      StringGrid3.Cells[j,i]:='';

 if RadioButton1.Checked then
  begin
   StringGrid3.RowCount:=2*n+1;
   StringGrid3.ColCount:=m+1;
   for i:=1 to n do
    for j:=1 to m do
     begin
      StringGrid3.Cells[j,i*2-1]:=StringGrid1.Cells[j,i];
      StringGrid3.Cells[j,i*2]:=StringGrid2.Cells[j,i];
     end;
  end;

 if RadioButton2.Checked then
  begin
   StringGrid3.ColCount:=2*m+1;
   StringGrid3.RowCount:=n+1;
   for i:=1 to n do
    for j:=1 to m do
     begin
      StringGrid3.Cells[j*2-1,i]:=StringGrid1.Cells[j,i];
      StringGrid3.Cells[j*2,i]:=StringGrid2.Cells[j,i];
     end;
  end;

 if RadioButton3.Checked then
  begin
   StringGrid3.RowCount:=2*n+1;
   StringGrid3.ColCount:=m+1;
   for i:=1 to n do
    for j:=1 to m do
     StringGrid3.Cells[j,i]:=StringGrid1.Cells[j,i];
   for i:=n+1 to 2*n do
    for j:=1 to m do
     StringGrid3.Cells[j,i]:=StringGrid2.Cells[j,i-n];
  end;

  if radiobutton4.Checked then
   begin
   StringGrid3.RowCount:=n+1;
   StringGrid3.ColCount:=2*m+1;
   for i:=1 to n do
    for j:=1 to m do
      StringGrid3.Cells[j,i]:=StringGrid1.Cells[j,i];
   for i:=1 to n do
    for j:=m+1 to 2*m do
      StringGrid3.Cells[j,i]:=StringGrid2.Cells[j-m,i];
   end;

end;

procedure TForm1.N1Click(Sender: TObject);
var txt:TextFile;
    i,j:integer;
    scan:real;
begin
 if OpenDialog1.Execute then
  begin
    assignFile(txt,OpenDialog1.FileName);
    reset(txt);
    read(txt,n);
    read(txt,m);
    StringGrid1.ColCount:=m+1;
    StringGrid1.RowCount:=n+1;
    StringGrid2.ColCount:=m+1;
    StringGrid2.RowCount:=n+1;
    StringGrid3.ColCount:=m+1;
    StringGrid3.RowCount:=n+1;
    Edit1.Text:=IntToStr(n);
    Edit2.Text:=IntToStr(m);
    for i:=1 to n do
     begin
      for j:=1 to m do
        begin
          read(txt,scan);
          StringGrid1.Cells[j,i]:=FLoatToStr(scan);
        end;
     end;
    for i:=1 to n do
     begin
      for j:=1 to m do
        begin
          read(txt,scan);
          StringGrid2.Cells[j,i]:=FLoatToStr(scan);
        end;
     end;
  end;
end;

procedure TForm1.N2Click(Sender: TObject);
var txt:textFile;
    i,j:integer;
begin
 if saveDialog1.Execute then
  begin
    assignFile(txt,SaveDialog1.FileName);
    rewrite(txt);
    for i:=1 to n do
      begin
        for j:=1 to m do write(txt,StringGrid1.Cells[j,i]:6);
        writeln(txt);
      end;
    writeln(txt);
    for i:=1 to n do
      begin
        for j:=1 to m do write(txt,StringGrid2.Cells[j,i]:6);
        writeln(txt);
      end;
    writeln(txt);
    for i:=1 to 2*n do
      begin
        for j:=1 to 2*m do write(txt,StringGrid3.Cells[j,i]:6);
        writeln(txt);
      end;
    CloseFile(txt);
  end;
end;

end.
