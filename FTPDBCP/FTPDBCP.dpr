library FTPDBCP;

uses
  CtlPanel, 
  Applet in 'Applet.pas' {AppletModule1: TAppletModule},
  DataModuleFTPDBDCP in 'DataModuleFTPDBDCP.pas' {DataModuleFTPDBDaemon: TDataModule};

exports CPlApplet;

{$R *.RES}

{$E cpl}

begin
  Application.Initialize;
  Application.CreateForm(TAppletModule1, AppletModule1);
  Application.CreateForm(TDataModuleFTPDBDaemon, DataModuleFTPDBDaemon);
  Application.Run;
end.