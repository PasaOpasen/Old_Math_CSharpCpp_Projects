object Form1: TForm1
  Left = 193
  Top = 129
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Courier New'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 21
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 22
    Height = 21
    Caption = 'N='
  end
  object Edit1: TEdit
    Left = 56
    Top = 24
    Width = 41
    Height = 29
    TabOrder = 0
    Text = 'Edit1'
  end
  object StringGrid1: TStringGrid
    Left = 40
    Top = 56
    Width = 281
    Height = 120
    ColCount = 4
    RowCount = 4
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 328
    Top = 56
    Width = 161
    Height = 121
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object Button1: TButton
    Left = 96
    Top = 24
    Width = 225
    Height = 25
    Caption = #1053#1086#1074#1072#1103' '#1088#1072#1079#1084#1077#1088#1085#1086#1089#1090#1100
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 328
    Top = 24
    Width = 161
    Height = 25
    Caption = #1053#1072#1081#1090#1080
    TabOrder = 4
    OnClick = Button2Click
  end
  object MainMenu1: TMainMenu
    Left = 680
    Top = 88
    object N1: TMenuItem
      Caption = #1054#1090#1082#1088#1099#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      OnClick = N2Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'in|*.txt'
    Left = 680
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Filter = 'save|*.txt'
    Left = 680
    Top = 48
  end
end
