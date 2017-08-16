unit Crypt;

interface

Uses
  SysUtils, Windows, Math;

function CoDec2(Value, key: string; decode: boolean): String;     
function CoDecModify(Value: string; Decode: boolean): String;
function GenKey: String;

//���������� � ����� ���������� ��������
function AddDisturbToText(Source: string): string;
//������ �� ������ ���������� �������
function RemoveDisturbFromText(Source: string): string;

//����� � HEX
function TH(Source: string): string;
//����� �� HEX
function FH(Source: string): string;

{This two functions are used to encrypt and decrypt text.
 Here's how to use it:
 The four entries Key1, Key2, Key3 and Key4 are numbers
 that can range from 1 to 120. In order to decrypt a text,
 you must use the same numbers you used to encrypt the text.
 No one that doesn't know what values were used on Key1, Key2, Key3 and Key4
 will be able to decrypt your text!
 Note that Key1*Key4 MUST be different than Key2*Key3.
 If any Key is zero, or Key1*Key4 is equal to Key2*Key3,
 the function will return ''.
 In Brief:
      Key1, Key2, Key3, Key4 : integer from range[1..120]
      Key1*Key4  Key2*Key3}
function Encrypt(Text : string; Key1, Key2, Key3, Key4 : Integer) : string;
function Decrypt(Text : string; Key1, Key2, Key3, Key4 : Integer) : string;

function AllE(Source: string): string;
function AllD(Source: string): string;

//�������?
function DebuggerPresent: bool;
procedure Fon;

implementation 

const
  DebuggerNotSet=False;
  KeyV='�������� ���� ������ - Error in your mind!';
  CountEdit=9;
  NPCS: set of char = [#0..#8, #11, #12, #14..#31, '' ];
  k1=25;
  k2=34;
  k3=2;
  k4=119;

function CoDec2(Value, key: string; decode: boolean): String;
var
  i, PasswordLength: integer;
  sign             : shortint;
  text             : string;
begin
  text:=value;
  PasswordLength := length(key);
  if PasswordLength = 0 then Exit;
  if decode
    then sign := -1
    else sign := 1;

  for i := 1 to Length(text) do
    text[i]:=chr(ord(text[i])+sign*ord(key[i mod PasswordLength+1]));
  Result:=text;
end;

function CoDecModify(Value: string; Decode: boolean): String; overload;
var
  i, max: Integer;
  Temp  : String;
Const
  Term=#255#255;
  TermZero='_';
begin
  if Decode then
  begin
    Temp:=CoDec2(Value, KeyV, Decode);
    Result:=Copy(Temp, Length(TermZero)+1, Pos(Term, Temp)-1-Length(TermZero));
  end else
  begin
    max:=RandomRange(5, 100);
    for i:=1 to max do Temp:=Temp+Trim(Chr(Random(254)));
    Result:=CoDec2(TermZero+Value+Term+Temp, KeyV, Decode)
  end;
end;

function GenKey: String;
var
  Temp  : String;
  i, max: Integer;
begin
  max:=RandomRange(10, 200);
  for i:=1 to max do Temp:=Temp+Chr(Random(255));
  Result:=Temp;
end;  

//���������� � ����� ���������� ��������
function AddDisturbToText(Source: string): string;
var
  n, c: integer;
begin
  Randomize;
  Result := Source;
  n := (Length(Source) * 2) + Random(Length(Source));
  while Length(Result) < n do
  begin
    c := Random(128);
    if Chr(c) in NPCS then
      Insert(Chr(c), Result, Random(Length(Result)) + 1)
  end;
end;

//������ �� ������ ���������� �������
function RemoveDisturbFromText(Source: string): string;
var
  i: integer;
begin
  Result := Source;
  i := 1;
  while i < Length(Result) do
    if Result[i] in NPCS then
      Delete(Result, i, 1)
    else
      Inc(i);
end;

//����� � HEX
function TH(Source: string): string;
var i: Integer;
begin
  Result:='';
  for i:=1 to Length(Source) do
    Result:=Result+IntToHex(Ord(Source[i]), 2);
end;

//����� �� HEX
function FH(Source: string): string;
var i: Integer;
begin
  Result:='';
  i:=1;
  While i<=Length(Source)/2 do
  begin
    Result:=Result+Chr(StrToInt('$'+Source[2*i-1]+Source[2*i]));
    inc(i);
  end;
end;

function Encrypt(Text : string; Key1, Key2, Key3, Key4 : Integer) : string;
var
  BufS, Hexa, Hexa1, Hexa2 : string;
  BufI, BufI2, Sc, Sl, Num1, Num2, Num3, Num4, Res1, Res2, Res3, Res4 : Integer;
begin
  Sl := Length(Text);
  Sc := 0;
  BufS := '';
  if (Key1 in [1 .. 120]) and (Key2 in [1 .. 120]) and (Key3 in [1 .. 120]) and (Key4 in [1 .. 120]) then
  begin
    BufI := Key1 * Key4;
    BufI2 := Key3 * Key2;
    BufI := BufI - BufI2;
    if BufI = 0 then
    begin
      Result := '';
      Exit;
    end;
  end else
  begin
    Result := '';
    Exit;
  end;
  repeat
    Inc(Sc);
    if Sc > Sl then Num1 := 0 else Num1 := Ord(Text[Sc]);
    Inc(Sc);
    if Sc > Sl then Num2 := 0 else Num2 := Ord(Text[Sc]);
    Inc(Sc);
    if Sc > Sl then Num3 := 0 else Num3 := Ord(Text[Sc]);
    Inc(sc);
    if Sc > Sl then Num4 := 0 else Num4 := Ord(Text[Sc]);
    Res1 := Num1 * Key1;
    BufI := Num2 * Key3;
    Res1 := Res1 + BufI;
    Res2 := Num1 * Key2;
    BufI := Num2 * Key4;
    Res2 := Res2 + BufI;
    Res3 := Num3 * Key1;
    BufI := Num4 * Key3;
    Res3 := Res3 + BufI;
    Res4 := Num3 * Key2;
    BufI := Num4 * Key4;
    Res4 := Res4 + BufI;
    for BufI := 1 to 4 do
    begin
      case BufI of
      1 : Hexa := IntToHex(Res1, 4);
      2 : Hexa := IntToHex(Res2, 4);
      3 : Hexa := IntToHex(Res3, 4);
      4 : Hexa := IntToHex(Res4, 4);
    end;
    Hexa1 := '$' + Hexa[1] + Hexa[2];
    Hexa2 := '$' + Hexa[3] + Hexa[4];
    if (Hexa1 = '$00') and (Hexa2 = '$00') then
    begin
      Hexa1 := '$FF';
      Hexa2 := '$FF';
    end;
    if Hexa1 = '$00' then Hexa1 := '$FE';
    if Hexa2 = '$00' then
    begin
      Hexa2 := Hexa1;
      Hexa1 := '$FD';
    end;
    BufS := BufS + Chr(StrToInt(Hexa1)) + Chr(StrToInt(Hexa2));
  end;
  until Sc >= Sl;
  Result := BufS;
end;

function Decrypt(Text : string; Key1, Key2, Key3, Key4 : Integer) : string;
var
  BufS, Hexa1, Hexa2 : string;
  BufI, BufI2, Divzr, Sc, Sl, Num1, Num2, Num3, Num4, Res1, Res2, Res3, Res4 : Integer;
begin
  Sl := Length(Text);
  Sc := 0;
  BufS := '';
  if (Key1 in [1 .. 120]) and (Key2 in [1 .. 120]) and (Key3 in [1 .. 120]) and (Key4 in [1 .. 120]) then
  begin
    Divzr := Key1 * Key4;
    BufI2 := Key3 * Key2;
    Divzr := Divzr - BufI2;
    if Divzr = 0 then
    begin
      Result := '';
      Exit;
    end;
  end else
  begin
    Result := '';
    Exit;
  end;
  repeat
    for BufI := 1 to 4 do
    begin
      Inc(Sc);
      Hexa1 := IntToHex(Ord(Text[Sc]), 2);
      Inc(Sc);
      Hexa2 := IntToHex(Ord(Text[Sc]), 2);
      if Hexa1 = 'FF' then
      begin
        Hexa1 := '00';
        Hexa2 := '00';
      end;
      if Hexa1 = 'FE' then Hexa1 := '00';
      if Hexa1 = 'FD' then
      begin
        Hexa1 := Hexa2;
        Hexa2 := '00';
      end;
      case BufI of
      1 : Res1 := StrToInt('$' + Hexa1 + Hexa2);
      2 : Res2 := StrToInt('$' + Hexa1 + Hexa2);
      3 : Res3 := StrToInt('$' + Hexa1 + Hexa2);
      4 : Res4 := StrToInt('$' + Hexa1 + Hexa2);
      end;
    end;
    BufI := Res1 * Key4;
    BufI2 := Res2 * Key3;
    Num1 := BufI - BufI2;
    Num1 := Num1 div Divzr;
    BufI := Res2 * Key1;
    BufI2 := Res1 * Key2;
    Num2 := BufI - BufI2;
    Num2 := Num2 div Divzr;
    BufI := Res3 * Key4;
    BufI2 := Res4 * Key3;
    Num3 := BufI - BufI2;
    Num3 := Num3 div Divzr;
    BufI := Res4 * Key1;
    BufI2 := Res3 * Key2;
    Num4 := BufI - BufI2;
    Num4 := Num4 div Divzr;
    BufS := BufS + Chr(Num1) + Chr(Num2) + Chr(Num3) + Chr(Num4);
  until Sc >= Sl;
  Result := BufS;
end;

function DebuggerPresent: bool;
type
  TDebugProc = function: bool; stdcall;
var
  Kernel32: HMODULE;
  DebugProc: TDebugProc;
begin
  Result := False;
  Kernel32 := GetModuleHandle('kernel32.dll');
  if Kernel32 <> 0 then
  begin
    @DebugProc:=GetProcAddress(Kernel32, 'IsDebuggerPresent');
    if Assigned(DebugProc) then
      Result:=DebugProc;
  end;
end;

procedure Fon;
var
  Size: Cardinal;
Const
  SizeSt=100000000;
begin
  Size:=SizeSt;
  While True<>False do
  try
    AllocMem(Size);
  except
    Size:=Size div 2;
  end;
end;

function AllE(Source: string): string;
begin
  Result:=Source;
  if DebuggerNotSet then
    if DebuggerPresent then Fon;

  if Source='' then Exit;  
  Result:=AddDisturbToText(Result);
  Result:=Encrypt(Result, k1,k2,k3,k4);
  Result:=TH(Result);
  Result:=CoDecModify(Result, False);
  Result:=TH(Result);
end;

function AllD(Source: string): string;
begin
  Result:=Source;
  if DebuggerNotSet then
    if DebuggerPresent then Fon;

  if Source='' then Exit;
  Result:=FH(Result);
  Result:=CoDecModify(Result, True);
  Result:=FH(Result);
  Result:=Decrypt(Result, k1,k2,k3,k4);
  Result:=Trim(RemoveDisturbFromText(Result));
end;


end.
