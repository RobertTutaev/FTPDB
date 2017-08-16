unit Subs3;

interface

uses Classes, SysUtils;

function ScanDrive(root, filemask: string; hitlist: TStrings): Boolean;

implementation

{Функция "ScanDrive"}
function ScanDrive(root, filemask: string; hitlist: TStrings): Boolean;
  function ScanDirectory(var path: string): Boolean;
  var
    SRec: TSearchRec;
    pathlen: Integer;
    res: Integer;
  begin
    pathlen := Length(path);
    { first pass, files }
    res := FindFirst(path + filemask, faAnyfile, SRec);
    if res = 0 then
      try
        while res = 0 do
        begin
          hitlist.Add(path + SRec.Name);
          res := FindNext(SRec);
        end;
      finally
        FindClose(SRec)
      end;
    Result:=True;
      
    {second pass, directories}
    res := FindFirst(path + '*.*', faDirectory, SRec);
    if res = 0 then
      try
        while (res = 0) and Result do
        begin
          if ((Srec.Attr and faDirectory) = faDirectory) and
            (Srec.Name <> '.') and
            (Srec.Name <> '..') then
          begin
            path := path + SRec.Name + '\';
            Result := ScanDirectory(path);
            SetLength(path, pathlen);
          end;
          res := FindNext(SRec);
        end;
      finally
        FindClose(SRec)
      end;
  end;
begin
  try Result := ScanDirectory(root) finally end;
end;

end.
