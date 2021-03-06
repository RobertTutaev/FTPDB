unit DataModuleFTPDBDCP;

interface

uses
  SysUtils, Classes, DB, IBDatabase, IBCustomDataSet, IBTable,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdFTP, IdFTPDBScan, IdFTPScan;

type
  TDataModuleFTPDBDaemon = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBTableOptions: TIBTable;
    procedure IBDatabase1AfterConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleFTPDBDaemon: TDataModuleFTPDBDaemon;

implementation

{$R *.dfm}

procedure TDataModuleFTPDBDaemon.IBDatabase1AfterConnect(Sender: TObject);
var i: Integer;
begin
  for i:=0 to IBDatabase1.DataSetCount-1 do
    try IBDatabase1.DataSets[i].Active:=True except end;
end;   


end.
