object Form1: TForm1
  Left = 192
  Top = 107
  BorderStyle = bsToolWindow
  Caption = '010101010111101'
  ClientHeight = 484
  ClientWidth = 281
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LabelText: TLabel
    Left = 8
    Top = 233
    Width = 24
    Height = 13
    Caption = 'Text:'
  end
  object ButtonEasyCode: TButton
    Left = 8
    Top = 23
    Width = 130
    Height = 25
    Caption = 'ButtonEasyCode'
    TabOrder = 0
    OnClick = ButtonEasyCodeClick
  end
  object ButtonEasyDecode: TButton
    Left = 144
    Top = 23
    Width = 130
    Height = 25
    Caption = 'ButtonEasyDecode'
    TabOrder = 1
    OnClick = ButtonEasyDecodeClick
  end
  object ButtonGenKey: TButton
    Left = 8
    Top = 202
    Width = 266
    Height = 25
    Caption = 'ButtonGenKey'
    TabOrder = 2
    OnClick = ButtonGenKeyClick
  end
  object MemoIn: TMemo
    Left = 8
    Top = 252
    Width = 266
    Height = 224
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object ButtonHardCode: TButton
    Left = 8
    Top = 70
    Width = 130
    Height = 43
    Caption = 'ButtonHardCode'
    TabOrder = 4
    OnClick = ButtonHardCodeClick
  end
  object ButtonHardDecode: TButton
    Left = 144
    Top = 70
    Width = 130
    Height = 43
    Caption = 'ButtonHardDecode'
    TabOrder = 5
    OnClick = ButtonHardDecodeClick
  end
  object Button1: TButton
    Left = 8
    Top = 168
    Width = 265
    Height = 28
    Caption = 'GetKeySNDA'
    TabOrder = 6
    OnClick = Button1Click
  end
end
