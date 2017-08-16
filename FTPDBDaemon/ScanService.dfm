object FTPDBDaemonService: TFTPDBDaemonService
  OldCreateOrder = False
  AllowPause = False
  DisplayName = 'FTPDBDaemon'
  Interactive = True
  AfterInstall = ServiceAfterInstall
  OnStart = ServiceStart
  OnStop = ServiceStop
  Height = 224
  Width = 267
end
