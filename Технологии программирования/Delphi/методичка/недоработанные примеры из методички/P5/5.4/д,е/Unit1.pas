unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    ComboBox1: TComboBox;
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure ComboBox1Click(Sender: TObject);
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

procedure Preobraz(var st:string);
var i:integer;
begin
      while (st[1]=' ') do delete(st,1,1);

      i:=1;
      while (i<=length(st)) do
        begin
          if (st[i-1]=' ') and (st[i]=' ') then delete(st,i,1)
          else inc(i);
        end;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
var st:string;
    i:integer;
begin
  if key=#13 then
    begin
      st:=Edit1.Text+' ';
      Preobraz(st);
      ComboBox1.Items.Add(st);
      Edit1.Text:='';
    end;
end;

procedure TForm1.ComboBox1Click(Sender: TObject);
var nst,n,i,kolvoChar,minChar:integer;
    st,s,slovo:string;
begin
  nst:=comboBox1.ItemIndex;
  st:=comboBox1.Items[nst];


  if (RadioGroup1.ItemIndex=0) then
    begin
      kolvoChar:=0;
      minChar:=length(st);
      for i:=1 to length(st) do
        if (st[i]<>' ') then
          begin
            inc(kolvoChar);
            s:=s+st[i];
          end
        else
          begin
            if (minChar>kolvoChar) then
              begin
                minChar:=kolvoChar;
                slovo:=s;
              end;
            s:='';
            kolvoChar:=0;
          end;
      Label2.Caption:=' ����� "'+slovo+'" ���������� ���� '+intToStr(minChar);
    end;

  if (RadioGroup1.ItemIndex=1) then
    begin
      s:=st[1];
      s:=AnsiUpperCase(s);
      st[1]:=s[1];
      for i:=1 to length(st) do
          if (st[i]=' ') then
            begin
              s:=st[i+1];
              s:=AnsiUpperCase(s);
              st[i+1]:=s[1];
            end;
      Label2.Caption:=' '+st;
    end;
end;



procedure TForm1.Button1Click(Sender: TObject);
var txt:textFile;
    s:string;
begin
 assignFile(txt,'In.txt');
 reset(txt);
 s:='';
 while not eof(txt) do
  begin
    readln(txt,s);
    Preobraz(s);
    comboBox1.Items.Add(s);
  end;
 closefile(txt);
end;

end.
