object Form1: TForm1
  Left = 306
  Top = 290
  Width = 916
  Height = 491
  Caption = #1047#1072#1076#1072#1085#1080#1077' 2. '#1057#1086#1079#1076#1072#1085#1080#1077' '#1090#1088#1077#1091#1075#1086#1083#1100#1085#1080#1082#1072' ('#1055#1040#1057#1068#1050#1054' '#1044'. '#1040'. 33.1)'
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 24
  object Label1: TLabel
    Left = 8
    Top = 120
    Width = 120
    Height = 24
    Caption = #1089#1090#1086#1088#1086#1085#1072' AB ='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object PaintBox1: TPaintBox
    Left = 456
    Top = 8
    Width = 433
    Height = 433
    Color = clGreen
    ParentColor = False
  end
  object Label2: TLabel
    Left = 8
    Top = 160
    Width = 121
    Height = 24
    Caption = #1089#1090#1086#1088#1086#1085#1072' AC ='
  end
  object Label3: TLabel
    Left = 8
    Top = 200
    Width = 120
    Height = 24
    Caption = #1089#1090#1086#1088#1086#1085#1072' BC ='
  end
  object Label4: TLabel
    Left = 200
    Top = 176
    Width = 187
    Height = 24
    Caption = #1091#1075#1086#1083' A ('#1074' '#1075#1088#1072#1076#1091#1089#1072#1093') ='
  end
  object Label5: TLabel
    Left = 200
    Top = 144
    Width = 186
    Height = 24
    Caption = #1091#1075#1086#1083' B ('#1074' '#1075#1088#1072#1076#1091#1089#1072#1093') ='
  end
  object Button1: TButton
    Left = 88
    Top = 248
    Width = 265
    Height = 57
    Caption = #1048#1079#1086#1073#1088#1072#1079#1080#1090#1100
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -31
    Font.Name = 'Constantia'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 136
    Top = 120
    Width = 41
    Height = 32
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 136
    Top = 160
    Width = 41
    Height = 32
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 136
    Top = 200
    Width = 41
    Height = 32
    TabOrder = 3
  end
  object Edit4: TEdit
    Left = 392
    Top = 176
    Width = 41
    Height = 32
    TabOrder = 4
  end
  object Edit5: TEdit
    Left = 392
    Top = 136
    Width = 41
    Height = 32
    TabOrder = 5
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 433
    Height = 105
    Caption = #1047#1072#1076#1072#1090#1100' '#1090#1088#1077#1091#1075#1086#1083#1100#1085#1080#1082':'
    Color = clGreen
    Items.Strings = (
      #1055#1086' '#1090#1088#1077#1084' '#1089#1090#1086#1088#1086#1085#1072#1084
      #1055#1086' '#1076#1074#1091#1084' '#1089#1090#1086#1088#1086#1085#1072#1084' '#1080' '#1091#1075#1083#1091' '#1084#1077#1078#1076#1091' '#1085#1080#1084#1080
      #1055#1086' '#1089#1090#1086#1088#1086#1085#1077' '#1080' '#1087#1088#1080#1083#1077#1078#1072#1097#1080#1084' '#1082' '#1085#1077#1081' '#1076#1074#1091#1084' '#1091#1075#1083#1072#1084)
    ParentColor = False
    TabOrder = 6
    OnClick = RadioGroup1Click
  end
  object Button2: TButton
    Left = 248
    Top = 400
    Width = 201
    Height = 33
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100' PaintBox'
    TabOrder = 7
    OnClick = Button2Click
  end
end
