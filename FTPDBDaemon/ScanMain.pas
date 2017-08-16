unit ScanMain;

interface

uses
  Classes, Messages, Scan, ScanTimer, Windows, IDFTPFunctions,  IBQuery,
  IBDataBase, SysUtils, DateUtils;

Const
  CONST_TIME_DELETE_MINUTES=30;
  CONST_TIME_TIMER_SECONDS=10;

type
  TScInf=record
    Scan :  TScan;
    TmVal:  TDateTime;
    KdUsr:  Integer;
    Status: Smallint;
  end;

type
  TScanMain = class(TThread)
  private
    Opt           : TOpt;
    ScInf         : array of TScInf;
    ScanTimer     : TScanTimer;
    Info          : TInfo;
    InfoOld       : String;
    fIBQ          : TIBQuery;
    fIBTransaction: TIBTransaction;
    fIBDatabase   : TIBDatabase;
    procedure Log;
  protected
    procedure Execute; override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses ScanService;

{ TScanMain }

constructor TScanMain.Create;
var RegMail: TRegMail;
    i: Integer;
begin
  inherited Create(False);
  fIBQ:=TIBQuery.Create(fIBQ);
  fIBTransaction:=TIBTransaction.Create(fIBTransaction);
  fIBDatabase:=TIBDatabase.Create(fIBDatabase);

  fIBDatabase.DefaultTransaction:=fIBTransaction;
  fIBTransaction.DefaultDatabase:=fIBDatabase;
  fIBQ.Database:=fIBDatabase;
  fIBQ.SQL.Text:='select kod from ftp_login where act=2 order by host';

  fIBTransaction.Params.Clear;
  fIBTransaction.Params.Add('read_committed');
  fIBTransaction.Params.Add('rec_version');
  fIBTransaction.Params.Add('nowait');

  LoadOptions(Opt);

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

  try
    fIBDatabase.Connected:=True;
    fIBQ.Active:=True;
    fIBQ.FetchAll;
    fIBQ.First;

    LoadReg(RegMail);
    if(RegMail.IsRegister=False)and(fIBQ.RecordCount>1)then
    SetLength(ScInf, 1) else
    SetLength(ScInf, fIBQ.RecordCount);

    for i:=low(ScInf) to high(ScInf) do
    begin
      ScInf[i].Scan:=TScan.Create(Opt, fIBQ.FieldByName('kod').Value, ThreadID, i);
      ScInf[i].TmVal:=Now;
      ScInf[i].KdUsr:=fIBQ.FieldByName('kod').Value;
      ScInf[i].Status:=2;
      fIBQ.Next;
    end;
  finally
    fIBQ.Active:=False;
    fIBDatabase.Connected:=False;

    fIBQ.Free;
    fIBTransaction.Free;
    fIBDatabase.Free;
  end;

  ScanTimer:=TScanTimer.Create(ThreadID, CONST_TIME_TIMER_SECONDS);
  Priority:=tpLowest;
  FreeOnTerminate:=True;
end;

destructor TScanMain.Destroy;
var i: integer;
begin
  try
    for i:=low(ScInf) to high(ScInf) do ScInf[i].Scan.Terminate;
  finally end;
  ScanTimer.Terminate;

  inherited Destroy;
end;

procedure TScanMain.Log;
begin
{$ifdef debug}
  Outputdebugstring(pansiChar(Info.Text));
{$else}
  if Info.Text=InfoOld then Exit;
  FTPDBDaemonService.LogMessage(Info.Text, Info.EventType, Info.Category, Info.ID);
  InfoOld:=Info.Text;
{$endif}
end;

procedure TScanMain.Execute;
var i, Tm  : Integer;
    msg: TMsg;
begin
  try Tm:=StrToInt(Opt.tmReCon);
  except Tm:=CONST_TIME_DELETE_MINUTES; end;

  repeat
    GetMessage(Msg,0,0,0);
    case Msg.message of

    MESSAGE_SCAN:
      ScInf[Msg.lParam].TmVal:=Now;

    MESSAGE_SCAN_END:;

    MESSAGE_SCAN_DESTROY:
      ScInf[Msg.lParam].Status:=0;

    MESSAGE_TIMER:
      begin
        if Terminated then Exit;         
        for i:=low(ScInf) to high(ScInf) do
          if IncMinute(ScInf[i].TmVal,Tm)<Now then
          try
            Case ScInf[i].Status of
            0:begin
                ScInf[i].Status:=2;
                ScInf[i].TmVal:=Now;
                ScInf[i].Scan:=TScan.Create(Opt, ScInf[i].KdUsr, ThreadID, i);
              end;
            1:begin
                TerminateThread(ScInf[i].Scan.Handle, 0);
                ScInf[i].Status:=0;
              end;
            2:begin
                ScInf[i].Scan.Terminate;
                ScInf[i].Status:=1;
              end;
            End;
          except
            on Exception do
            begin
              with Info do
              begin
                Text:='{IDUser:'+IntToStr(ScInf[i].KdUsr)+'}{MAIN_THREAD}'+Exception(ExceptObject).Message;
                EventType:=EVENTLOG_ERROR_TYPE;
                Category:=4;
                ID:=ScInf[i].KdUsr;
              end;
              try Synchronize(Log) except end;
            end;
          end;
        end;
    end;
    if Terminated then Exit;
  until False;
end;

end.
