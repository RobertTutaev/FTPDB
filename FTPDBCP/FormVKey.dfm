object FormKey: TFormKey
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = #1042#1074#1077#1076#1080#1090#1077' '#1079#1085#1072#1095#1077#1085#1080#1077' '#1082#1083#1102#1095#1072
  ClientHeight = 186
  ClientWidth = 496
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 496
    Height = 151
    Align = alClient
    BevelKind = bkTile
    TabOrder = 0
    object MemoKey: TMemo
      Left = 1
      Top = 1
      Width = 490
      Height = 145
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 151
    Width = 496
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Panel3: TPanel
      Left = 296
      Top = 0
      Width = 200
      Height = 35
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
      object BitBtnCancel: TBitBtn
        Left = 103
        Top = 6
        Width = 90
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100
        TabOrder = 0
        OnClick = BitBtnCancelClick
        Kind = bkCancel
      end
      object BitBtnOk: TBitBtn
        Left = 8
        Top = 6
        Width = 89
        Height = 25
        Caption = #1054#1082
        TabOrder = 1
        OnClick = BitBtnOkClick
        Kind = bkOK
      end
    end
  end
end
