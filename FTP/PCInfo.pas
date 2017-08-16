unit PCInfo;

interface

function GetOwnerAndCompanyName: String;
// ���������� � ����������.
function GetHardwareInfo: string;

implementation

uses
   Registry, Windows, SysUtils;

function GetOwnerAndCompanyName: String;
var
  reg: TRegistry;
  vi: TOSVersionInfo;
  sWindows: string;  

begin
  reg     :=TRegistry.Create;
  sWindows:='\Windows\';
  try
    vi.dwOSVersionInfoSize := SizeOf(vi);
    getversionex(vi);
    reg.RootKey := HKEY_LOCAL_MACHINE;
    if (vi.dwPlatformId = VER_PLATFORM_WIN32_NT) then sWindows := '\Windows NT\';
    if reg.OpenKey('Software\Microsoft' + sWindows + 'CurrentVersion', False) then
    begin
      // Name
      Result:='RegisteredOwner='+reg.ReadString('RegisteredOwner')+'; ';
      // Organization
      Result:=Result+'RegisteredOrganization='+reg.ReadString('RegisteredOrganization');
    end;
  finally
    reg.Free;
  end;
end;

// ���������� � ����������.
function GetHardwareInfo: string;
var
  Size : cardinal;
  PRes : PChar;
  BRes : boolean;
  lpSystemInfo : TSystemInfo;
begin
  // ��� ����������
  Size:=MAX_COMPUTERNAME_LENGTH+1;
  PRes:=StrAlloc(Size);
  BRes:=GetComputerName(PRes, Size);
  if BRes then Result:='ComputerName='+StrPas(PRes)+'; ';
  // ��� ������������
  Size:=MAX_COMPUTERNAME_LENGTH + 1;
  PRes:=StrAlloc(Size);
  BRes:=GetUserName(PRes, Size);
  if BRes then Result:=Result+'UserName='+StrPas(PRes);  
end;


end.
