program FTPDBDaemonTest;

uses
  Forms,
  TestUnit in 'TestUnit.pas' {FTPDBDaemonTestForm},
  ScanMain in 'ScanMain.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFTPDBDaemonTestForm, FTPDBDaemonTestForm);
  Application.Run;
end.
