{ **** UBPFD *********** by delphibase.endimus.com ****
>> ��������� �������� � ����� (�����/��� �����, �������� �������, �������� �����) 

��������� ���������� � ����� �����. 
�������� �� FDD, HDD, CD, ������ �� ��������. 

�������� ������ � ������ HDDInfo � ��������� ���������� � ���� ���� �����. 

�����������: ��� Windows (32S,95,NT) 
�����: cyborg, cyborg1979@newmail.ru, ICQ:114205759, ������� 
Copyright: ����������� ��������� (������ ������� �����������) 
����: 23 ��� 2002 �. 
***************************************************** } 

unit HDDInfo; 

interface 

Uses Windows, SysUtils;

//��������� ��� TypeOfDisk ������� GetDisks
Const
 DiskUnknown=0;           {����������� �����}
 DiskNone=1;              {������������� �����}
 DiskFDD=DRIVE_REMOVABLE; {������� �����, �������}
 DiskHDD=DRIVE_FIXED;     {�� ������� �����, ������ �����}
 DiskNet=DRIVE_REMOTE;    {������� �����}
 DiskCDROM=DRIVE_CDROM;   {CD ROM}
 DiskRAM=DRIVE_RAMDISK;   {����� � ���}

//�������� ����� ������ ������
function GetDisks(TypeOfDisk : Word) : String;

//������� ��������� ���������� � ����� (HDD,FDD,CD) � ������ Disk
{������������ ��������:
Disk - ����� �����

���������� ��������: 
VolumeName - �����/��� ���� 
FileSystemName - �������� ������� 
VolumeSerialNo - �������� ����� ����� (����� ����������� � ����� ���������) 
MaxComponentLength - ������������ ������ ����� ����� 
FileSystemFlags - ����� �������� � ������� Delphi �� GetVolumeInformation 

������� ���������� true, ���� �� ������ ������� (���� �������), 
� false, ���� �������� ��������, �������� ����� ��� � ���������, 
���� ��������� ������ ������ ���}
function GetHDDInfo(Disk: Char; var VolumeName, FileSystemName: String;
  var VolumeSerialNo, MaxComponentLength, FileSystemFlags:LongWord): Boolean;

function SirealNumberDisk(disk: string): string;
function SNDA: string;
function GetKeySNDA: string;

implementation 

function GetDisks(TypeOfDisk: Word) : String;{�������� ����� ������ ������}
var
  DriveArray: array[1..26] of Char;
  I: integer;
begin 
  DriveArray:='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  for I := 1 to 26 do
    if GetDriveType(PChar(DriveArray[I]+':\'))=TypeOfDisk then
      Result:=Result+DriveArray[I];
  Result:=Trim(Result);    
end;

function GetHDDInfo(Disk: Char; var VolumeName, FileSystemName: String;
  var VolumeSerialNo, MaxComponentLength, FileSystemFlags:LongWord): Boolean;
var
 _VolumeName,_FileSystemName:array [0..MAX_PATH-1] of Char;
 _VolumeSerialNo,_MaxComponentLength,_FileSystemFlags:LongWord;
begin
  if GetVolumeInformation(PChar(Disk+':\'),_VolumeName,MAX_PATH,@_VolumeSerialNo,
    _MaxComponentLength,_FileSystemFlags,_FileSystemName,MAX_PATH) then
  begin
    VolumeName:=_VolumeName;
    VolumeSerialNo:=_VolumeSerialNo;
    MaxComponentLength:=_MaxComponentLength;
    FileSystemFlags:=_FileSystemFlags;
    FileSystemName:=_FileSystemName;
    Result:=True;
  end
  else
    Result:=False;
end;

{������������ ���������� � ������ "��� �������� ���� � ������� �����?".
���������� ����������� � ���, ��� ������� "GetVolumeInformation" ������
���������� ������ ����� ����� ��� ��������� 9� � NT. � ����� ����� ���
���� ��������� �. �. � ����� ��������� ������������� � ������ � �����
��������� ��� ����������� ����� ���� ������� ������������. ���� ���
������� ���� ������ � �������, �� ������ ��� � �� �������. �� �������
� ����� ������� ���� ��������. ��� ��� ���� ������� ��� �����������
����������� ��������� ������ ����� ��� ����� ��}

function SirealNumberDisk(disk: string): string;
var
  VolumeName         : array [0..MAX_PATH-1] of Char; 
  FileSystemName     : array [0..MAX_PATH-1] of Char; 
  VolumeSerialNo     : DWord; 
  MaxComponentLength : DWord; 
  FileSystemFlags    : DWord; 

  function GetReplaceCDNumber(num: String): String; 
  var 
    i, len: Integer; 
  begin 
    Result:= ''; 
    len:= Length(num); 
    if len <> 8 then exit; 
    for i:= 1 to (len div 2) do begin 
       Dec(len); 
       Result:= Result + num[len];
       Result:= Result + num[len+1]; 
       Dec(len); 
    end;
  end; 

begin 
  GetVolumeInformation(PChar(disk), VolumeName, MAX_PATH, @VolumeSerialNo, MaxComponentLength,
    FileSystemFlags, FileSystemName, MAX_PATH);
  Result:= IntToHex(Integer(VolumeSerialNo), 8);
  if Win32Platform <> VER_PLATFORM_WIN32_NT then
    Result:= GetReplaceCDNumber(Result);
end;

function SNDA: string;
var
  i: Integer;
  v: String;
begin
  Result:='';
  v:=GetDisks(DiskHDD);
  for i:=1 to Length(v) do
    Result:=Result+SirealNumberDisk(v[i]+':\');
end;

function GetKeySNDA: string;
var v,w: string;
    i: integer;
begin
  v:=SNDA;
  for i:=1 to length(v) do
    w:=v[i]+w;
  Result:=w;
end;

end.
