object IWServerController: TIWServerController
  OldCreateOrder = False
  OnCreate = IWServerControllerBaseCreate
  OnDestroy = IWServerControllerBaseDestroy
  AuthBeforeNewSession = False
  AllowSubFolders = False
  AppName = 'FTPDBWeb'
  CharSet = 'Windows-1251'
  CacheExpiry = 120
  ComInitialization = ciNone
  Compression.Enabled = False
  Compression.Level = 6
  Description = 'Show FTP resources'
  DebugHTML = True
  Log = loFile
  EnableImageToolbar = False
  ExceptionDisplayMode = smNewWindow
  ExecCmd = 'EXEC'
  HistoryEnabled = False
  InternalFilesURL = '/'
  Browser32Behaviour.Netscape4As32 = True
  Browser32Behaviour.Netscape6As32 = True
  Browser32Behaviour.IExplorer4As32 = True
  PageTransitions = True
  Port = 8888
  ReEntryOptions.AutoCreateSession = False
  RestrictIPs = False
  RestrictSubnet = False
  RedirectMsgDelay = 1
  ServerResizeTimeout = 5
  SessionTrackingMethod = tmHidden
  ShowResyncWarning = True
  SessionTimeout = 5
  SupportedBrowsers = [brIE, brNetscape7, brOpera, brSafari, brNetscape6, brOther]
  SSLOptions.NonSSLRequest = nsAccept
  SSLOptions.Port = 0
  ThreadPoolSize = 32
  UnknownBrowserAction = ubReject
  UseInternalFiles = False
  Version = '8.0.1'
  OnCloseSession = IWServerControllerBaseCloseSession
  OnNewSession = IWServerControllerBaseNewSession
  Height = 310
  Width = 342
  object Timer1: TTimer
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 32
    Top = 16
  end
end
