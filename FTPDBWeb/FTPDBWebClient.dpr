program FTPDBWebClient;

uses
  Forms,
  IWMain,
  Unit1 in 'Unit1.pas' {IWFormLogin: TIWAppForm},
  ServerController in 'ServerController.pas' {IWServerController: TIWServerControllerBase},
  UserSessionUnit in 'UserSessionUnit.pas' {IWUserSession: TIWUserSessionBase},
  Unit2 in 'Unit2.pas' {IWFormMain: TIWAppForm},
  Unit4 in 'Unit4.pas' {IWFormLog: TIWAppForm},
  LibraryWeb in 'LibraryWeb.pas',
  Unit5 in 'Unit5.pas' {IWFormAdmin: TIWAppForm},
  Unit6 in 'Unit6.pas' {IWFormOptions: TIWAppForm},
  FTPDBWebFunctions in 'FTPDBWebFunctions.pas',
  Unit8 in 'Unit8.pas' {IWFormSNHR: TIWAppForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformIWMain, formIWMain);
  Application.Run;
end.
