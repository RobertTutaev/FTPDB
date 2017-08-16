unit Unit2;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP,
  IdFTPScan, IdFTPDBScan, IBTable, IBEvents, IdExplicitTLSClientServerBase;

type
  TFTPDB_GDB = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    IBQuery2: TIBQuery;
    DataSource2: TDataSource;
    IdFTPDBScan1: TIdFTPDBScan;
    IBDatabase2: TIBDatabase;
    IBTable3: TIBTable;
    DataSource3: TDataSource;
    IBTable4: TIBTable;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    DataSource6: TDataSource;
    IBTable5: TIBTable;
    IBTable6: TIBTable;
    IBTable7: TIBTable;
    DataSource7: TDataSource;
    IBTable8: TIBTable;
    DataSource8: TDataSource;
    IBQueryGet: TIBQuery;
    IBTransaction2: TIBTransaction;
    IBEvents1: TIBEvents;
    procedure IBDatabase1AfterConnect(Sender: TObject);
    procedure IBDatabase1AfterDisconnect(Sender: TObject);
    procedure IBEvents1EventAlert(Sender: TObject; EventName: String;
      EventCount: Integer; var CancelAlerts: Boolean);
    procedure IBQuery1BeforeOpen(DataSet: TDataSet);
    procedure IBQuery2BeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    //procedure
  end;

var
  FTPDB_GDB: TFTPDB_GDB;

Const
  SQLTXT='select v_all as "Полный путь", v_size as "Размер, Кб", v_date as '+
         '"Дата", v_time as "Время", v_name as "Файл" from ';
  SQLTXT2='select s.n as "№", h.host as "Хост", s.dt as "Дата", s.tm as "Время" '+
          'from ftp_scan1 s, ftp_host h where(s.host=h.kod)and(h.host=''';
  SQLTXT3=''')order by n desc';

implementation

uses Unit1, Unit4;

{$R *.dfm}

procedure TFTPDB_GDB.IBDatabase1AfterConnect(Sender: TObject);
var i:   Integer;
begin   
  FormMain.N1.Checked:=IBDatabase1.Connected;

  for i:=0 to IBDatabase1.DataSetCount-1 do
    try IBDatabase1.DataSets[i].Active:=True except end;
  FormLogin.GetP(Sender);
end;

procedure TFTPDB_GDB.IBDatabase1AfterDisconnect(Sender: TObject);
begin
  FormMain.N1.Checked:=False;
end;

procedure TFTPDB_GDB.IBEvents1EventAlert(Sender: TObject;
  EventName: String; EventCount: Integer; var CancelAlerts: Boolean);
begin
  try
    IBQuery2.Active:=False;
    IBQuery2.Active:=True;
  except
  end;  
end;

procedure TFTPDB_GDB.IBQuery1BeforeOpen(DataSet: TDataSet);
begin
With FormMain.Us do
begin
  Case FormMain.ComboBoxSort.ItemIndex of
  0: IBQuery1.SQL.Text:=SQLTXT+'getfiles('''+Host+''', '''+User+''') order by v_all';
  1: IBQuery1.SQL.Text:=SQLTXT+'getfiles('''+Host+''', '''+User+''') order by v_size';
  2: IBQuery1.SQL.Text:=SQLTXT+'getfiles('''+Host+''', '''+User+''') order by v_date, v_time';
  3: IBQuery1.SQL.Text:=SQLTXT+'getfiles('''+Host+''', '''+User+''') order by v_name';
  end;
end;   
end;

procedure TFTPDB_GDB.IBQuery2BeforeOpen(DataSet: TDataSet);
begin
  IBQuery2.SQL.Text:=SQLTXT2+FormMain.Us.Host+SQLTXT3;
end;

end.
