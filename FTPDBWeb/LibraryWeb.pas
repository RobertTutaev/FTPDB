unit LibraryWeb;

interface

uses IWApplication;

procedure CookiesSet(WebApplication: TIWApplication; const VName, VValue: String);
function GetTextSQL(Const Temp: string): string;
function GetText(Const Temp: string): string;
function GetTextC(Const Temp: string): string;

implementation

uses SysUtils, WebBroker;

procedure CookiesSet(WebApplication: TIWApplication; const VName, VValue: String);
begin 
  with WebApplication.Response.Cookies.Add do
  begin
    Name:=VName;
    Value:=VValue;
    Secure:=False;
    Expires:=Now+365;
  end;      
end;

function GetTextSQL(Const Temp: string): string;
var
  TmV: String;
  Tmp: PChar;
  i,k: Integer;
begin
  Result:='';
  Tmp:=PChar(Trim(StringReplace(Temp, '*','%', [rfReplaceAll])));

  i:=0;
  While i<length(Tmp) do
  begin
    if((Tmp[i]+Tmp[i+1])='&#')then
    begin
      k:=i+2;
      TmV:='';
      while Tmp[k]<>';' do
      begin
        TmV:=TmV+Tmp[k];
        k:=k+1;
      end;
      Result:=Result+WideChar(StrToInt(TmV));
      i:=k;
    end else
      Result:=Result+Tmp[i];
    i:=i+1;
  end;
  Result:=WideLowerCase(Result);
end;

function GetText(Const Temp: string): string;
var
  TmV: String;
  Tmp: PChar;
  i,k: Integer;
begin
  Result:='';
  Tmp:=PChar(Trim(Temp));

  i:=0;
  While i<length(Tmp) do
  begin
    if((Tmp[i]+Tmp[i+1])='&#')then
    begin
      k:=i+2;
      TmV:='';
      while Tmp[k]<>';' do
      begin
        TmV:=TmV+Tmp[k];
        k:=k+1;
      end;
      Result:=Result+WideChar(StrToInt(TmV));
      i:=k;
    end else
      Result:=Result+Tmp[i];
    i:=i+1;
  end;
  Result:=WideLowerCase(Result+'');
end;

function GetTextC(Const Temp: string): string;
var
  Tmp: PChar;
  i:   integer;
begin
  Result:='';
  Tmp:=PChar(Temp);

  Tmp:=PChar(StringReplace(Tmp, '+', ' ', [rfReplaceAll]));
  i:=0;
  While i<length(Tmp) do
  begin
    if Tmp[i]='%' then
    begin
      Result:=Result+Char(StrToInt('$'+Tmp[i+1]+Tmp[i+2]));
      i:=i+2;
    end else
      Result:=Result+Tmp[i];
    i:=i+1;
  end;
  Result:=LowerCase(Trim(Result));
end;

end.
