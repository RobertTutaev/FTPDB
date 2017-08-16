unit FTPDBWebFunctions;

interface

uses
  IBDatabase, IdFTPFunctions, SysUtils;

procedure SetIBDB(var fIBDatabase: TIBDatabase);
function GetDBPath: String;

implementation

procedure SetIBDB(var fIBDatabase: TIBDatabase);
var Opt: TOpt;
begin
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
end;

function GetDBPath: String;
var Opt: TOpt;
begin
  LoadOptions(Opt);
  Result:=ExtractFilePath(Opt.Pth);
end;

end.
