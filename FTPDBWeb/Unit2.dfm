object IWFormMain: TIWFormMain
  Left = 0
  Top = 0
  Width = 818
  Height = 773
  VertScrollBar.Increment = 69
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
  LockOnSubmit = False
  ShowHint = True
  XPTheme = True
  UpdateMode = umPartial
  DesignLeft = 8
  DesignTop = 8
  object IWRegionMain: TIWRegion
    Left = 0
    Top = 54
    Width = 284
    Height = 719
    Cursor = crAuto
    HorzScrollBar.Visible = False
    VertScrollBar.Increment = 64
    Align = alLeft
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwThin
    BorderOptions.Style = cbsSolid
    BorderOptions.Color = clWebMEDIUMSEAGREEN
    Color = clWebAZURE
    ParentShowHint = False
    ShowHint = True
    ZIndex = 1000
    Splitter = False
    object IWImageButton1: TIWImageButton
      Left = 142
      Top = 15
      Width = 118
      Height = 24
      Cursor = crAuto
      Hint = #1055#1088#1080#1084#1077#1085#1080#1090#1100
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
      OnClick = SetQueryFiles
      Cacheable = True
      FriendlyName = 'IWImageButton1'
      ImageFile.Filename = 'D:\'#1052#1077#1083#1086#1095#1100'\FTPDB\FTPDBWebClient\Files\btnExecute.bmp'
    end
    object IWImage2: TIWImage
      Left = 18
      Top = 11
      Width = 32
      Height = 32
      Cursor = crAuto
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
      Picture.Data = {
        055449636F6E0000010001002020100000000000E80200001600000028000000
        2000000040000000010004000000000080020000000000000000000000000000
        0000000000000000000080000080000000808000800000008000800080800000
        80808000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000
        FFFFFF0000000000000000EEEE000000000000000000000000EEEEEEEEEEEE00
        0000000000000000EEEEEEEEEEEEEEEE000000000000000EEEEEEEEEEEEEEEEE
        E000000000000EEEEEEEEEEEEEEEEEEEEEE000000000EEEEEEEEEEEEEEEEEEEE
        EEEE00000000EEEEEEEEEEEEEEEEEEEEEEEE0000000EEEEEEEEEEEEEEEEEEEEE
        EEEEE00000EEEEEEEEEEEEEEEEEEEEEEEEEEEE0000EEEEEEEEEEEEEEEEEEEEEE
        EEEEEE000EEEDDDEEEEEEEEDDDEEEEDDDEEEEEE00EEEDDDEEEEEEEEDDDEEEEDD
        DEEEEEE00EEEDDDEEEEEEEEDDDEEEEDDDEEEEEE0EEEEDDDDDDEEEEEDDDEEEEDD
        DDDDEEEEEEEEDDDDDDEEEEEDDDEEEEDDDDDDDEEEEEEEDDDDDDEEEEEDDDEEEEDD
        DDDDDDEEEEEEDDDEEEEEEEEDDDEEEEDDDEEDDDEEEEEEDDDEEEEEEEEDDDEEEEDD
        DEEDDDEEEEEEDDDEEEEEEEEDDDEEEEDDDEEDDDEE0EEEDDDDDDDEDDDDDDDDDEDD
        DDDDDDE00EEEDDDDDDDEDDDDDDDDDEDDDDDDDEE00EEEDDDDDDDEDDDDDDDDDEDD
        DDDDEEE000EEEEEEEEEEEEEEEEEEEEEEEEEEEE0000EEEEEEEEEEEEEEEEEEEEEE
        EEEEEE00000EEEEEEEEEEEEEEEEEEEEEEEEEE0000000EEEEEEEEEEEEEEEEEEEE
        EEEE00000000EEEEEEEEEEEEEEEEEEEEEEEE000000000EEEEEEEEEEEEEEEEEEE
        EEE000000000000EEEEEEEEEEEEEEEEEE000000000000000EEEEEEEEEEEEEEEE
        000000000000000000EEEEEEEEEEEE000000000000000000000000EEEE000000
        00000000FFFC3FFFFFC003FFFF0000FFFE00007FF800001FF000000FF000000F
        E0000007C0000003C00000038000000180000001800000010000000000000000
        00000000000000000000000000000000800000018000000180000001C0000003
        C0000003E0000007F000000FF000000FF800001FFE00007FFF0000FFFFC003FF
        FFFC3FFF}
      FriendlyName = 'IWImage1'
      TransparentColor = clNone
      JpegOptions.CompressionQuality = 90
      JpegOptions.Performance = jpBestSpeed
      JpegOptions.ProgressiveEncoding = False
      JpegOptions.Smoothing = True
      OutputType = ioJPEG
    end
    object IWLabel2: TIWLabel
      Left = 18
      Top = 33
      Width = 101
      Height = 13
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = False
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clNone
      Font.Size = 8
      Font.Style = []
      NoWrap = False
      ConvertSpaces = False
      FriendlyName = 'IWLabel2'
      Caption = 'FTPDBWeb v.1.5.1'
      RawText = False
    end
    object IWLabelDemo: TIWLabel
      Left = 56
      Top = 19
      Width = 39
      Height = 16
      Cursor = crAuto
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = False
      Alignment = taLeftJustify
      BGColor = clNone
      Font.Color = clWebRED
      Font.Size = 10
      Font.Style = [fsBold, fsItalic]
      NoWrap = False
      ConvertSpaces = False
      FriendlyName = 'IWLabelDemo'
      Caption = 'Demo'
      RawText = False
    end
    object IWRegion1: TIWRegion
      Left = 18
      Top = 54
      Width = 248
      Height = 92
      Cursor = crAuto
      BorderOptions.NumericWidth = 1
      BorderOptions.BorderWidth = cbwNumeric
      BorderOptions.Style = cbsSolid
      BorderOptions.Color = clWebMEDIUMSEAGREEN
      Color = clWebLIGHTCYAN
      ParentShowHint = False
      ShowHint = True
      ZIndex = 1000
      Splitter = False
      object IWComboBoxSort: TIWComboBox
        Left = 44
        Top = 33
        Width = 121
        Height = 21
        Cursor = crAuto
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = True
        BGColor = clNone
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FocusColor = clNone
        AutoHideOnMenuActivation = False
        ItemsHaveValues = False
        NoSelectionText = '-- No Selection --'
        Required = False
        RequireSelection = True
        ScriptEvents = <>
        UseSize = True
        Style = stNormal
        ButtonColor = clBtnFace
        DoSubmitValidation = True
        Editable = True
        NonEditableAsLabel = True
        TabOrder = 0
        ItemIndex = 0
        Items.Strings = (
          #1055#1091#1090#1100
          #1056#1072#1079#1084#1077#1088
          #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103
          #1060#1072#1081#1083)
        Sorted = False
        FriendlyName = 'IWComboBoxSort'
      end
      object IWLabel1: TIWLabel
        Left = 11
        Top = 8
        Width = 169
        Height = 19
        Cursor = crAuto
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = False
        Alignment = taLeftJustify
        BGColor = clNone
        Font.Color = clNone
        Font.Size = 12
        Font.Style = []
        NoWrap = False
        ConvertSpaces = False
        FriendlyName = 'IWLabel1'
        Caption = 'C'#1086#1088#1090#1080#1088#1086#1074#1082#1072' '#1087#1086' '#1087#1086#1083#1102
        RawText = False
      end
      object IWLabel10: TIWLabel
        Left = 11
        Top = 58
        Width = 160
        Height = 19
        Cursor = crAuto
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = False
        Alignment = taLeftJustify
        BGColor = clNone
        Font.Color = clNone
        Font.Size = 12
        Font.Style = []
        NoWrap = False
        ConvertSpaces = False
        FriendlyName = 'IWLabel1'
        Caption = #1055#1086#1088#1094#1080#1103' '#1089#1095#1080#1090#1099#1074#1072#1085#1080#1103
        RawText = False
      end
      object IWDBLookupComboBoxRowLimit: TIWDBLookupComboBox
        Left = 177
        Top = 59
        Width = 65
        Height = 21
        Cursor = crAuto
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = True
        BGColor = clNone
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FocusColor = clNone
        AutoHideOnMenuActivation = False
        ItemsHaveValues = False
        NoSelectionText = '...'
        Required = False
        RequireSelection = True
        ScriptEvents = <>
        UseSize = True
        Style = stNormal
        ButtonColor = clBtnFace
        DoSubmitValidation = True
        Editable = True
        NonEditableAsLabel = True
        TabOrder = 16
        AutoEditable = False
        FriendlyName = 'IWDBLookupRowLimit'
        KeyField = 'KOD'
        ListField = 'ROWLIMIT'
        ListSource = IWUserSession.DataSourceROWLIMIT
        DisableWhenEmpty = True
      end
    end
    object IWRegion7: TIWRegion
      Left = 18
      Top = 153
      Width = 248
      Height = 143
      Cursor = crAuto
      BorderOptions.NumericWidth = 1
      BorderOptions.BorderWidth = cbwNumeric
      BorderOptions.Style = cbsSolid
      BorderOptions.Color = clWebMEDIUMSEAGREEN
      Color = clWebLIGHTCYAN
      ParentShowHint = False
      ShowHint = True
      ZIndex = 1000
      Splitter = False
      object IWLabelF1: TIWLabel
        Left = 11
        Top = 6
        Width = 116
        Height = 19
        Cursor = crAuto
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = False
        Alignment = taLeftJustify
        BGColor = clNone
        Font.Color = clNone
        Font.Size = 12
        Font.Style = []
        NoWrap = False
        ConvertSpaces = False
        FriendlyName = 'IWLabelF1'
        Caption = #1060#1080#1083#1100#1090#1088' - '#1044#1072#1090#1072
        RawText = False
      end
      object IWEdit11: TIWEdit
        Left = 44
        Top = 112
        Width = 81
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
        FriendlyName = 'IWEdit11'
        MaxLength = 0
        ReadOnly = False
        Required = False
        ScriptEvents = <>
        TabOrder = 1
        PasswordPrompt = False
      end
      object IWEdit12: TIWEdit
        Left = 161
        Top = 112
        Width = 81
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
        FriendlyName = 'IWEdit12'
        MaxLength = 0
        ReadOnly = False
        Required = False
        ScriptEvents = <>
        TabOrder = 3
        PasswordPrompt = False
      end
      object IWLabel11: TIWLabel
        Left = 28
        Top = 112
        Width = 28
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
        FriendlyName = 'IWLabel11'
        Caption = #1089'     '
        RawText = False
      end
      object IWLabel12: TIWLabel
        Left = 140
        Top = 112
        Width = 15
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
        FriendlyName = 'IWLabel12'
        Caption = #1087#1086
        RawText = False
      end
      object IWRadioGroup1: TIWRadioGroup
        Left = 34
        Top = 31
        Width = 179
        Height = 74
        Cursor = crAuto
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = False
        Editable = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'IWRadioGroup1'
        ItemIndex = 0
        Items.Strings = (
          #1051#1102#1073#1072#1103
          #1047#1072' '#1089#1077#1075#1086#1076#1085#1103
          #1047#1072' '#1085#1077#1076#1077#1083#1102' (7 '#1076#1085#1077#1081')'
          #1044#1088#1091#1075#1072#1103' '#1076#1072#1090#1072)
        Layout = glVertical
        ScriptEvents = <>
        TabOrder = 2
      end
    end
    object IWRegion8: TIWRegion
      Left = 18
      Top = 303
      Width = 248
      Height = 162
      Cursor = crAuto
      BorderOptions.NumericWidth = 1
      BorderOptions.BorderWidth = cbwNumeric
      BorderOptions.Style = cbsSolid
      BorderOptions.Color = clWebMEDIUMSEAGREEN
      Color = clWebLIGHTCYAN
      ParentShowHint = False
      ShowHint = True
      ZIndex = 1000
      Splitter = False
      object IWLabeF2: TIWLabel
        Left = 11
        Top = 6
        Width = 134
        Height = 19
        Cursor = crAuto
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = False
        Alignment = taLeftJustify
        BGColor = clNone
        Font.Color = clNone
        Font.Size = 12
        Font.Style = []
        NoWrap = False
        ConvertSpaces = False
        FriendlyName = 'IWLabel2'
        Caption = #1060#1080#1083#1100#1090#1088' - '#1056#1072#1079#1084#1077#1088
        RawText = False
      end
      object IWEdit21: TIWEdit
        Left = 44
        Top = 130
        Width = 81
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
        FriendlyName = 'IWEdit11'
        MaxLength = 0
        ReadOnly = False
        Required = False
        ScriptEvents = <>
        TabOrder = 4
        PasswordPrompt = False
      end
      object IWEdit22: TIWEdit
        Left = 161
        Top = 130
        Width = 81
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
        FriendlyName = 'IWEdit12'
        MaxLength = 0
        ReadOnly = False
        Required = False
        ScriptEvents = <>
        TabOrder = 5
        PasswordPrompt = False
      end
      object IWLabel4: TIWLabel
        Left = 28
        Top = 130
        Width = 18
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
        FriendlyName = 'IWLabel11'
        Caption = #1086#1090' '
        RawText = False
      end
      object IWLabel5: TIWLabel
        Left = 140
        Top = 130
        Width = 15
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
        FriendlyName = 'IWLabel12'
        Caption = #1076#1086
        RawText = False
      end
      object IWRadioGroup2: TIWRadioGroup
        Left = 34
        Top = 31
        Width = 195
        Height = 101
        Cursor = crAuto
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = False
        Editable = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'IWRadioGroup2'
        ItemIndex = 0
        Items.Strings = (
          #1051#1102#1073#1086#1081
          #1052#1072#1083#1077#1085#1100#1082#1080#1081' ('#1084#1077#1085#1077#1077' 100'#1050#1073')'
          #1057#1088#1077#1076#1085#1080#1081' ('#1084#1077#1085#1077#1077' 1'#1052#1073')'
          #1041#1086#1083#1100#1096#1086#1081' ('#1073#1086#1083#1077#1077' 1'#1052#1073')'
          #1044#1088#1091#1075#1086#1081' ('#1074' '#1050#1073')')
        Layout = glVertical
        ScriptEvents = <>
        TabOrder = 7
      end
    end
    object IWRegion9: TIWRegion
      Left = 18
      Top = 472
      Width = 248
      Height = 152
      Cursor = crAuto
      BorderOptions.NumericWidth = 1
      BorderOptions.BorderWidth = cbwNumeric
      BorderOptions.Style = cbsSolid
      BorderOptions.Color = clWebMEDIUMSEAGREEN
      Color = clWebLIGHTCYAN
      ParentShowHint = False
      ShowHint = True
      ZIndex = 1000
      Splitter = False
      object IWLabelF3: TIWLabel
        Left = 11
        Top = 6
        Width = 152
        Height = 19
        Cursor = crAuto
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = False
        Alignment = taLeftJustify
        BGColor = clNone
        Font.Color = clNone
        Font.Size = 12
        Font.Style = []
        NoWrap = False
        ConvertSpaces = False
        FriendlyName = 'IWLabel2'
        Caption = #1060#1080#1083#1100#1090#1088' - '#1053#1072#1079#1074#1072#1085#1080#1077
        RawText = False
      end
      object IWEdit31: TIWEdit
        Left = 44
        Top = 74
        Width = 198
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
        FriendlyName = 'IWEdit11'
        MaxLength = 0
        ReadOnly = False
        Required = False
        ScriptEvents = <>
        TabOrder = 6
        PasswordPrompt = False
      end
      object IWRadioGroup3: TIWRadioGroup
        Left = 34
        Top = 31
        Width = 85
        Height = 44
        Cursor = crAuto
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = False
        Editable = True
        Font.Color = clNone
        Font.Size = 10
        Font.Style = []
        FriendlyName = 'IWRadioGroup3'
        ItemIndex = 0
        Items.Strings = (
          #1051#1102#1073#1086#1077
          #1059#1082#1072#1079#1072#1090#1100)
        Layout = glVertical
        ScriptEvents = <>
        TabOrder = 8
      end
      object IWText1: TIWText
        Left = 59
        Top = 99
        Width = 169
        Height = 44
        Cursor = crAuto
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = False
        BGColor = clNone
        ConvertSpaces = False
        Font.Color = clNone
        Font.Size = 9
        Font.Style = []
        FriendlyName = 'IWText1'
        Lines.Strings = (
          #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
          '"*", "%" - '#1080#1076#1077#1085#1090#1080#1095#1085#1099
          '"&"+"#" - '#1085#1077' '#1076#1086#1087#1091#1089#1090#1080#1084#1099)
        RawText = False
        UseFrame = False
        WantReturns = True
      end
    end
  end
  object IWRegion3: TIWRegion
    Left = 0
    Top = 0
    Width = 818
    Height = 54
    Cursor = crAuto
    HorzScrollBar.Color = clCream
    HorzScrollBar.ParentColor = False
    Align = alTop
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsNone
    BorderOptions.Color = clNone
    Color = clNone
    ParentShowHint = False
    ShowHint = True
    ZIndex = 1000
    Splitter = False
    object IWImageFile: TIWImageFile
      Left = 2
      Top = 2
      Width = 500
      Height = 50
      Cursor = crAuto
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
      Cacheable = True
      FriendlyName = 'IWImageFile'
      ImageFile.Filename = 'MAINPIC.GIF'
    end
    object IWRegion10: TIWRegion
      Left = 577
      Top = 0
      Width = 241
      Height = 54
      Cursor = crAuto
      Align = alRight
      BorderOptions.NumericWidth = 1
      BorderOptions.BorderWidth = cbwNumeric
      BorderOptions.Style = cbsNone
      BorderOptions.Color = clNone
      Color = clNone
      ParentShowHint = False
      ShowHint = True
      ZIndex = 1000
      Splitter = False
      object IWLinkLogin: TIWLink
        Left = 4
        Top = 8
        Width = 157
        Height = 22
        Cursor = crAuto
        Hint = #1057#1084#1077#1085#1072' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = True
        Alignment = taLeftJustify
        Color = clNone
        Font.Color = clWebNAVY
        Font.Size = 11
        Font.Style = [fsItalic, fsUnderline]
        ScriptEvents = <>
        DoSubmitValidation = False
        FriendlyName = 'IWLinkLogin'
        OnClick = IWLinkLoginClick
        TabOrder = 12
        RawText = False
        Caption = #1057#1084#1077#1085#1072' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      end
      object IWLinkScan: TIWLink
        Left = 3
        Top = 28
        Width = 230
        Height = 22
        Cursor = crAuto
        Hint = 
          #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100'/'#1087#1077#1088#1077#1086#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1086#1073#1083#1072#1089#1090#1100' '#1074#1080#1076#1080#1084#1086#1089#1090#1080' '#1076#1083#1103' '#1076#1072#1085#1085#1086#1075#1086' '#1087#1086#1083#1100#1079#1086#1074#1072 +
          #1090#1077#1083#1103
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = True
        Alignment = taLeftJustify
        Color = clNone
        Font.Color = clWebGREEN
        Font.Size = 11
        Font.Style = [fsItalic, fsUnderline]
        ScriptEvents = <>
        DoSubmitValidation = False
        FriendlyName = 'IWLinkLogin'
        OnClick = IWLinkScanClick
        TabOrder = 13
        RawText = False
        Caption = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100' '#1086#1073#1083#1072#1089#1090#1100' '#1074#1080#1076#1080#1084#1086#1089#1090#1080
      end
      object IWLinkExit: TIWLink
        Left = 160
        Top = 8
        Width = 63
        Height = 22
        Cursor = crAuto
        Hint = #1047#1072#1074#1077#1088#1096#1080#1090#1100' '#1089#1077#1089#1089#1080#1102' Web-'#1089#1077#1088#1074#1077#1088#1072' '#1076#1083#1103' '#1076#1072#1085#1085#1086#1075#1086' '#1087#1086#1076#1082#1083#1102#1095#1077#1085#1080#1103
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = True
        Alignment = taLeftJustify
        Color = clNone
        Font.Color = clWebMAROON
        Font.Size = 11
        Font.Style = [fsBold, fsItalic, fsUnderline]
        ScriptEvents = <>
        DoSubmitValidation = False
        FriendlyName = 'IWLinkLogin'
        OnClick = IWLinkExitClick
        TabOrder = 14
        RawText = False
        Caption = #1042#1099#1093#1086#1076
      end
    end
  end
  object IWRegion5: TIWRegion
    Left = 284
    Top = 54
    Width = 534
    Height = 719
    Cursor = crAuto
    Align = alClient
    BorderOptions.NumericWidth = 1
    BorderOptions.BorderWidth = cbwNumeric
    BorderOptions.Style = cbsSolid
    BorderOptions.Color = clNone
    Color = clNone
    ParentShowHint = False
    ShowHint = True
    ZIndex = 1000
    Splitter = False
    object IWDBGridFiles: TIWDBGrid
      Left = 1
      Top = 54
      Width = 532
      Height = 664
      Cursor = crAuto
      ExtraTagParams.Strings = (
        'ftp')
      Align = alClient
      IW50Hint = False
      ParentShowHint = False
      ShowHint = True
      ZIndex = 0
      RenderSize = False
      BorderColors.Color = clNone
      BorderColors.Light = clNone
      BorderColors.Dark = clNone
      BGColor = clWebLAVENDER
      BorderSize = 1
      BorderStyle = tfDefault
      CellPadding = 0
      CellSpacing = 0
      Font.Color = clNone
      Font.Size = 10
      Font.Style = []
      FrameBuffer = 40
      Lines = tlAll
      UseFrame = True
      UseSize = True
      ScrollToCurrentRow = False
      Columns = <
        item
          Alignment = taLeftJustify
          BGColor = clNone
          DoSubmitValidation = True
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          Header = False
          Height = '0'
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = True
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = #1055#1091#1090#1100
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.Color = clNone
          Title.Font.Size = 10
          Title.Font.Style = []
          Title.Header = False
          Title.Height = '0'
          Title.Text = #1055#1091#1090#1100
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = False
          Title.RawText = True
        end
        item
          Alignment = taLeftJustify
          BGColor = clNone
          DoSubmitValidation = True
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          Header = False
          Height = '0'
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = True
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = #1060#1072#1081#1083
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.Color = clNone
          Title.Font.Size = 10
          Title.Font.Style = []
          Title.Header = False
          Title.Height = '0'
          Title.Text = #1060#1072#1081#1083
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = False
          Title.RawText = True
        end
        item
          Alignment = taRightJustify
          BGColor = clNone
          DoSubmitValidation = True
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          Header = False
          Height = '0'
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = #1056#1072#1079#1084#1077#1088', '#1050#1041
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.Color = clNone
          Title.Font.Size = 10
          Title.Font.Style = []
          Title.Header = False
          Title.Height = '0'
          Title.Text = #1056#1072#1079#1084#1077#1088', '#1050#1041
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = False
          Title.RawText = False
        end
        item
          Alignment = taCenter
          BGColor = clNone
          DoSubmitValidation = True
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          Header = False
          Height = '0'
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = #1044#1072#1090#1072
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.Color = clNone
          Title.Font.Size = 10
          Title.Font.Style = []
          Title.Header = False
          Title.Height = '0'
          Title.Text = #1044#1072#1090#1072
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = False
          Title.RawText = False
        end
        item
          Alignment = taCenter
          BGColor = clNone
          DoSubmitValidation = True
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          Header = False
          Height = '0'
          VAlign = vaMiddle
          Visible = True
          Width = '0'
          Wrap = False
          RawText = False
          BlobCharLimit = 0
          CompareHighlight = hcNone
          DataField = #1042#1088#1077#1084#1103
          Title.Alignment = taCenter
          Title.BGColor = clNone
          Title.DoSubmitValidation = True
          Title.Font.Color = clNone
          Title.Font.Size = 10
          Title.Font.Style = []
          Title.Header = False
          Title.Height = '0'
          Title.Text = #1042#1088#1077#1084#1103
          Title.VAlign = vaMiddle
          Title.Visible = True
          Title.Width = '0'
          Title.Wrap = False
          Title.RawText = False
        end>
      DataSource = IWUserSession.DataSourceFiles
      FooterRowCount = 0
      FriendlyName = 'IWDBGridFiles'
      FromStart = False
      HighlightColor = clNone
      HighlightRows = False
      Options = [dgShowTitles]
      RefreshMode = rmAutomatic
      RowLimit = 100
      RollOver = False
      RowClick = False
      RollOverColor = clNone
      RowHeaderColor = clNone
      RowAlternateColor = clNone
      RowCurrentColor = clNone
      TabOrder = -1
      ExplicitLeft = -4
      ExplicitTop = 59
      ExplicitWidth = 546
    end
    object IWRegion4: TIWRegion
      Left = 1
      Top = 1
      Width = 532
      Height = 53
      Cursor = crAuto
      VertScrollBar.Style = ssHotTrack
      Align = alTop
      BorderOptions.NumericWidth = 1
      BorderOptions.BorderWidth = cbwThin
      BorderOptions.Style = cbsNone
      BorderOptions.Color = clWebMEDIUMSEAGREEN
      Color = clWebAZURE
      ParentShowHint = False
      ShowHint = True
      ZIndex = 1000
      Splitter = False
      object IWLabelFilesCount: TIWLabel
        Left = 343
        Top = 20
        Width = 72
        Height = 16
        Cursor = crAuto
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = False
        Alignment = taLeftJustify
        BGColor = clNone
        Font.Color = clWebGREEN
        Font.Size = 10
        Font.Style = [fsBold]
        NoWrap = False
        ConvertSpaces = False
        FriendlyName = 'IWLabel8'
        Caption = '['#1042#1089#1077#1075#1086': 0]'
        RawText = False
      end
      object IWLink1: TIWLink
        Left = 204
        Top = 17
        Width = 133
        Height = 24
        Cursor = crAuto
        IW50Hint = False
        ParentShowHint = False
        ShowHint = True
        ZIndex = 0
        RenderSize = True
        Alignment = taLeftJustify
        Color = clNone
        Font.Color = clWebMAROON
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        ScriptEvents = <>
        DoSubmitValidation = False
        FriendlyName = 'IWLink1'
        OnClick = IWLink1Click
        TabOrder = 15
        RawText = False
        Caption = #1057#1087#1080#1089#1086#1082' '#1092#1072#1081#1083#1086#1074
      end
      object IWRegion6: TIWRegion
        Left = 467
        Top = 0
        Width = 65
        Height = 53
        Cursor = crAuto
        HorzScrollBar.Style = ssFlat
        VertScrollBar.Style = ssFlat
        VertScrollBar.Tracking = True
        Align = alRight
        BorderOptions.NumericWidth = 1
        BorderOptions.BorderWidth = cbwThick
        BorderOptions.Style = cbsNone
        BorderOptions.Color = clNone
        Color = clNone
        ParentShowHint = False
        ShowHint = True
        ZIndex = 1000
        Splitter = False
        object IWImageButton2: TIWImageButton
          Left = 3
          Top = 14
          Width = 56
          Height = 24
          Cursor = crAuto
          Hint = #1051#1086#1075
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
          OnClick = LogClick
          Cacheable = True
          FriendlyName = 'IWImageButton1'
          ImageFile.Filename = 'D:\'#1052#1077#1083#1086#1095#1100'\FTPDB\FTPDBWebClient\Files\btnLog.bmp'
        end
      end
      object IWRegionList: TIWRegion
        Left = 0
        Top = 0
        Width = 168
        Height = 53
        Cursor = crAuto
        Align = alLeft
        BorderOptions.NumericWidth = 1
        BorderOptions.BorderWidth = cbwNumeric
        BorderOptions.Style = cbsNone
        BorderOptions.Color = clWebMEDIUMSEAGREEN
        Color = clNone
        ParentShowHint = False
        ShowHint = True
        ZIndex = 1000
        Splitter = False
        object IWComboBoxList: TIWComboBox
          Left = 61
          Top = 16
          Width = 60
          Height = 21
          Cursor = crAuto
          IW50Hint = False
          ParentShowHint = False
          ShowHint = True
          ZIndex = 0
          RenderSize = True
          BGColor = clNone
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          FocusColor = clNone
          AutoHideOnMenuActivation = False
          ItemsHaveValues = False
          NoSelectionText = '-- No Selection --'
          Required = False
          RequireSelection = True
          ScriptEvents = <>
          OnChange = IWComboBoxListChange
          UseSize = True
          Style = stNormal
          ButtonColor = clBtnFace
          DoSubmitValidation = True
          Editable = True
          NonEditableAsLabel = True
          TabOrder = 9
          ItemIndex = -1
          Sorted = False
          FriendlyName = 'IWComboBoxList'
        end
        object IWButtonList1: TIWButton
          Left = 32
          Top = 16
          Width = 23
          Height = 21
          Cursor = crAuto
          IW50Hint = False
          ParentShowHint = False
          ShowHint = True
          ZIndex = 0
          RenderSize = True
          Caption = '<'
          DoSubmitValidation = True
          Color = clBtnFace
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          FriendlyName = 'IWButtonList1'
          ScriptEvents = <>
          TabOrder = 10
          OnClick = IWButtonList1Click
        end
        object IWButtonList2: TIWButton
          Left = 126
          Top = 16
          Width = 23
          Height = 21
          Cursor = crAuto
          IW50Hint = False
          ParentShowHint = False
          ShowHint = True
          ZIndex = 0
          RenderSize = True
          Caption = '>'
          DoSubmitValidation = True
          Color = clBtnFace
          Font.Color = clNone
          Font.Size = 10
          Font.Style = []
          FriendlyName = 'IWButtonList2'
          ScriptEvents = <>
          TabOrder = 11
          OnClick = IWButtonList2Click
        end
      end
    end
  end
end
