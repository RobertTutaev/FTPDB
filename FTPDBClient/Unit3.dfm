object FormOptions: TFormOptions
  Left = 206
  Top = 140
  BorderStyle = bsDialog
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 488
  ClientWidth = 398
  Color = 13497844
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clNavy
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 398
    Height = 455
    ActivePage = TabSheetDB
    Align = alClient
    MultiLine = True
    Style = tsFlatButtons
    TabOrder = 0
    object TabSheetDB: TTabSheet
      Caption = '1. '#1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' '#1041#1044
      object PanelDPLogin: TPanel
        Left = 8
        Top = 155
        Width = 377
        Height = 59
        BevelInner = bvRaised
        BevelOuter = bvLowered
        ParentColor = True
        TabOrder = 0
        object GroupBox2: TGroupBox
          Left = 2
          Top = 2
          Width = 373
          Height = 55
          Align = alClient
          Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
          TabOrder = 0
          object Label3: TLabel
            Left = 8
            Top = 24
            Width = 29
            Height = 14
            Caption = #1051#1086#1075#1080#1085
          end
          object Label4: TLabel
            Left = 184
            Top = 24
            Width = 37
            Height = 14
            Caption = #1055#1072#1088#1086#1083#1100
          end
          object SpeedButtonPass: TSpeedButton
            Left = 232
            Top = 18
            Width = 23
            Height = 22
            Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555775777777
              57705557757777775FF7555555555555000755555555555F777F555555555550
              87075555555555F7577F5555555555088805555555555F755F75555555555033
              805555555555F755F75555555555033B05555555555F755F75555555555033B0
              5555555555F755F75555555555033B05555555555F755F75555555555033B055
              55555555F755F75555555555033B05555555555F755F75555555555033B05555
              555555F75FF75555555555030B05555555555F7F7F75555555555000B0555555
              5555F777F7555555555501900555555555557777755555555555099055555555
              5555777755555555555550055555555555555775555555555555}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButtonPassClick
          end
          object EditLgn: TEdit
            Left = 48
            Top = 20
            Width = 121
            Height = 22
            Hint = #1051#1086#1075#1080#1085' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object EditPsswrd: TEdit
            Left = 272
            Top = 20
            Width = 33
            Height = 22
            Hint = #1055#1072#1088#1086#1083#1100' '#1072#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088#1072' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
            ParentShowHint = False
            PasswordChar = '*'
            ShowHint = True
            TabOrder = 1
            Visible = False
          end
        end
      end
      object PanelDBPath: TPanel
        Left = 8
        Top = 37
        Width = 377
        Height = 105
        BevelInner = bvRaised
        BevelOuter = bvLowered
        ParentColor = True
        TabOrder = 1
        object GroupBox1: TGroupBox
          Left = 2
          Top = 2
          Width = 373
          Height = 101
          Align = alClient
          Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
          TabOrder = 0
          object Label1: TLabel
            Left = 16
            Top = 48
            Width = 100
            Height = 14
            Caption = #1055#1091#1090#1100' '#1082' '#1073#1072#1079#1077' '#1076#1072#1085#1085#1099#1093
          end
          object SpeedButtonFind: TSpeedButton
            Left = 336
            Top = 64
            Width = 25
            Height = 22
            Hint = #1048#1079#1084#1077#1085#1077#1085#1080#1077' '#1087#1091#1090#1080' '#1082' '#1073#1072#1079#1077' '#1076#1072#1085#1085#1099#1093
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
              6666660006666660006660FFF066660FFF060C87FF0660C87FF00CC87F0660CC
              87F000CCC006600CCC006000080660F0000660F7880000F78806660F80000007
              80666600080660F00066660F880000F880666660F80000F706666660F80880F8
              0666666600066000666666660806608066666666666666666666}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButtonFindClick
          end
          object Label2: TLabel
            Left = 16
            Top = 24
            Width = 107
            Height = 14
            Caption = #1057#1077#1088#1074#1077#1088' '#1073#1072#1079#1099' '#1076#1072#1085#1085#1099#1093
          end
          object SpeedButton1: TSpeedButton
            Left = 300
            Top = 20
            Width = 61
            Height = 25
            Hint = #1055#1088#1086#1074#1077#1088#1082#1072' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103' '#1082' '#1073#1072#1079#1077' '#1076#1072#1085#1085#1099#1093
            Caption = #1058#1077#1089#1090
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000003
              333333333F777773FF333333008888800333333377333F3773F3333077870787
              7033333733337F33373F3308888707888803337F33337F33337F330777880887
              7703337F33337FF3337F3308888000888803337F333777F3337F330777700077
              7703337F33377733337FB3088888888888033373FFFFFFFFFF733B3000000000
              0033333777777777773333BBBB3333080333333333F3337F7F33BBBB707BB308
              03333333373F337F7F3333BB08033308033333337F7F337F7F333B3B08033308
              033333337F73FF737F33B33B778000877333333373F777337333333B30888880
              33333333373FFFF73333333B3300000333333333337777733333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton1Click
          end
          object EditPth: TEdit
            Left = 16
            Top = 64
            Width = 321
            Height = 23
            Hint = #1055#1091#1090#1100' '#1082' '#1073#1072#1079#1077' '#1076#1072#1085#1085#1099#1093
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clMaroon
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object EditHst: TEdit
            Left = 136
            Top = 21
            Width = 129
            Height = 22
            Hint = 'DNS-'#1080#1084#1103' ("localhost" - '#1077#1089#1083#1080' '#1083#1086#1082#1072#1083#1100#1085#1086')'
            ParentColor = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
          end
        end
      end
    end
    object TabSheetFTP_HOST: TTabSheet
      Caption = '2. '#1055#1086#1076#1082#1083#1102#1095#1077#1085#1080#1077' '#1082' FTP'
      ImageIndex = 1
      object SpeedButtonAdd: TSpeedButton
        Left = 14
        Top = 8
        Width = 23
        Height = 21
        Hint = #1055#1077#1088#1077#1081#1090#1080'/'#1044#1086#1073#1072#1074#1080#1090#1100
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666660006666660006660FFF066660FFF060C78FF0660C78FF00CC78F0660CC
          78F000CCC006600CCC006000070660F0000660F8770000F87706660F70000008
          70666600070660F00066660F770000F770666660F70000F809666660F70770F7
          0966666600066009999966660706607069666666666666666966}
        ParentShowHint = False
        ShowHint = True
        OnClick = AddHost
      end
      object PanelFTP_HOST: TPanel
        Left = 8
        Top = 37
        Width = 377
        Height = 345
        BevelInner = bvRaised
        BevelOuter = bvLowered
        ParentColor = True
        TabOrder = 0
        object GroupBox3: TGroupBox
          Left = 2
          Top = 72
          Width = 373
          Height = 271
          Align = alBottom
          Caption = #1055#1088#1086#1076#1074#1080#1085#1091#1090#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
          TabOrder = 0
          object Label7: TLabel
            Left = 16
            Top = 28
            Width = 157
            Height = 28
            Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1085#1080#1077' PASV-'#1082#1086#1084#1072#1085#1076' '#1089#1077#1088#1074#1077#1088#1086#1084' (False)'
            WordWrap = True
          end
          object Label12: TLabel
            Left = 13
            Top = 68
            Width = 160
            Height = 14
            Caption = #1058#1080#1087' '#1087#1077#1088#1077#1076#1072#1095#1080' '#1092#1072#1081#1083#1086#1074' (ftBinary)'
            WordWrap = True
          end
          object DBLookupComboBoxPASSIVE: TDBLookupComboBox
            Left = 208
            Top = 28
            Width = 65
            Height = 22
            DataField = 'PASSIVE'
            DataSource = FTPDB_GDB.DataSource3
            KeyField = 'KOD'
            ListField = 'BLN'
            ListSource = FTPDB_GDB.DataSource4
            TabOrder = 0
          end
          object DBLookupComboBoxTRANSFERTYPE: TDBLookupComboBox
            Left = 208
            Top = 68
            Width = 105
            Height = 22
            DataField = 'TRANSFERTYPE'
            DataSource = FTPDB_GDB.DataSource3
            KeyField = 'KOD'
            ListField = 'TRANSFERTYPE'
            ListSource = FTPDB_GDB.DataSource7
            TabOrder = 1
          end
        end
        object GroupBox4: TGroupBox
          Left = 2
          Top = 2
          Width = 373
          Height = 63
          Align = alTop
          Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
          TabOrder = 1
          object Label5: TLabel
            Left = 16
            Top = 26
            Width = 54
            Height = 14
            Caption = 'IP '#1089#1077#1088#1074#1077#1088#1072
          end
          object Label6: TLabel
            Left = 217
            Top = 26
            Width = 48
            Height = 14
            Caption = #1055#1086#1088#1090' (21)'
          end
          object DBEditHOST: TDBEdit
            Left = 80
            Top = 24
            Width = 89
            Height = 22
            DataField = 'HOST'
            DataSource = FTPDB_GDB.DataSource3
            TabOrder = 0
          end
          object DBEditPORT: TDBEdit
            Left = 272
            Top = 24
            Width = 49
            Height = 22
            DataField = 'PORT'
            DataSource = FTPDB_GDB.DataSource3
            TabOrder = 1
          end
        end
      end
      object DBNavigatorFTP_HOST: TDBNavigator
        Left = 91
        Top = 398
        Width = 189
        Height = 18
        DataSource = FTPDB_GDB.DataSource3
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbPost, nbCancel]
        Hints.Strings = (
          #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
          #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
          #1057#1083#1077#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
          #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
          #1042#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
          #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
          #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
          #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          #1047#1072#1082#1086#1085#1095#1080#1090#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
          #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077)
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object TabSheetFTP_LOGIN: TTabSheet
      Caption = '3. '#1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100' FTP'
      ImageIndex = 2
      object SpeedButton2Add: TSpeedButton
        Left = 14
        Top = 8
        Width = 23
        Height = 21
        Hint = #1055#1077#1088#1077#1081#1090#1080'/'#1044#1086#1073#1072#1074#1080#1090#1100
        Flat = True
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00666666666666
          6666660006666660006660FFF066660FFF060C78FF0660C78FF00CC78F0660CC
          78F000CCC006600CCC006000070660F0000660F8770000F87706660F70000008
          70666600070660F00066660F770000F770666660F70000F809666660F70770F7
          0966666600066009999966660706607069666666666666666966}
        ParentShowHint = False
        ShowHint = True
        OnClick = AddLogin
      end
      object PanelFTP_LOGIN: TPanel
        Left = 8
        Top = 37
        Width = 377
        Height = 345
        BevelInner = bvRaised
        BevelOuter = bvLowered
        ParentColor = True
        TabOrder = 0
        object GroupBox5: TGroupBox
          Left = 2
          Top = 2
          Width = 373
          Height = 119
          Align = alTop
          Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
          TabOrder = 0
          object Label13: TLabel
            Left = 16
            Top = 90
            Width = 54
            Height = 14
            Caption = 'IP '#1089#1077#1088#1074#1077#1088#1072
          end
          object Label14: TLabel
            Left = 200
            Top = 20
            Width = 71
            Height = 28
            Caption = #1051#1086#1075#1080#1085'-daemon (False)'
            WordWrap = True
          end
          object Label15: TLabel
            Left = 16
            Top = 24
            Width = 29
            Height = 14
            Caption = #1051#1086#1075#1080#1085
          end
          object Label16: TLabel
            Left = 16
            Top = 56
            Width = 37
            Height = 14
            Caption = #1055#1072#1088#1086#1083#1100
          end
          object SpeedButton2Pass: TSpeedButton
            Left = 80
            Top = 56
            Width = 23
            Height = 22
            Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555775777777
              57705557757777775FF7555555555555000755555555555F777F555555555550
              87075555555555F7577F5555555555088805555555555F755F75555555555033
              805555555555F755F75555555555033B05555555555F755F75555555555033B0
              5555555555F755F75555555555033B05555555555F755F75555555555033B055
              55555555F755F75555555555033B05555555555F755F75555555555033B05555
              555555F75FF75555555555030B05555555555F7F7F75555555555000B0555555
              5555F777F7555555555501900555555555557777755555555555099055555555
              5555777755555555555550055555555555555775555555555555}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton2PassClick
          end
          object DBText2HOST: TDBText
            Left = 80
            Top = 90
            Width = 69
            Height = 14
            AutoSize = True
            DataField = 'HOST'
            DataSource = FTPDB_GDB.DataSource3
          end
          object DBEdit2LOGIN: TDBEdit
            Left = 80
            Top = 24
            Width = 89
            Height = 22
            DataField = 'LOGIN'
            DataSource = FTPDB_GDB.DataSource8
            TabOrder = 0
          end
          object DBLookupComboBox2ACT: TDBLookupComboBox
            Left = 280
            Top = 24
            Width = 65
            Height = 22
            DataField = 'ACT'
            DataSource = FTPDB_GDB.DataSource8
            KeyField = 'KOD'
            ListField = 'BLN'
            ListSource = FTPDB_GDB.DataSource4
            TabOrder = 1
          end
          object DBEdit2PASS: TDBEdit
            Left = 112
            Top = 56
            Width = 89
            Height = 22
            DataField = 'PASS'
            DataSource = FTPDB_GDB.DataSource8
            ParentColor = True
            PasswordChar = '*'
            TabOrder = 2
            Visible = False
          end
        end
        object GroupBox6: TGroupBox
          Left = 2
          Top = 128
          Width = 373
          Height = 215
          Align = alBottom
          Caption = #1055#1088#1086#1076#1074#1080#1085#1091#1090#1099#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
          TabOrder = 1
          object Label17: TLabel
            Left = 16
            Top = 23
            Width = 96
            Height = 28
            Caption = 'IP '#1087#1088#1086#1082#1089#1080'-'#1089#1077#1088#1074#1077#1088#1072' ('#1087#1091#1089#1090#1086')'
            WordWrap = True
          end
          object Label18: TLabel
            Left = 16
            Top = 61
            Width = 123
            Height = 28
            Caption = #1051#1086#1075#1080#1085' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1087#1088#1086#1082#1089#1080'-'#1089#1077#1088#1074#1077#1088#1072' ('#1087#1091#1089#1090#1086')'
            WordWrap = True
          end
          object Label19: TLabel
            Left = 16
            Top = 101
            Width = 123
            Height = 28
            Caption = #1055#1072#1088#1086#1083#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103' '#1087#1088#1086#1082#1089#1080'-'#1089#1077#1088#1074#1077#1088#1072' ('#1087#1091#1089#1090#1086')'
            WordWrap = True
          end
          object Label20: TLabel
            Left = 216
            Top = 20
            Width = 99
            Height = 28
            Caption = #1055#1086#1088#1090' '#1087#1088#1086#1082#1089#1080'-'#1089#1077#1088#1074#1077#1088#1072' (0)'
            WordWrap = True
          end
          object Label21: TLabel
            Left = 16
            Top = 187
            Width = 193
            Height = 14
            Caption = #1042#1088#1077#1084#1103' '#1086#1078#1080#1076#1072#1085#1080#1103' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103' (0), '#1084#1089
            WordWrap = True
          end
          object Label22: TLabel
            Left = 16
            Top = 141
            Width = 106
            Height = 28
            Caption = #1058#1080#1087' '#1087#1088#1086#1082#1089#1080'-'#1089#1077#1088#1074#1077#1088#1072' (fpcmNone)'
            WordWrap = True
          end
          object SpeedButton2PPass: TSpeedButton
            Left = 168
            Top = 104
            Width = 23
            Height = 22
            Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1087#1072#1088#1086#1083#1100
            Flat = True
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555775777777
              57705557757777775FF7555555555555000755555555555F777F555555555550
              87075555555555F7577F5555555555088805555555555F755F75555555555033
              805555555555F755F75555555555033B05555555555F755F75555555555033B0
              5555555555F755F75555555555033B05555555555F755F75555555555033B055
              55555555F755F75555555555033B05555555555F755F75555555555033B05555
              555555F75FF75555555555030B05555555555F7F7F75555555555000B0555555
              5555F777F7555555555501900555555555557777755555555555099055555555
              5555777755555555555550055555555555555775555555555555}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton2PPassClick
          end
          object DBEdit2PHOST: TDBEdit
            Left = 120
            Top = 23
            Width = 89
            Height = 22
            DataField = 'PHOST'
            DataSource = FTPDB_GDB.DataSource8
            TabOrder = 0
          end
          object DBEdit2PLOGIN: TDBEdit
            Left = 168
            Top = 63
            Width = 89
            Height = 22
            DataField = 'PLOGIN'
            DataSource = FTPDB_GDB.DataSource8
            TabOrder = 1
          end
          object DBEdit2PPASS: TDBEdit
            Left = 200
            Top = 104
            Width = 89
            Height = 22
            DataField = 'PPASS'
            DataSource = FTPDB_GDB.DataSource8
            ParentColor = True
            PasswordChar = '*'
            TabOrder = 2
            Visible = False
          end
          object DBEdit2PPORT: TDBEdit
            Left = 248
            Top = 185
            Width = 65
            Height = 22
            DataField = 'PPORT'
            DataSource = FTPDB_GDB.DataSource8
            TabOrder = 3
          end
          object DBEdit2READTIMEOUT: TDBEdit
            Left = 320
            Top = 23
            Width = 41
            Height = 22
            DataField = 'READTIMEOUT'
            DataSource = FTPDB_GDB.DataSource8
            TabOrder = 4
          end
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 168
            Top = 144
            Width = 89
            Height = 22
            DataField = 'PPROXYTYPE'
            DataSource = FTPDB_GDB.DataSource8
            KeyField = 'KOD'
            ListField = 'PROXYTYPE'
            ListSource = FTPDB_GDB.DataSource6
            TabOrder = 5
          end
        end
      end
      object DBNavigatorFTP_LOGIN: TDBNavigator
        Left = 91
        Top = 398
        Width = 189
        Height = 18
        DataSource = FTPDB_GDB.DataSource8
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbPost, nbCancel]
        Hints.Strings = (
          #1055#1077#1088#1074#1072#1103' '#1079#1072#1087#1080#1089#1100
          #1055#1088#1077#1076#1099#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
          #1057#1083#1077#1076#1091#1097#1072#1103' '#1079#1072#1087#1080#1089#1100
          #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1079#1072#1087#1080#1089#1100
          #1042#1089#1090#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
          #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
          #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
          #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
          #1047#1072#1082#1086#1085#1095#1080#1090#1100' '#1088#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
          #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077)
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 455
    Width = 398
    Height = 33
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    ParentColor = True
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 80
      Top = 5
      Width = 113
      Height = 22
      Caption = #1055#1086#1076#1090#1074#1077#1088#1076#1080#1090#1100
      Default = True
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 200
      Top = 5
      Width = 107
      Height = 22
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
      Kind = bkCancel
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.GDB'
    Filter = '*.GDB|*.GDB'
    Left = 342
    Top = 10
  end
end
