unit ScanService;

interface

uses
  Windows, SvcMgr, ScanMain, SysUtils, IDFTPFunctions;

type
  TFTPDBDaemonService = class(TService)
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceAfterInstall(Sender: TService);
  private
    { Private declarations }
    ScanMain: TScanMain;  
  public
    { Public declarations }
    function GetServiceController: TServiceController; override;
  end;

var
  FTPDBDaemonService: TFTPDBDaemonService;      

implementation

{$R *.DFM}

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  FTPDBDaemonService.Controller(CtrlCode);
end;

function TFTPDBDaemonService.GetServiceController: TServiceController;
begin
  Result:=ServiceController;
end;

procedure TFTPDBDaemonService.ServiceStart(Sender: TService; var Started: Boolean);
begin
  ScanMain:=TScanMain.Create; 
  Started:=True;
end;

procedure TFTPDBDaemonService.ServiceStop(Sender: TService;
  var Stopped: Boolean);
begin
  ScanMain.Terminate;
  Stopped:=True;
end;

procedure TFTPDBDaemonService.ServiceAfterInstall(Sender: TService);
var Opt: TOpt;
    RegMail: TRegMail;
begin
  LoadOptions(Opt);
  If Opt.Pth<>'' then
  begin
    if not FileExists(Opt.Pth) then Opt.Pth:=GetCurrentDir+'\FTPDB.GDB';
    Opt.StType:='0';
    Opt.StType2:='0';
    SaveOptions(Opt);
    Exit;
  end;

  with Opt do
  begin
    Lgn:=    'sysdba';
    Psswrd:= 'masterkey';
    Hst:=    'localhost';
    Pth:=    GetCurrentDir+'\FTPDB.GDB';
    tpPr:=   '2';
    tmOut:=  '10000';
    tmDelta:='300';
    tmSleep:='1000';
    tmReCon:='30';
    StType:= '0';
    StType2:='0';
  end;
  SaveOptions(Opt);

  with RegMail do
  begin
    //f1:='';
    //f2:='';
    //f3:='';
    //dt:=''
    //firm:='';
    Subject:='Registration_FTDB';
    FHost:='mail.ru';
    FName:='rob_t';
    //UsHost:='';
    //UsName:='';
    //UsPassword:='';
    UsPortSMTP:=25;
    //Key:='';
    //IsRegister:='';
  end;
  SaveRegMail(RegMail);
end;

end.
