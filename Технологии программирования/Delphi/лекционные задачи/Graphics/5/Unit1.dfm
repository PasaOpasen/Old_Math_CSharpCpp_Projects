object Form1: TForm1
  Left = 192
  Top = 127
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 16
    Top = 8
    Width = 881
    Height = 297
    Color = clBtnFace
    ParentColor = False
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 320
    Width = 129
    Height = 49
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object Edit1: TEdit
    Left = 320
    Top = 320
    Width = 577
    Height = 21
    TabOrder = 1
    Text = #1058#1077#1087#1077#1088#1100' '#1090#1077#1082#1089#1090' '#1074#1099#1075#1083#1103#1076#1080#1090' '#1090#1072#1082
  end
  object Button1: TButton
    Left = 160
    Top = 320
    Width = 153
    Height = 49
    Caption = #1064#1088#1080#1092#1090
    TabOrder = 2
    OnClick = Button1Click
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 240
    Top = 384
  end
end
