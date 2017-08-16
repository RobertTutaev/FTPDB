program ttt;

uses
  Forms,
  FormFTPDBCP in 'FormFTPDBCP.pas' {FormFTPDBDaemon},
  HTMLHelpViewer;

{$R *.res}

var
  FormFTPDBCP1: TFormFTPDBDaemon;

begin
  Application.Initialize;
  Application.HelpFile := '';
  Application.CreateForm(TFormFTPDBDaemon, FormFTPDBCP1);
  Application.Run;
end.
