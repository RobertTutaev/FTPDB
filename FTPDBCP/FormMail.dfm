object FormEMail: TFormEMail
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1042#1072#1096' '#1087#1086#1095#1090#1086#1074#1099#1081' '#1103#1097#1080#1082
  ClientHeight = 197
  ClientWidth = 317
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object RichEdit1: TRichEdit
    Left = 0
    Top = 0
    Width = 317
    Height = 65
    Align = alTop
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Lines.Strings = (
      #1044#1083#1103' '#1074#1086#1079#1084#1086#1078#1085#1086#1089#1090#1080' '#1088#1072#1073#1086#1090#1099' '#1089' '#1074#1072#1096#1080#1084' '#1087#1086#1095#1090#1086#1074#1099#1084' '#1103#1097#1080#1082#1086#1084' '
      #1085#1077#1086#1073#1093#1086#1076#1080#1084#1086':'
      ''
      '1. '#1063#1090#1086#1073#1099' '#1087#1086#1095#1090#1086#1074#1099#1081' '#1089#1077#1088#1074#1077#1088', '#1085#1072' '#1082#1086#1090#1086#1088#1086#1084' '#1079#1072#1074#1077#1076#1077#1085' '#1074#1072#1096' '
      #1087#1086#1095#1090#1086#1074#1099#1081' '#1103#1097#1080#1082', '#1073#1099#1083' '#1074#1080#1076#1077#1085' '#1074' '#1089#1077#1090#1080' '#1089' '#1076#1072#1085#1085#1086#1075#1086' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1072
      ''
      '2. '#1053#1072' '#1087#1086#1095#1090#1086#1074#1086#1084' '#1089#1077#1088#1074#1077#1088#1077' '#1080' '#1085#1072' '#1076#1072#1085#1085#1086#1084' '#1082#1086#1084#1087#1100#1102#1090#1077#1088#1077' '#1073#1099#1083' '
      #1086#1090#1082#1088#1099#1090' '#1087#1086#1088#1090' '#1089' '#1085#1086#1084#1077#1088#1086#1084' 25 ('#1074' '#1089#1086#1086#1090#1074#1077#1090#1089#1074#1080#1080' '#1089#1086' '#1089#1090#1072#1085#1076#1072#1088#1090#1086#1084' '
      'SMTP)'
      ''
      #1042#1074#1077#1076#1077#1085#1085#1099#1077' '#1074' '#1101#1090#1091' '#1092#1086#1088#1084#1091' '#1076#1072#1085#1085#1099#1077' '#1086#1089#1090#1072#1085#1091#1090#1089#1103' '
      #1082#1086#1085#1092#1080#1076#1077#1085#1094#1080#1072#1083#1100#1085#1099#1084#1080'!')
    ParentColor = True
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 8
    Top = 71
    Width = 301
    Height = 119
    ParentColor = True
    TabOrder = 1
    object Label1: TLabel
      Left = 20
      Top = 56
      Width = 37
      Height = 13
      Caption = #1055#1072#1088#1086#1083#1100
    end
    object Label2: TLabel
      Left = 20
      Top = 29
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object EditUsEmail: TEdit
      Left = 98
      Top = 26
      Width = 151
      Height = 21
      TabOrder = 0
    end
    object EditUsPassword: TEdit
      Left = 98
      Top = 53
      Width = 151
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 98
      Top = 80
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      TabOrder = 2
      OnClick = OkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
end
