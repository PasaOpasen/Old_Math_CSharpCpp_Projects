object Form1: TForm1
  Left = 359
  Top = 197
  Width = 654
  Height = 190
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
  object Label1: TLabel
    Left = 8
    Top = 120
    Width = 36
    Height = 13
    Caption = #1054#1090#1074#1077#1090': '
    OnClick = ComboBox1Click
  end
  object Label2: TLabel
    Left = 48
    Top = 120
    Width = 3
    Height = 13
  end
  object Label3: TLabel
    Left = 496
    Top = 48
    Width = 12
    Height = 13
    Caption = '11'
  end
  object Label4: TLabel
    Left = 496
    Top = 80
    Width = 12
    Height = 13
    Caption = '11'
  end
  object Edit1: TEdit
    Left = 8
    Top = 48
    Width = 249
    Height = 21
    TabOrder = 0
    Text = #1042#1074#1077#1076#1080#1090#1077' '#1080' '#1085#1072#1078#1084#1080#1090#1077' Enter'
    OnKeyPress = Edit1KeyPress
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 80
    Width = 249
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    OnClick = ComboBox1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 264
    Top = 48
    Width = 225
    Height = 57
    Caption = 'RadioGroup1'
    Items.Strings = (
      #1078
      #1079)
    TabOrder = 2
    OnClick = RadioGroup1Click
  end
  object Edit2: TEdit
    Left = 512
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object Edit3: TEdit
    Left = 512
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 4
  end
end
