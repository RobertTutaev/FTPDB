program FTPDBDaemon;

uses
  SvcMgr,
  SysUtils,
  ServiceManager,
  ScanService in 'ScanService.pas' {FTPDBDaemonService: TService},
  Scan in 'Scan.pas',
  ScanMain in 'ScanMain.pas',
  ScanTimer in 'ScanTimer.pas',
  IDFTPFunctions;

{$R *.RES}

var
  SM: TServiceManager;
  i: Integer;
  Opt: TOpt;

Const
  CONST_COUNT_LOOP_SERVICE=2000;

begin
  if LowerCase(paramstr(1))='/start' then
  begin
    try
      SM:=TServiceManager.Create;
      if SM.Connect then
      begin
        for i:=1 to CONST_COUNT_LOOP_SERVICE do
        if SM.OpenServiceConnection('FTPDBDaemonService') then
        begin
          SM.StartService; Break;
        end;
      end;
    finally
      SM.Free;
    end;
    Exit;
  end;

  if LowerCase(paramstr(1))='/stop' then
  begin
    try
      SM:=TServiceManager.Create;
      if SM.Connect then
      begin
        for i:=1 to CONST_COUNT_LOOP_SERVICE do
        if SM.OpenServiceConnection('FTPDBDaemonService') then
        begin
          SM.StopService; Break;
        end;
      end;
    finally
      SM.Free;
    end;
    Exit;
  end;

  LoadOptions(Opt);
  if(Opt.StType='0')or
    (LowerCase(paramstr(1))='/install')or
    (LowerCase(paramstr(1))='/uninstall')then
  begin
    Application.Initialize;
    Application.CreateForm(TFTPDBDaemonService, FTPDBDaemonService);
    Application.Run;
  end;
end.
