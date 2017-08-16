unit Scan;

interface

uses
  Classes, IBQuery, IBDataBase, Dialogs, Windows, DateUtils,
  IdFTPDBScan, Messages, IdFTPFunctions;

const
  MESSAGE_SCAN=WM_USER+200;
  MESSAGE_SCAN_END=WM_USER+201;
  MESSAGE_SCAN_DESTROY=WM_USER+202;
  CONST_TIME_SLEEP_SCAN=200;

type
  TScan = class(TThread)
  private
    { Private declarations }
    Id             : Cardinal;
    Nomer          : Cardinal;
    IdUserKod      : String;
    Info           : TInfo;
    InfoOld        : String;
    DltTmOut       : Integer;
    DltTm          : Integer;
    DltTmSlp       : Integer;
    fIBQ           : TIBQuery;
    fIBTransaction : TIBTransaction;
    fIBDatabase    : TIBDatabase;
    fIdFTPDBScan   : TIdFTPDBScan;
    procedure Log;
  protected
    procedure Execute; override; 
  public
    constructor Create(Const Opt: TOpt; Const Kod, IdThr, N: Cardinal);
    destructor Destroy; override;
  end;

Const
  DeltaConst1=300;
  DeltaConst2=30;
  DeltaConst3=1000;

implementation

uses SysUtils, ScanService, IdTCPClient, IdFTP, IdTCPConnection;

constructor TScan.Create(Const Opt: TOpt; Const Kod, IdThr, N: Cardinal);
var Pr: Integer;
begin
  inherited Create(False);
  fIBQ:=TIBQuery.Create(fIBQ);
  fIBTransaction:=TIBTransaction.Create(fIBTransaction);
  fIBDatabase:=TIBDatabase.Create(fIBDatabase);
  fIdFTPDBScan:=TIdFTPDBScan.Create(fIdFTPDBScan);

  fIBDatabase.DefaultTransaction:=fIBTransaction;
  fIBTransaction.DefaultDatabase:=fIBDatabase;
  fIBQ.Database:=fIBDatabase;
  fIdFTPDBScan.IBDataSet:=fIBQ;

  fIBTransaction.Params.Clear;
  fIBTransaction.Params.Add('read_committed');
  fIBTransaction.Params.Add('rec_version');
  fIBTransaction.Params.Add('nowait');

  with fIBDatabase do
  begin
    Connected:=False;
    Params.Clear;
    Params.Add('user_name='+Opt.Lgn);
    Params.Add('password='+Opt.Psswrd);
    Params.Add('lc_ctype=WIN1251');
    DatabaseName:=Opt.Hst+ ':'+Opt.Pth;
    LoginPrompt:=False;
  end;

  IdUserKod:='{IDUser:'+IntToStr(Kod)+'}';
  fIdFTPDBScan.IdUser:=Kod;  

  try DltTmOut:=StrToInt(Opt.tmOut)
  except
    on Exception do
    with Info do
    begin
      DltTmOut:=DeltaConst1;
      Text:=IdUserKod+Exception(ExceptObject).Message;
      EventType:=EVENTLOG_WARNING_TYPE;
      Category:=1;
      ID:=fIdFTPDBScan.IdUser;
      Log;
    end;
  end;
  fIdFTPDBScan.ConnectTimeout:=DltTmOut;

  try DltTm:=StrToInt(Opt.tmDelta);
  except
    on Exception do
    with Info do
    begin
      DltTm:=DeltaConst2;
      Text:=IdUserKod+Exception(ExceptObject).Message;
      EventType:=EVENTLOG_WARNING_TYPE;
      Category:=1;
      ID:=fIdFTPDBScan.IdUser;
      Log;
    end;
  end;

  try DltTmSlp:=StrToInt(Opt.tmSleep);
  except
    on Exception do
    with Info do
    begin
      DltTm:=DeltaConst3;
      Text:=IdUserKod+Exception(ExceptObject).Message;
      EventType:=EVENTLOG_WARNING_TYPE;
      Category:=1;
      ID:=fIdFTPDBScan.IdUser;
      Log;
    end;
  end;

  Pr:=3;
  try Pr:=StrToInt(Opt.tpPr);
  except
    on Exception do
    with Info do
    begin
      Text:=IdUserKod+Exception(ExceptObject).Message;
      EventType:=EVENTLOG_WARNING_TYPE;
      Category:=1;
      ID:=fIdFTPDBScan.IdUser;
      Log;
    end;
  end;
  case Pr of
  0: Priority:=tpIdle;
  1: Priority:=tpLowest;
  2: Priority:=tpLower;
  3: Priority:=tpNormal;
  4: Priority:=tpHigher;
  5: Priority:=tpHighest;
  6: Priority:=tpTimeCritical;
  end;

  Id:=IdThr;
  Nomer:=N;
  InfoOld:='';
  FreeOnTerminate:=True;
end;

destructor TScan.Destroy;
begin
  PostThreadMessage(Id, MESSAGE_SCAN_DESTROY, ThreadID, Nomer);

  if fIdFTPDBScan.Connected then fIdFTPDBScan.Disconnect;
  fIBQ.Active:=False;
  fIBDatabase.Connected:=False;

  FreeAndNil(fIBQ);
  FreeAndNil(fIBTransaction);
  FreeAndNil(fIBDatabase);
  FreeAndNil(fIdFTPDBScan);

  inherited Destroy;
end;

procedure TScan.Log;
begin
{$ifdef debug}
  Outputdebugstring(pansiChar(Info.Text));
{$else}
  if Info.Text=InfoOld then Exit;
  FTPDBDaemonService.LogMessage(Info.Text, Info.EventType, Info.Category, Info.ID);
  InfoOld:=Info.Text;
{$endif}
end;

procedure TScan.Execute;
var   StTm: TDateTime;
label loop;
begin
loop:
  try

    While fIBDatabase.TestConnected=False do
      try
        Sleep(DltTmSlp);
        if Terminated then Exit;
        fIBDatabase.Connected:=True;
      except
        on Exception do
        with Info do
        begin
          Text:=IdUserKod+Exception(ExceptObject).Message;
          EventType:=EVENTLOG_ERROR_TYPE;
          Category:=2;
          ID:=fIdFTPDBScan.IdUser;
          Synchronize(Log);
          PostThreadMessage(Id, MESSAGE_SCAN, ThreadID, Nomer);
        end;
      end;

    with fIdFTPDBScan do
    begin
      fIBTransaction.Active:=True;
      LoadOptions;
      fIBTransaction.Active:=False;
      Connect;

      Scan;
      While ScanLoop do
      begin
        PostThreadMessage(Id, MESSAGE_SCAN, ThreadID, Nomer);
        if Terminated then Exit;
      end;

      fIBTransaction.Active:=True;
      SetFilesToIB;
      fIBTransaction.Active:=False;
      Disconnect;
    end;

    PostThreadMessage(Id, MESSAGE_SCAN_END, ThreadID, Nomer);

  except
    on Exception do
    begin
      try if fIdFTPDBScan.Connected then fIdFTPDBScan.Disconnect except end;  
      try if fIBTransaction.Active then fIBTransaction.Rollback except end;

      with Info do
      begin
        Text:=IdUserKod+Exception(ExceptObject).Message;
        EventType:=EVENTLOG_ERROR_TYPE;
        Category:=3;
        ID:=fIdFTPDBScan.IdUser;
      end;
      try Synchronize(Log) except end;
    end;
  end;

  StTm:=IncSecond(Now,DltTm);
  while Now<StTm do
  begin
    Sleep(CONST_TIME_SLEEP_SCAN);
    if Terminated then Exit;
  end;
  goto loop;
end;


end.
