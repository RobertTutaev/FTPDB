object IWFormAdmin: TIWFormAdmin
  Left = 0
  Top = 0
  Width = 555
  Height = 438
  ConnectionMode = cmAny
  SupportedBrowsers = [brIE, brNetscape7, brOpera, brSafari, brNetscape6]
  OnCreate = IWAppFormCreate
  OnDestroy = IWAppFormDestroy
  AllowPageAccess = True
  BrowserSecurityCheck = True
  Background.Fixed = False
  HandleTabs = False
  LeftToRight = True
  LockUntilLoaded = True
  LockOnSubmit = True
  ShowHint = True
  XPTheme = True
  UpdateMode = umPartial
  DesignLeft = 8
  DesignTop = 8
  object IWRegion1: TIWRegion
    Left = 0
    Top = 0
    Width = 555
    Height = 54
    Cursor = crAuto
    Align = alTop
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsSolid
    BorderOptions.Color = clNone
    Color = clWebAZURE
    ParentShowHint = False
    ShowHint = True
    ZIndex = 1000
    Splitter = False
    object IWLink1: TIWLink
      Left = 49
      Top = 18
      Width = 49
      Height = 17
      Cursor = crAuto
      Hint = #1053#1072#1079#1072#1076
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Alignment = taLeftJustify
      Color = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = [fsUnderline]
      ScriptEvents = <>
      DoSubmitValidation = False
      FriendlyName = 'IWLink1'
      OnClick = IWLink1Click
      TabOrder = 0
      RawText = False
      Caption = #1053#1072#1079#1072#1076
    end
    object IWImageButtonBackup: TIWImageButton
      Left = 18
      Top = 15
      Width = 24
      Height = 24
      Cursor = crAuto
      Hint = #1053#1072#1079#1072#1076
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = False
      BorderOptions.Color = clNone
      BorderOptions.Width = 0
      DoSubmitValidation = True
      ScriptEvents = <>
      TabOrder = -1
      UseSize = False
      OnClick = IWLink1Click
      Cacheable = True
      FriendlyName = 'IWImageButtonBackup'
      ImageFile.Filename = 'D:\'#1052#1077#1083#1086#1095#1100'\FTPDB\FTPDBWeb\Files\btnBackup.jpg'
    end
  end
  object IWRegion2: TIWRegion
    Left = 56
    Top = 71
    Width = 297
    Height = 137
    Cursor = crAuto
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsSolid
    BorderOptions.Color = clNone
    Color = clWebWHITESMOKE
    ParentShowHint = False
    ShowHint = True
    ZIndex = 1000
    Splitter = False
    object IWEditUser: TIWEdit
      Left = 120
      Top = 38
      Width = 145
      Height = 21
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Alignment = taLeftJustify
      BGColor = clNone
      FocusColor = clNone
      DoSubmitValidation = True
      Editable = True
      NonEditableAsLabel = True
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'IWEditUser'
      MaxLength = 0
      ReadOnly = False
      Required = False
      ScriptEvents = <>
      TabOrder = 1
      PasswordPrompt = False
    end
    object IWEditPassword: TIWEdit
      Left = 120
      Top = 65
      Width = 145
      Height = 21
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Alignment = taLeftJustify
      BGColor = clNone
      FocusColor = clNone
      DoSubmitValidation = True
      Editable = True
      NonEditableAsLabel = True
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FriendlyName = 'IWEditPassword'
      MaxLength = 0
      ReadOnly = False
      Required = False
      ScriptEvents = <>
      TabOrder = 2
      PasswordPrompt = True
    end
    object IWLabel1: TIWLabel
      Left = 24
      Top = 40
      Width = 99
      Height = 16
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = False
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      NoWrap = False
      ConvertSpaces = False
      FriendlyName = 'IWLabel1'
      Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1072#1090#1086#1088
      RawText = False
    end
    object IWLabel2: TIWLabel
      Left = 24
      Top = 66
      Width = 47
      Height = 16
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = False
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      NoWrap = False
      ConvertSpaces = False
      FriendlyName = 'IWLabel2'
      Caption = #1055#1072#1088#1086#1083#1100
      RawText = False
    end
    object IWLinkSave: TIWLink
      Left = 200
      Top = 12
      Width = 65
      Height = 17
      Cursor = crAuto
      Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = True
      Alignment = taLeftJustify
      Color = clNone
      Font.Color = clWebGREEN
      Font.Size = 10
      Font.Style = [fsUnderline]
      ScriptEvents = <>
      DoSubmitValidation = False
      FriendlyName = 'IWLinkSave'
      OnClick = IWLinkSaveClick
      TabOrder = 3
      RawText = False
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    end
    object IWImageButton1: TIWImageButton
      Left = 120
      Top = 98
      Width = 100
      Height = 21
      Cursor = crAuto
      Hint = #1042#1093#1086#1076
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = False
      BorderOptions.Color = clNone
      BorderOptions.Width = 0
      DoSubmitValidation = True
      ScriptEvents = <>
      TabOrder = -1
      UseSize = False
      OnClick = IWButtonEnterClick
      Cacheable = True
      FriendlyName = 'IWImageButton1'
      ImageFile.Filename = 'D:\'#1052#1077#1083#1086#1095#1100'\FTPDB\FTPDBWebClient\Files\btnConnect.bmp'
    end
  end
end
