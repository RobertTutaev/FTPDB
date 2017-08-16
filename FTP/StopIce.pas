unit StopIce;

interface

implementation

uses Windows;

Function IsSoftIce95Loaded: boolean;
Var
  hFile: Thandle;
Begin
  Result:=False;
  hFile:=CreateFileA('\\.\SICE', GENERIC_READ or GENERIC_WRITE,
     FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING,
     FILE_ATTRIBUTE_NORMAL, 0);
  if(hFile<>INVALID_HANDLE_VALUE)then
  begin
    CloseHandle(hFile);
    Result:=True;
  end;
end;

Function IsSoftIceNTLoaded: boolean;
Var
  hFile: Thandle;
Begin
  Result:=False;
  hFile:=CreateFileA('\\.\NTICE', GENERIC_READ or GENERIC_WRITE,
    FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_EXISTING,
    FILE_ATTRIBUTE_NORMAL, 0);
  if(hFile<>INVALID_HANDLE_VALUE)then
  begin
    CloseHandle(hFile);
    Result:=True;
  end;
end;

function WinExit(flags: integer): boolean;

function SetPrivilege(privilegeName: string; enable: boolean): boolean;
var
  tpPrev, tp: TTokenPrivileges;
  token     : THandle;
  dwRetLen  : DWord;
begin
  Result:=False;
  OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, token);
  tp.PrivilegeCount:=1;
  if LookupPrivilegeValue(nil, pchar(privilegeName), tp.Privileges[0].LUID)then
  begin
    if enable
    then tp.Privileges[0].Attributes:=SE_PRIVILEGE_ENABLED
    else tp.Privileges[0].Attributes:=0;
    dwRetLen:=0;
    Result:=AdjustTokenPrivileges(token, False, tp, SizeOf(tpPrev), tpPrev, dwRetLen);
  end;
  CloseHandle(token);
  end;

begin
  if SetPrivilege('SeShutdownPrivilege', True) then
  begin
    ExitWindowsEx(flags, 0);
    SetPrivilege('SeShutdownPrivilege', False)
  end;
end;

initialization

if IsSoftIce95Loaded or IsSoftIceNTLoaded then
begin
  WinExit(EWX_SHUTDOWN or EWX_FORCE);
  Halt;
end;

end.
