program FTPDBClient;

uses
  Forms,
  Unit1 in 'Unit1.pas' {FormMain},
  Unit2 in 'Unit2.pas' {FTPDB_GDB: TDataModule},
  Unit3 in 'Unit3.pas' {FormOptions},
  Unit4 in 'Unit4.pas' {FormLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFTPDB_GDB, FTPDB_GDB);
  Application.CreateForm(TFormOptions, FormOptions);
  Application.CreateForm(TFormLogin, FormLogin);
  Application.Run;
end.
