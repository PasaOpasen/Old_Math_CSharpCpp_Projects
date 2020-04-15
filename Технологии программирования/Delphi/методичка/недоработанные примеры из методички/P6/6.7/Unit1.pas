unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    StringGrid1: TStringGrid;
    Button1: TButton;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    MainMenu1: TMainMenu;
    Fil: TMenuItem;
    new: TMenuItem;
    opn: TMenuItem;
    sv: TMenuItem;
    s: TMenuItem;
    srt: TMenuItem;
    svsrt: TMenuItem;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label5: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    StringGrid2: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure newClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure opnClick(Sender: TObject);
    procedure svClick(Sender: TObject);
    procedure srtClick(Sender: TObject);
    procedure svsrtClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    //procedure udalClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type TStudent=record
      per1:integer;
      per2:string[40];
      per3:string[40];
      per4:integer;
      per5:string[40];
      per6:string[1];
     end;
var
  fz:file of TStudent;
  stud:array [1..100] of Tstudent;
  nzap:integer;
  flg:boolean;
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  button1.Hide;
  with stringgrid1 do
   begin
    cells[0,0]:='';
    cells[1,0]:='';
    cells[2,0]:='';
    cells[3,0]:='';
    cells[4,0]:='';
    cells[5,0]:='';
   end;
   flg:=false;
end;

procedure TForm1.newClick(Sender: TObject);
var i:integer;
begin
 opendialog1.Title:='������� ����� ����';
 if  opendialog1.Execute then
  begin
   assignFile(fz,opendialog1.FileName);
   rewrite(fz);
   button1.Show;
   nzap:=0;
   for i:=1 to nzap do
    with stringgrid1 do
     begin
      cells[0,i]:='';
      cells[1,i]:='';
      cells[2,i]:='';
      cells[3,i]:='';
      cells[4,i]:='';
      cells[5,i]:='';
     end;
    flg:=true;
  end;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 inc(nzap);
 with stud[nzap] do
  begin
   per1:=strtoint(Edit1.Text);
   per2:=Edit2.Text;
   per3:=Edit3.Text;
   per4:=strtoint(edit4.text);
   per5:=Edit5.Text;
   per6:=Edit6.Text;
  end;
 with stringgrid1 do
  begin
   cells[0,nzap]:=edit1.text;
   cells[1,nzap]:=edit2.text;
   cells[2,nzap]:=edit3.text;
   cells[3,nzap]:=edit4.text;
   cells[4,nzap]:=edit5.text;
   cells[5,nzap]:=edit6.text;
  end;
 write(fz,stud[nzap]);
 edit1.Text:='';
 edit2.Text:='';
 edit3.Text:='';
 edit4.Text:='';
 edit5.Text:='';
 edit6.Text:='';
 Stringgrid1.Rowcount:=nzap+1;
end;

procedure TForm1.opnClick(Sender: TObject);
begin
 if  opendialog1.Execute then
  begin
   assignFile(fz,OpenDialog1.fileName);
   reset(fz);
   nzap:=0;
   while not eof(fz) do
    begin
     inc(nzap);
     read(fz,stud[nzap]);
     with stringGrid1,stud[nzap] do
      begin
       cells[0,nzap]:=inttostr(per1);
       cells[1,nzap]:=per2;
       cells[2,nzap]:=per3;
       cells[3,nzap]:=inttostr(per4);
       cells[4,nzap]:=per5;
       cells[5,nzap]:=per6;
      end;
     Stringgrid1.Rowcount:=nzap+1;
    end;
    button1.show;
  end;
end;

procedure TForm1.svClick(Sender: TObject);
begin
 if flg then
  begin
   closefile(fz);
   flg:=false;
  end;
  button1.Hide;
end;

procedure TForm1.srtClick(Sender: TObject);
var i,j:integer;
    st:TStudent;
begin
   if nzap > 0 then
  begin
   for i:=1 to nzap do
    for j:=1 to nzap-i do
     if stud[j].per5[1]>stud[j+1].per5[1] then
      begin
       st:=stud[j];
       stud[j]:=stud[j+1];
       stud[j+1]:=st;
      end;
    for i:=1 to nzap do
      if (stud[i].per6[1]='y') or  (stud[i].per6[1]='Y') then
      with StringGrid2, stud[i] do
      begin
       cells[0,i]:=inttostr(per1);
       cells[1,i]:=per2;
       cells[2,i]:=per3;
       cells[3,i]:=inttostr(per4);
       cells[4,i]:=per5;
       cells[5,i]:=per6;
      end;
  end;
end;

procedure TForm1.svsrtClick(Sender: TObject);
var i:integer;
    ft:textfile;
begin
 if savedialog1.execute then
  begin
   assignfile(ft,savedialog1.filename);
   rewrite(ft);
   for i:=1 to nzap do
    with stud[i] do writeln(ft,i,'.',per1,' ',per4,' ',nzap);
   closefile(ft);

  end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 if flg then closefile(fz);

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if flg then
    CloseFile(Fz);
end;

end.
