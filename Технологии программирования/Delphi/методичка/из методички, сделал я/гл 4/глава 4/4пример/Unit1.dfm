object Form1: TForm1
  Left = 296
  Top = 259
  Width = 770
  Height = 443
  Caption = '4 '#1091#1087#1088#1072#1078#1085#1077#1085#1080#1077'. '#1055#1040#1057#1068#1050#1054
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 48
    Width = 275
    Height = 24
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1088#1072#1079#1084#1077#1088#1086#1089#1090#1100' '#1084#1072#1090#1088#1080#1094#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 96
    Width = 406
    Height = 24
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1082#1086#1084#1087#1086#1085#1077#1085#1090#1099' '#1084#1072#1090#1088#1080#1094#1099' '#1040' '#1080' '#1074#1077#1082#1090#1086#1088#1072' b'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object StringGrid1: TStringGrid
    Left = 32
    Top = 128
    Width = 265
    Height = 241
    DefaultColWidth = 50
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    TabOrder = 0
    OnClick = StringGrid1Click
  end
  object StringGrid2: TStringGrid
    Left = 312
    Top = 128
    Width = 73
    Height = 241
    ColCount = 1
    FixedCols = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    ParentFont = False
    TabOrder = 1
  end
  object StringGrid3: TStringGrid
    Left = 536
    Top = 128
    Width = 73
    Height = 241
    ColCount = 1
    FixedCols = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object Button1: TButton
    Left = 392
    Top = 208
    Width = 129
    Height = 57
    Caption = 'A*b='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 304
    Top = 48
    Width = 57
    Height = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object Button2: TButton
    Left = 368
    Top = 48
    Width = 369
    Height = 25
    Caption = #1047#1072#1092#1080#1082#1089#1080#1088#1086#1074#1072#1090#1100' '#1088#1072#1079#1084#1077#1088#1085#1086#1089#1090#1100' '#1084#1072#1090#1088#1080#1094#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Button2Click
  end
  object OpenDialog1: TOpenDialog
    Filter = #1060#1072#1081#1083' '#1076#1072#1085#1085#1099#1093'|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Left = 128
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Filter = #1060#1072#1081#1083' '#1076#1072#1085#1085#1099#1093'|*.txt'
    Left = 96
    Top = 8
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 8
    object N1: TMenuItem
      Caption = #1055#1088#1086#1095#1077#1089#1090#1100' '#1080#1079' '#1092#1072#1081#1083#1072
      object N2: TMenuItem
        Caption = #1056#1072#1079#1084#1077#1088#1085#1086#1089#1090#1100' '#1084#1072#1090#1088#1080#1094#1099
        OnClick = N2Click
      end
      object N3: TMenuItem
        Caption = #1052#1072#1090#1088#1080#1094#1091
        OnClick = N3Click
      end
      object N4: TMenuItem
        Caption = #1042#1077#1082#1090#1086#1088
        OnClick = N4Click
      end
      object D1: TMenuItem
        Caption = #1042#1089#1105
        OnClick = D1Click
      end
    end
  end
end
