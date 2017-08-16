{*******************************************************}
{                                                       }
{                Delphi Component Library               }
{        ��� ������������� �.���������� (2005�.)        }
{                     ������ ������                     }
{              (rob_t@mail.ru, rob_t@74.ru)             }
{                                                       }
{*******************************************************}

unit Subs2;

interface
uses Classes, DBGrids, Windows, IniFiles, Messages, SysUtils, Forms, Graphics,
     Dialogs, IBQuery, Variants, DBTables, Subs, IbStoredProc, DateUtils,
     ComObj, ComCtrls, ExtCtrls, StdCtrls, Registry, Grids; //QGraphics

Type
  TOnSubsCommandsEvent = procedure(AObject: TObject) of object;

Type
  TSubsDBGrid=Class(TDBGrid)
  private
    FAutoCorrect: Boolean;
  protected
    OldScreenWidth: Integer;
    procedure Paint; override;
  public
    property Col;
    property Row;
    property RowCount;
    property RowHeights;
    property VisibleRowCount;
    property Canvas;
    function CellRect(ACol, ARow: Longint): TRect;


    procedure SetAutoCorrect; 
    procedure WriteIniFile(Fl: TIniFile);
    procedure ReadIniFile(Fl: TIniFile);

    constructor Create(AOwner: TComponent); override;
  published
    property OnClick;
    property AutoCorrect: Boolean Read FAutoCorrect Write FAutoCorrect default True;
  end;

Type
  TSubsDatePanel=Class(TPanel)
  private
    function GetDD: String;
    function GetMM: String;
    function GetMMMM: String;
    function GetYYYY: String;
    function GetMMYYYY: String;
    function GetMMMMYYYY: String;
    function GetDDMMYYYY: String;
    function GetDDMMMMYYYY: String;

    function GetEn: boolean;
    procedure SetEn(AValue: boolean);
    procedure SetVChangeHeight(AValue: boolean);
    procedure SetColorMonth(AValue: TColor);
    procedure SetColorYear(AValue: TColor);

    procedure SetVDefaultDay(AValue: Integer);
    procedure SetVDefaultMonth(AValue: Integer);
    procedure SetVDefaultYear(AValue: Integer);

    function GetLabelText: string;
    procedure SetLabelText(AValue: string);
  protected
    VChangeHeight: Boolean;
    VDefaultDay: Integer;
    VDefaultMonth: Integer;
    VDefaultYear: Integer;

    VDefaultColorMonth: TColor;
    VDefaultColorYear: TColor;

    KZa:    TLabel;
    KMonth: TComboBox;
    KYear:  TComboBox;

    procedure WMSize(var message: TWMSize); message WM_SIZE;
  public
    procedure WriteIniFile(Fl: TIniFile);
    procedure ReadIniFile(Fl: TIniFile);

    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  published
    property DD: String Read GetDD;
    property MM: String Read GetMM;
    property MMMM: String Read GetMMMM;
    property YYYY: String Read GetYYYY;
    property MMYYYY: String Read GetMMYYYY;
    property MMMMYYYY: String Read GetMMMMYYYY;
    property DDMMYYYY: String Read GetDDMMYYYY;
    property DDMMMMYYYY: String Read GetDDMMMMYYYY;
    property Enabled: Boolean Read GetEn Write SetEn;

    property ChangeHeight: Boolean Read VChangeHeight Write SetVChangeHeight default False;
    property ColorMonth: TColor Read VDefaultColorMonth Write SetColorMonth;
    property ColorYear: TColor Read VDefaultColorYear Write SetColorYear;
    property LabelText: String Read GetLabelText Write SetLabelText;

    property DefaultDay: Integer Read VDefaultDay Write SetVDefaultDay;
    property DefaultMonth: Integer Read VDefaultMonth Write SetVDefaultMonth;
    property DefaultYear: Integer Read VDefaultYear Write SetVDefaultYear;
  end;

Type
  TSubsCommands=Class(TComponent)
  private
    SR:      TSubsRound;
    BDEQ:    TQuery;
    IBQ1:    TIBQuery;
    IBQ2:    TIBQuery;
    FText:   TStrings;
    FOnSubsCommandsEvent: TOnSubsCommandsEvent;
    FOnBDEQNextEvent:     TOnSubsCommandsEvent;

    SubsUsers1:     TSubsUsers;
    IBStoredProc1:  TIBStoredProc;
    SubsXLSReport1: TSubsXLSReport;
    SubsOperations1:TSubsOperations;
    function  GetIDDNew: String;
    procedure SetIBQ1(AValue: TIBQuery);
    procedure SetFText(AValue: TStrings);
    procedure SetPrBar(AValue: TProgressBar);
    function  GetPrBar: TProgressBar;
    function  GetBDERecNo: Integer;
    function  GetBBDECount: Integer;
    procedure SetXLSPath(AValue: String);
    function  GetXLSPath: String;
  protected
    SQL_txt: String;

    Field_N              : String;
    Field_Comments       : String;

    AutoTryValue         : Boolean;
    AutoSetNewVersion    : Boolean;
    AutoSetNotEndingSQL  : Boolean;
    AutoSetEndFromMessage: Boolean;
    p1: String;
    p2: String;
    p3: String;
    p4: String;
    p5: String;
    p6: String;
    p7: String;
    p8: String;
    p9: String;
    p10: String;
    p11: String;
    p12: String;
    p13: String;
    p14: String;
    p15: String;
    p16: String;
    p17: String;
    p18: String;
    p19: String;
    p20: String;
    function  CommandSetNewVersionBegin: Boolean;
    procedure CommandSetNewVersionEnd;
    function  CommandMessage: Boolean;
    procedure CommandShowText;

    procedure CommandUpdateS_LgKatToGDB;
    procedure CommandUpdateS_StreetToGDB;
    procedure CommandUpdateS_Vid_DocToGDB;
    procedure CommandUpdateS_Soc_NormaToGDB;
    procedure CommandUpdateS_Proj_MinToGDB;
    procedure CommandUpdateS_Step_RodstvaToGDB;
    procedure CommandUpdateS_RayonToGDB;
    procedure CommandUpdateS_ZakToGDB;
    procedure CommandUpdateS_Vid_SobsToGDB;
    procedure CommandUpdateS_Bank_NomToGDB;
    procedure CommandUpdateS_Bank_OtdToGDB;
    procedure CommandUpdateS_St_N_PlToGDB;
    procedure CommandUpdateS_St_N_ZKUToGDB;
    procedure CommandUpdateS_EvToGDB;
    procedure CommandInsertAdrToGDB;

    procedure CommandUpdateS_LgKatToBDE;
    procedure CommandUpdateS_StreetToBDE;
    procedure CommandUpdateS_Vid_DocToBDE;
    procedure CommandUpdateS_Soc_NormaToBDE;
    procedure CommandUpdateS_Proj_MinToBDE;
    procedure CommandUpdateS_Step_RodstvaToBDE;
    procedure CommandUpdateS_RayonToBDE;
    procedure CommandUpdateS_ZakToBDE;
    procedure CommandUpdateS_Vid_SobsToBDE;
    procedure CommandUpdateS_Bank_NomToBDE;
    procedure CommandUpdateS_Bank_OtdToBDE;
    procedure CommandUpdateS_St_N_PlToBDE;
    procedure CommandUpdateS_St_N_ZKUToBDE;
    procedure CommandInsertAdrToBDE;

    procedure CommandSubsCreateSecond;
    procedure CommandSubsRefresh;
    procedure CommandSubsCompare;
    procedure CommandCutMainData;

    procedure CommandCreateSpr;
    procedure CommandCreateSprOtk;
    procedure CommandSetV3ToIB;
    procedure CommandSetDolg;
    procedure CommandChangeTarifs;

    procedure SetObjectsBefore;
    procedure SetNullParams;
    procedure SetDolg;
    procedure ReportDLG1;
    procedure ReportDLG2;

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    procedure SetOtoplenie(Const OtoplT1, OtoplT2: Real);
    procedure ExecuteNextSQL;
  public
    procedure Execute;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  published
    property Text               : TStrings Read FText Write SetFText;
    property IBDataSet          : TIBQuery Read IBQ1 Write SetIBQ1;
    property BDERecNo           : Integer Read GetBDERecNo;
    property BDECount           : Integer Read GetBBDECount;
    property XLSPath            : String Read GetXLSPath Write SetXLSPath;
    property XLSProgressBarSet  : TProgressBar Read GetPrBar Write SetPrBar;
    property OnSubsCommandsEvent: TOnSubsCommandsEvent read FOnSubsCommandsEvent
      write FOnSubsCommandsEvent;
    property OnBDEQNextEvent    : TOnSubsCommandsEvent read FOnBDEQNextEvent
      write FOnBDEQNextEvent;
  end;

{���������� ������ ��� ���������� ���������     }
{�. �., �� ���������� � ������� ������ ������� �}
Const
  DefaultScreenWidth=800;
{������� �� �������}
Const
  Const_sql_1=
  'insert into main select '+
  '0,         idf,        zak,       lschet, '+
  'dt_obr_sub,dt_n,       dt_k,      dt_n_sub, '+
  'mes_nazn,  dt_k_sub,   last_idd, '+
  'dp_r,      priost,     inp_us,    data, '+
  'times,     rai,        str,       dom, '+
  'korp,      kv,         obsh_pl,   koef_izn, '+
  'prop_all,  sub_all,    sob,       sob_prop, '+
  'soc_nrm,   soc_nrm_pl, soc_n_r_pl,dom_tel, '+
  'n_dela,    stat,       k_pr,      d_max,  '+
  'sn1, sn2, sn3, sn4, sn5, sn6, sn7, sn8, '+
  'sn9, sn10,sn11,sn12,sn13,sn14,sn15,sn16,sn17,sn18,sn, '+
  'lg1, lg2, lg3, lg4, lg5, lg6, lg7, lg8, '+
  'lg9, lg10,lg11,lg12,lg13,lg14,lg15,lg16,lg17,lg18,lg, '+
  'pl1, pl2, pl3, pl4, pl5, pl6, pl7, pl8, '+
  'pl9, pl10,pl11,pl12,pl13,pl14,pl15,pl16,pl17,pl18,pl, '+
  'sb1, sb2, sb3, sb4, sb5, sb6, sb7, sb8, '+
  'sb9, sb10,sb11,sb12,sb13,sb14,sb15,sb16,sb17,sb18,sb, '+
  'zk1, zk2, zk3, zk4, zk5, zk6, zk7, zk8, '+
  'zk9, zk10,zk11,zk12,zk13,zk14,zk15,zk16,zk17,zk18, '+
  'ls1, ls2, ls3, ls4, ls5, ls6, ls7, ls8, '+
  'ls9, ls10,ls11,ls12,ls13,ls14,ls15,ls16,ls17,ls18, '+
  's_doh,   s_p_m,zk19,ls19,sn19,lg19,pl19,sb19,vid_sobs, ved_jil, '+
  'opl_usl_all, st_n_pl, st_n_pl_pl, st_n_zku, '+
  'pn1, pn2, pn3, pn4, pn5, pn6, pn7, pn8, pn9, pn10,'+
  'pn11,pn12,pn13,pn14,pn15,pn16,pn17,pn18,pn19,pn '+
  'from main where idd=:idd';
  Const_sql_2=
  'insert into fio select '+
  '0,       fam,      im, '+
  'ot,      im_sb,    pol, '+
  'vid_dc,  ser_dc,   nom_dc, '+
  'mes_vid, dt_vid,   dt_rojd, '+
  'step_rod,kat_lg,   dohod, '+
  'pr_min,  pr_min_s, n, '+
  'sob_1,   sob_2,    opl_usl from fio where idd=:idd';
  Const_sql_3=
  'insert into main_bank select '+
  '0,       bank_nom, bank_otd, '+
  'lschet_b,n_post '+
  'from main_bank where idd=:idd';
  Const_sql_4=
  'insert into main_old select '+
  '0, os1, os2, os3, os4, os5, '+
  '   os6, os7, os8, os9, os10,'+
  '   os11,os12,os13,os14,os15,'+
  '   os16,os17,os18,os19,os   '+
  'from main_old where idd=:idd';

{��� ���������������� ����}
const
  WS_EX_LAYERED=$80000;
  LWA_COLORKEY=1;
  LWA_ALPHA=2;

//�������� ���������������� �����
procedure SetWindowsAlpha(AHandle: HWND; AAlpha: Byte);
//������� ��� ����� � ����� � �����
function DeleteDir(Dir: string; DelDir: Boolean=False): boolean;
//��������� ���-�� ���� ������ ���������
function GetWorkDay(Reg: String; Value: String=''; Key: String='Default'; Day: Word=30): Integer;
function VigenerCoDec(Value, Key: pchar): pchar;

procedure Register;

implementation

uses Controls, IBCustomDataSet, DB;

{������: ����������� ����������� ����������� � ������� �����������}

Procedure Register;
Begin
  RegisterComponents('Subs',[TSubsDBGrid]);
  RegisterComponents('Subs',[TSubsCommands]);
  RegisterComponents('Subs',[TSubsDatePanel]);
End;

{��������� TSubsDBGrid}

function TSubsDBGrid.CellRect(ACol, ARow: Integer): TRect;
begin
  Result:=inherited CellRect(ACol, ARow);
end; 

{��������}  
constructor TSubsDBGrid.Create(AOwner: TComponent);
begin
  inherited;
  OldScreenWidth:=Screen.Width;
  FAutoCorrect:=False;
end;

procedure TSubsDBGrid.Paint;
begin
  inherited;
  SetAutoCorrect;
end;

{��������� ��������}
procedure TSubsDBGrid.SetAutoCorrect;
var i, NewScreenWidth : Integer;
begin
If FAutoCorrect=False then Exit;
NewScreenWidth:=Screen.Width;
If(NewScreenWidth<>OldScreenWidth)then
begin
  for i:=0 to Columns.Count-1 do
  begin
    if(Columns[i].Width>0)then Columns[i].Width:=Round(Columns[i].Width*NewScreenWidth/OldScreenWidth);
    if(Columns[i].Width>=0)and(Columns[i].Width<2)then Columns[i].Width:=2;
  end;
  OldScreenWidth:=NewScreenWidth;
end;
end;

{������ �� Ini-�����}
procedure TSubsDBGrid.ReadIniFile(Fl: TIniFile);
var i,j    : Integer;
    nom    : String;
    CNm, Nm: String;
begin
CNm:=Owner.Name+'.'+Name;
if ColCount<>Fl.ReadInteger(CNm, '_Count', 0) then Exit;
OldScreenWidth:=Fl.ReadInteger(CNm, '_ScreenWidth', Screen.Width);
for i:=0 to ColCount-1 do
begin
  nom:=IntToStr(i);
  Nm:=Fl.ReadString(CNm, 'ColName' +nom, '');
  for j:=i to Columns.Count-1 do
    if Nm=Columns[j].Title.Caption then
    begin
      if j>i then ColumnMoved(j+1, i+1);
      Columns[i].Width:=Fl.ReadInteger(CNm, 'ColWidth'+nom, Columns[i].Width);
      Break;
    end;
end;
SetAutoCorrect;
end;

{������ � Ini-����}
procedure TSubsDBGrid.WriteIniFile(Fl: TIniFile);
var i: Integer;
  nom: String;
  CNm: String;
begin
CNm:=Owner.Name+'.'+Name;
for i:=0 to Columns.Count-1 do
begin
  nom:=IntToStr(i);
  Fl.WriteString( CNm, 'ColName' +nom, Columns[i].Title.Caption);
  Fl.WriteInteger(CNm, 'ColWidth'+nom, Columns[i].Width);
end;
Fl.WriteInteger(CNm, '_Count', ColCount);
Fl.WriteInteger(CNm, '_ScreenWidth', Screen.Width);
end;

procedure SetWindowsAlpha(AHandle: HWND; AAlpha: Byte);
begin
  if SetWindowLong(AHandle, GWL_EXSTYLE, GetWindowLong(AHandle, GWL_EXSTYLE)
  or WS_EX_LAYERED) = 0 then
    ShowMessage(SysErrorMessage(GetLastError)); 
  if not SetLayeredWindowAttributes(AHandle, 0, AAlpha, LWA_ALPHA) then
    ShowMessage(SysErrorMessage(GetLastError));
end;

{ TSubsCommands }

procedure TSubsCommands.CommandCreateSpr;
var ExcelApp, Workbook, Range, Cell1, Cell2, ArrayData: Variant;
    BeginCol, BeginRow, SdvigZKU, ColCount, NomRecQ1,k: Integer;
    VisualReport: Boolean;
begin
{0.�������� ����������� � ������������� ������������ ������� ����-�������}
if IBQ1.Active=False  then Exit;
if IBQ1.RecordCount=0 then Exit;
//1.�������� - ���������
try    VisualReport:=StrToBool(p1);
except VisualReport:=True; end;
//2.�������� - ���
if p2='' then p2:=SubsXLSReport1.XLSPath+'������ ����-�������.xls'
         else p2:=SubsXLSReport1.XLSPath+p2;
//3.�������� - ��������
if p3<>'' then p3:=' '+p3;

{1.���������� � ������������}
//���������� ������ �������� ���� �������, � ������� ����� �������� ������
BeginCol := 1;
BeginRow := 0;
//������� ���������� ������� ������
SdvigZKU :=2;
ColCount :=SdvigZKU+20;
if FileExists(p2)=True then DeleteFile(p2);
with IBQ1 do
begin
  First;
  //�������� Excel
  ExcelApp :=CreateOleObject('Excel.Application');
  //��������� ������� Excel �� �������, ����� �������� ����� ����������
  ExcelApp.Application.EnableEvents:=False;
  Workbook :=ExcelApp.WorkBooks.Add(ExtractFilePath(Application.ExeName)+
            'REPORT\MS.XLS');

{2.������������ ������� ����-�������}
  while not Eof do
  begin
    //������� ���������� ������, ������� �������� ��������� �������
    ArrayData := VarArrayCreate([1, 6, 1, ColCount], varVariant);
    NomRecQ1:=9*(RecNo-1)+1;
    ArrayData[1,   1]:='[���.�'+
                       IntToStr(Fieldvalues['zak'])+'_�/�.�'+
                       IntToStr(Fieldvalues['lschet'])+'_����'+
                       GetVNN(FieldValues['n_dela'])+
                       ']'+p3+', '+
                       AnsiUpperCase(Fieldvalues['fam'])+' '+
                       Copy(Fieldvalues['im'],1,1)+'.'+
                       Copy(Fieldvalues['ot'],1,1)+'., '+
                       Fieldvalues['socr']+'.'+
                       Fieldvalues['street']+','+
                       inttostr(Fieldvalues['dom'])+
                       Ansiuppercase(Fieldvalues['korp'])+'-'+
                       Fieldvalues['kv'];

    ArrayData[2,   1]:='�������� ����. � '+
                       DateToStr(FieldValues['dt_n'])+'�. �� '+
                       DateToStr(FieldValues['dt_k'])+'�.';
    ArrayData[3,   1]:='���������='+
                       IntToStr(FieldValues['prop_all'])+' ���., �������������='+
                       IntToStr(FieldValues['sub_all'])+' ���.';
    ArrayData[4,   1]:='���.�����='+
                       GetVNN(FieldValues['s_doh'],True)+', ���.��='+
                       GetVNN(FieldValues['s_p_m'],True);
    ArrayData[5,   1]:='���.�������='+
                       FloatToStr(FieldValues['obsh_pl'])+'�2, ����.����.��.='+
                       FloatToStr(FieldValues['soc_n_r_pl'])+'�2';
    ArrayData[6,   1]:='��.����.��.='+
                       FloatToStr(FieldValues['st_n_pl_pl'])+'�2, ��.�����.���='+
                       FloatToStr(FieldValues['st_n_zku1'])+'���/�2';

    ArrayData[2,   2]:='��';
    ArrayData[3,   2]:='���.';
    ArrayData[4,   2]:='���';
    ArrayData[5,   2]:='���.';
    ArrayData[6,   2]:='��';

    //��� ======================================================================
    //��������� �����
    ArrayData[1,   1+SdvigZKU]:='���. � ���. �����';
    //ArrayData[1,   2+SdvigZKU]:='����. ���';
    ArrayData[1,   2+SdvigZKU]:='����. ���';
    ArrayData[1,   3+SdvigZKU]:='�����. (����� ����.)';
    ArrayData[1,   4+SdvigZKU]:='�����.����-�����.';
    ArrayData[1,   5+SdvigZKU]:='����� ����-�����.';
    ArrayData[1,   6+SdvigZKU]:='����-�����. �����.';
    ArrayData[1,   7+SdvigZKU]:='���� (����. � ���.)';
    ArrayData[1,   8+SdvigZKU]:='�./��. (����. � ���.)';
    ArrayData[1,   9+SdvigZKU]:='����� ��/��� �����.';
    ArrayData[1,  10+SdvigZKU]:='����. �/��� ����.';
    ArrayData[1,  11+SdvigZKU]:='����. ���� ���/�';
    ArrayData[1,  12+SdvigZKU]:='��.��. (����. � ���.)';
    ArrayData[1,  13+SdvigZKU]:='��. �����-���';
    ArrayData[1,  14+SdvigZKU]:='����-����-�����';
    ArrayData[1,  15+SdvigZKU]:='��� ����. ����.';
    ArrayData[1,  16+SdvigZKU]:='����. ���-����';
    ArrayData[1,  17+SdvigZKU]:='����. ����. ����.';
    ArrayData[1,  18+SdvigZKU]:='��.��. �����-������';
    ArrayData[1,  19+SdvigZKU]:='�� ����';
    ArrayData[1,  20+SdvigZKU]:='�����';
    //���
    ArrayData[2, 1+SdvigZKU]:=FieldValues['sn1'];
    ArrayData[2, 2+SdvigZKU]:=FieldValues['sn2'];
    ArrayData[2, 3+SdvigZKU]:=FieldValues['sn3'];
    ArrayData[2, 4+SdvigZKU]:=FieldValues['sn4'];
    ArrayData[2, 5+SdvigZKU]:=FieldValues['sn5'];
    ArrayData[2, 6+SdvigZKU]:=FieldValues['sn6'];
    ArrayData[2, 7+SdvigZKU]:=FieldValues['sn7'];
    ArrayData[2, 8+SdvigZKU]:=FieldValues['sn8'];
    ArrayData[2, 9+SdvigZKU]:=FieldValues['sn9'];
    ArrayData[2,10+SdvigZKU]:=FieldValues['sn10'];
    ArrayData[2,11+SdvigZKU]:=FieldValues['sn11'];
    ArrayData[2,12+SdvigZKU]:=FieldValues['sn12'];
    ArrayData[2,13+SdvigZKU]:=FieldValues['sn13'];
    ArrayData[2,14+SdvigZKU]:=FieldValues['sn14'];
    ArrayData[2,15+SdvigZKU]:=FieldValues['sn15'];
    ArrayData[2,16+SdvigZKU]:=FieldValues['sn16'];
    ArrayData[2,17+SdvigZKU]:=FieldValues['sn17'];
    ArrayData[2,18+SdvigZKU]:=FieldValues['sn18'];
    ArrayData[2,19+SdvigZKU]:=FieldValues['sn19'];
    ArrayData[2,20+SdvigZKU]:=FieldValues['sn'];
    //������
    ArrayData[3, 1+SdvigZKU]:=FieldValues['lg1'];
    ArrayData[3, 2+SdvigZKU]:=FieldValues['lg2'];
    ArrayData[3, 3+SdvigZKU]:=FieldValues['lg3'];
    ArrayData[3, 4+SdvigZKU]:=FieldValues['lg4'];
    ArrayData[3, 5+SdvigZKU]:=FieldValues['lg5'];
    ArrayData[3, 6+SdvigZKU]:=FieldValues['lg6'];
    ArrayData[3, 7+SdvigZKU]:=FieldValues['lg7'];
    ArrayData[3, 8+SdvigZKU]:=FieldValues['lg8'];
    ArrayData[3, 9+SdvigZKU]:=FieldValues['lg9'];
    ArrayData[3,10+SdvigZKU]:=FieldValues['lg10'];
    ArrayData[3,11+SdvigZKU]:=FieldValues['lg11'];
    ArrayData[3,12+SdvigZKU]:=FieldValues['lg12'];
    ArrayData[3,13+SdvigZKU]:=FieldValues['lg13'];
    ArrayData[3,14+SdvigZKU]:=FieldValues['lg14'];
    ArrayData[3,15+SdvigZKU]:=FieldValues['lg15'];
    ArrayData[3,16+SdvigZKU]:=FieldValues['lg16'];
    ArrayData[3,17+SdvigZKU]:=FieldValues['lg17'];
    ArrayData[3,18+SdvigZKU]:=FieldValues['lg18'];
    ArrayData[3,19+SdvigZKU]:=FieldValues['lg19'];
    ArrayData[3,20+SdvigZKU]:=FieldValues['lg'];
    //����
    ArrayData[4, 1+SdvigZKU]:=FieldValues['pl1'];
    ArrayData[4, 2+SdvigZKU]:=FieldValues['pl2'];
    ArrayData[4, 3+SdvigZKU]:=FieldValues['pl3'];
    ArrayData[4, 4+SdvigZKU]:=FieldValues['pl4'];
    ArrayData[4, 5+SdvigZKU]:=FieldValues['pl5'];
    ArrayData[4, 6+SdvigZKU]:=FieldValues['pl6'];
    ArrayData[4, 7+SdvigZKU]:=FieldValues['pl7'];
    ArrayData[4, 8+SdvigZKU]:=FieldValues['pl8'];
    ArrayData[4, 9+SdvigZKU]:=FieldValues['pl9'];
    ArrayData[4,10+SdvigZKU]:=FieldValues['pl10'];
    ArrayData[4,11+SdvigZKU]:=FieldValues['pl11'];
    ArrayData[4,12+SdvigZKU]:=FieldValues['pl12'];
    ArrayData[4,13+SdvigZKU]:=FieldValues['pl13'];
    ArrayData[4,14+SdvigZKU]:=FieldValues['pl14'];
    ArrayData[4,15+SdvigZKU]:=FieldValues['pl15'];
    ArrayData[4,16+SdvigZKU]:=FieldValues['pl16'];
    ArrayData[4,17+SdvigZKU]:=FieldValues['pl17'];
    ArrayData[4,18+SdvigZKU]:=FieldValues['pl18'];
    ArrayData[4,19+SdvigZKU]:=FieldValues['pl19'];
    ArrayData[4,20+SdvigZKU]:=FieldValues['pl'];
    //��������
    ArrayData[5, 1+SdvigZKU]:=FieldValues['sb1'];
    ArrayData[5, 2+SdvigZKU]:=FieldValues['sb2'];
    ArrayData[5, 3+SdvigZKU]:=FieldValues['sb3'];
    ArrayData[5, 4+SdvigZKU]:=FieldValues['sb4'];
    ArrayData[5, 5+SdvigZKU]:=FieldValues['sb5'];
    ArrayData[5, 6+SdvigZKU]:=FieldValues['sb6'];
    ArrayData[5, 7+SdvigZKU]:=FieldValues['sb7'];
    ArrayData[5, 8+SdvigZKU]:=FieldValues['sb8'];
    ArrayData[5, 9+SdvigZKU]:=FieldValues['sb9'];
    ArrayData[5,10+SdvigZKU]:=FieldValues['sb10'];
    ArrayData[5,11+SdvigZKU]:=FieldValues['sb11'];
    ArrayData[5,12+SdvigZKU]:=FieldValues['sb12'];
    ArrayData[5,13+SdvigZKU]:=FieldValues['sb13'];
    ArrayData[5,14+SdvigZKU]:=FieldValues['sb14'];
    ArrayData[5,15+SdvigZKU]:=FieldValues['sb15'];
    ArrayData[5,16+SdvigZKU]:=FieldValues['sb16'];
    ArrayData[5,17+SdvigZKU]:=FieldValues['sb17'];
    ArrayData[5,18+SdvigZKU]:=FieldValues['sb18'];
    ArrayData[5,19+SdvigZKU]:=FieldValues['sb19'];
    ArrayData[5,20+SdvigZKU]:=FieldValues['sb'];
    //��
    ArrayData[6, 1+SdvigZKU]:=FieldValues['pn1'];
    ArrayData[6, 2+SdvigZKU]:=FieldValues['pn2'];
    ArrayData[6, 3+SdvigZKU]:=FieldValues['pn3'];
    ArrayData[6, 4+SdvigZKU]:=FieldValues['pn4'];
    ArrayData[6, 5+SdvigZKU]:=FieldValues['pn5'];
    ArrayData[6, 6+SdvigZKU]:=FieldValues['pn6'];
    ArrayData[6, 7+SdvigZKU]:=FieldValues['pn7'];
    ArrayData[6, 8+SdvigZKU]:=FieldValues['pn8'];
    ArrayData[6, 9+SdvigZKU]:=FieldValues['pn9'];
    ArrayData[6,10+SdvigZKU]:=FieldValues['pn10'];
    ArrayData[6,11+SdvigZKU]:=FieldValues['pn11'];
    ArrayData[6,12+SdvigZKU]:=FieldValues['pn12'];
    ArrayData[6,13+SdvigZKU]:=FieldValues['pn13'];
    ArrayData[6,14+SdvigZKU]:=FieldValues['pn14'];
    ArrayData[6,15+SdvigZKU]:=FieldValues['pn15'];
    ArrayData[6,16+SdvigZKU]:=FieldValues['pn16'];
    ArrayData[6,17+SdvigZKU]:=FieldValues['pn17'];
    ArrayData[6,18+SdvigZKU]:=FieldValues['pn18'];
    ArrayData[6,19+SdvigZKU]:=FieldValues['pn19'];
    ArrayData[6,20+SdvigZKU]:=FieldValues['pn'];

    Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+1, BeginCol];
    Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+1,BeginCol+ColCount-1];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
    Range.RowHeight:=29.25;

    Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+1, BeginCol];
    Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+6,BeginCol+ColCount-1];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
    Range.value:=ArrayData;
    Range.Borders.LineStyle := bsSingle;

    //�������
    Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1, BeginCol];
    Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1, BeginCol+21];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
    Range.Merge;
    ExcelApp.cells[BeginRow+NomRecQ1, BeginCol].value:=
        '������������ � ����������� �������� �� ����� ��������� � ������������ ������';
    BeginRow:=BeginRow+2;
    Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+5, BeginCol];
    Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+5, BeginCol+9];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
    Range.Merge;
    ExcelApp.cells[BeginRow+NomRecQ1+5, BeginCol].value:=
        '��������� ����������________________________________  '+SubsUsers1.FIO1;
    Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+6, BeginCol];
    Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+6, BeginCol+9];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
    Range.Merge;
    ExcelApp.cells[BeginRow+NomRecQ1+6, BeginCol].value:=
        '(�������)';
    Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+7, BeginCol];
    Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+7, BeginCol+9];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
    Range.Merge;
    ExcelApp.cells[BeginRow+NomRecQ1+7, BeginCol].value:='�.�.';
    Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+8, BeginCol];
    Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+8, BeginCol+9];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
    Range.Merge;
    ExcelApp.cells[BeginRow+NomRecQ1+8, BeginCol].value:='';
    Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+5, BeginCol+10];
    Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+5, BeginCol+ColCount-1];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
    Range.Merge;
    ExcelApp.cells[BeginRow+NomRecQ1+5, BeginCol+10].value:=
        '��������� ������    ________________________________  '+SubsUsers1.FIO3;
    Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+6, BeginCol+10];
    Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+6, BeginCol+ColCount-1];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
    Range.Merge;
    ExcelApp.cells[BeginRow+NomRecQ1+6, BeginCol+10].value:=
        '(�������)';
    Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+7, BeginCol+10];
    Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+7, BeginCol+ColCount-1];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
    Range.Merge;
    ExcelApp.cells[BeginRow+NomRecQ1+7, BeginCol+10].value:=
        '����������          ________________________________  '+SubsUsers1.FIO0;
    Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+8, BeginCol+10];
    Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+8, BeginCol+ColCount-1];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
    Range.Merge;
    ExcelApp.cells[BeginRow+NomRecQ1+8, BeginCol+10].value:=
        '(�������)';
    {Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+4,BeginCol];
    Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+7,BeginCol+ColCount-1];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
    Range.Font.Size := 8;
    Range.Font.name := 'Courier New';}

    Next;
  end;
{3. ����� � ���������� ������������ ������� ����-�������}
  //���������� ���������
  k:=-1;
  while k=-1 do
  begin
    try    k:=0; ExcelApp.ActiveWorkbook.SaveAs(p2);
    except k:=-1
    end;
    P2:=PathCopy(p2);
  end;
  ExcelApp.ActiveWorkbook.SaveAs(p2);
  //������ Excel �������
  if VisualReport=True then ExcelApp.Visible:=true
                       else ExcelApp.ActiveWorkbook.Close;
end;
end;

procedure TSubsCommands.CommandCreateSprOtk;
var ExcelApp, Workbook, Range, Cell1, Cell2: Variant;
    BeginCol, BeginRow, SdvigZKU, ColCount, NomRecQ1,k: Integer;
    VisualReport: Boolean;
begin
{0.�������� ����������� � ������������� ������������ ������� ����-�������}
if IBQ1.Active=False  then Exit;
if IBQ1.RecordCount=0 then Exit;
//1.�������� - ���������
try    VisualReport:=StrToBool(p1);
except VisualReport:=True; end;
//2.�������� - ���
if p2='' then p2:=SubsXLSReport1.XLSPath+'������ ����-������� �����.xls'
         else p2:=SubsXLSReport1.XLSPath+p2;
//3.�������� - ��������
if p3<>'' then p3:=' '+p3;
//4.�������� - �����
if p4<>'' then p4:=' '+p4;
//5.�������� - �� �����
if p5='' then p5:=DateToStr(Now);
{1.���������� � ������������}
//���������� ������ �������� ���� �������, � ������� ����� �������� ������
BeginCol := 1;
BeginRow := 0;
//������� ���������� ������� ������
SdvigZKU :=2;
ColCount :=SdvigZKU+20;
if FileExists(p2)=True then DeleteFile(p2);
with IBQ1 do
begin
  First;
  //�������� Excel
  ExcelApp :=CreateOleObject('Excel.Application');
  //��������� ������� Excel �� �������, ����� �������� ����� ����������
  ExcelApp.Application.EnableEvents:=False;
  Workbook :=ExcelApp.WorkBooks.Add(ExtractFilePath(Application.ExeName)+
            'REPORT\MS2.XLS');

{2.������������ ������� ����-�������}
  while not Eof do
  begin 
    NomRecQ1:=16*(RecNo-1)+1;
    ExcelApp.cells[BeginRow+NomRecQ1, 1].value:=
        '���������� ���������� ������ '+SubsUsers1.Rayonu+' ������';
    ExcelApp.cells[BeginRow+NomRecQ1+1, 1].value:='�� '+p5+'�.';
    ExcelApp.cells[BeginRow+NomRecQ1+3, 5].value:=
        '������������';
    ExcelApp.cells[BeginRow+NomRecQ1+4, 2].value:=
        '� ����������� �������� �� ����� ��������� � ������������ ������';
    ExcelApp.cells[BeginRow+NomRecQ1+6, BeginCol].value:=
        '       � ������������ � �������'+p4+' ������������� ������������� ���������� ��������� ��';
    ExcelApp.cells[BeginRow+NomRecQ1+7, BeginCol].value:=
        '14.12.2005 �. � 761 "� �������������� �������� �� ������ ������ ��������� � ������������ ';
    ExcelApp.cells[BeginRow+NomRecQ1+8, BeginCol].value:=
        '�����" ���������� �������������� �������� ����������(��) '+
        AnsiUpperCase(Fieldvalues['fam'])+' '+
        Copy(Fieldvalues['im'],1,1)+'.'+
        Copy(Fieldvalues['ot'],1,1)+'.,';
    ExcelApp.cells[BeginRow+NomRecQ1+9, BeginCol].value:=
        '������������(��) �� ������: '+
        Fieldvalues['socr']+'.'+
        Fieldvalues['street']+','+
        inttostr(Fieldvalues['dom'])+
        Ansiuppercase(Fieldvalues['korp'])+'-'+
        Fieldvalues['kv'];
    ExcelApp.cells[BeginRow+NomRecQ1+10, BeginCol].value:=
        '������ ���� � '+GetVNN(FieldValues['n_dela'])+' �� �������'+p3;
    ExcelApp.cells[BeginRow+NomRecQ1+12, BeginCol].value:=
        '��������� ����������________________________________  '+SubsUsers1.FIO1;
    ExcelApp.cells[BeginRow+NomRecQ1+13, BeginCol].value:=
        '�.�.';
    ExcelApp.cells[BeginRow+NomRecQ1+14, BeginCol].value:=
        '�����������         ________________________________  '+SubsUsers1.FIO0;
    Next;
  end;
{3. ����� � ���������� ������������ ������� ����-�������}
  //���������� ���������
  k:=-1;
  while k=-1 do
  begin
    try    k:=0; ExcelApp.ActiveWorkbook.SaveAs(p2);
    except k:=-1
    end;
    P2:=PathCopy(p2);
  end;
  ExcelApp.ActiveWorkbook.SaveAs(p2);
  //������ Excel �������
  if VisualReport=True then ExcelApp.Visible:=true
                       else ExcelApp.ActiveWorkbook.Close;
end;
end;

procedure TSubsCommands.CommandSetV3ToIB;
var Ob:        Boolean;
    Dt:        TDate;
    ls:        String;
    IDF:       Integer;
    NameField: String;
begin
  //1.���� �� ����� ��������� ����������
  p1:='01'+Copy(p1,3,Length(p1));
  Dt:=StrToDate(p1);
  //2.���� � �������������� �������
  //3.��������� �� ������� �����
  try Ob:=StrToBool(p3);
  except Ob:=False; end;
  //4.�������� �������
  If p4<>'' then NameField:=p4 else NameField:='����';

//������ � ���������� ��������
with BDEQ do
begin
  Active:=False;
  SQL.Text:='select * from "'+p2+'"';
  Active:=True;
  FetchAll;

  IBQ2.Active:=False;
  IBQ2.Prepared:=False;
  If Ob=True
  then IBQ2.SQL.Text:=
    'update main_bank set lschet_b=:ls '+
    'where idd=(select idd from main where(idf=:idf)and'+
    '(dt_n_sub>=:dt))'
  else IBQ2.SQL.Text:=
    'update main_bank set lschet_b=:ls '+
    'where(idd=(select idd from main where(idf=:idf)and'+
    '(dt_n_sub>=:dt)))and(lschet_b=''00000000000000000000'')';
  IBQ2.Prepared:=True;

  First;
  while not Eof do
  begin    
    //1.��������� ls � IDF
    ls:=GetVNN(FieldValues[NameField]);
    while length(ls)<20 do ls:='0'+ls;
    IDF:=FieldValues['tab_n'];

    //2.����������
    IBQ2.ParamByName('ls').AsString:=ls;
    IBQ2.ParamByName('idf').AsInteger:=IDF;
    IBQ2.ParamByName('dt').AsDate:=dt;
    IBQ2.ExecSQL;

    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
  IBQ2.Transaction.CommitRetaining;
end;
end;

procedure TSubsCommands.CommandSetDolg;
var Pr: Boolean;
const
  Dlg1=
    'select * from main m, fio f, s_street s, dolg d, s_zak z where'+
    '(m.idd=f.idd)and(f.step_rod=1)and(m.str=s.kod)and(m.idd=d.idd)and(z.kod=d.zak)and'+
    '(d.dt=:dt)and(d.zak=:zk)and(d.mes in (1,2))order by f.fam, f.im, f.ot';
  Dlg2=
    'select * from main m, fio f, s_street s, dolg d, s_zak z where'+
    '(m.idd=f.idd)and(f.step_rod=1)and(m.str=s.kod)and(m.idd=d.idd)and(z.kod=d.zak)and'+
    '(d.dt=:dt)and(d.zak=:zk)and(d.mes>2)order by f.fam, f.im, f.ot';
begin
  //1.��������
  if Trim(p1)='' then p1:=Copy(ExtractFileName(p2),5,3);
  while Length(p1)<3 do p1:='0'+p1;
  //2.������� ���������
  p2:=Trim(p2);
  //3.���� �� ������� ������������� ����������
  if Trim(p3)=''then
    if p2<>'' then p3:='01.'+Copy(ExtractFileName(p2),9,7)
              else
              begin
                ShowMessage('�� ������������� ����!'+#13+#10+#13+#10+
                            '[�������� ��������]');
                Exit;
              end;
  //4.���������� �� ������  
  //5.����� ��� �������
  if Trim(p5)='' then p5:=ExtractFilePath(Application.ExeName)+'Temp\������\';
  //6.���� ������������
  try StrToDate(p6);
  except p6:=DateToStr(Now); end;

  //7.���������� � ��������� ����
  Pr:=IBQ1.ParamCheck;
  IBQ1.ParamCheck:=True;
  if p2<>'' then SetDolg;

  //8.��������� � ���������������
  IBQ1.Active:=False;
  IBQ1.SQL.Text:=Dlg1;
  IBQ1.Params.ParamValues['zk']:=p1;
  IBQ1.Params.ParamValues['dt']:=p3;
  IBQ1.Active:=True;
  ReportDLG1;
  
  //9.���������������
  IBQ1.Active:=False;
  IBQ1.SQL.Text:=Dlg2;
  IBQ1.Params.ParamValues['zk']:=p1;
  IBQ1.Params.ParamValues['dt']:=p3;
  IBQ1.Active:=True;
  ReportDLG2;
  IBQ1.Active:=False;
  IBQ1.ParamCheck:=Pr;

  //10.�������������
  IBQ1.Transaction.CommitRetaining;
end;

procedure TSubsCommands.CommandCutMainData;
var IDD, p1_1    : String;
    CutDateBefore: String;
    CD           : TDate;
begin
//1.���� ��������
p1:='01'+Copy(p1,3,Length(p1));
CD:=StrToDate(p1);
p1_1:=DateToStr(IncDay(cd,-1));
CutDateBefore:=DateToStr(IncDay(StrToDate(p1), -1));
//2.������ ���������� � main
if Trim(p2)='' then p2:=Const_sql_1;
//3.������ ���������� � FIO
if Trim(p3)='' then p3:=Const_sql_2;
//4.������ �� ������� ������� �� ��
p4:=Trim(p4);
If p4<>'' then
begin
  IBQ1.Active:=False;
  If IBQ1.Prepared then IBQ1.Prepared:=False;
  IBQ1.SQL.Text:=p4;
  IBQ1.Active:=True;
end;
If IBQ1.Active=False then Exit;
//5.������ �� ���������� � main_bank
if Trim(p5)='' then p5:=Const_sql_3;

//������ � ���������� ��������
with IBQ1 do
begin
  First;
  FetchAll;
  while not Eof do
  begin
    if(StrToDate(FieldValues['dt_n_sub'])<CD)and
      (StrToDate(FieldValues['dt_k_sub'])>CD)then
    begin
      //1.��������� ������ IDD
      idd:=GetIDDNew;
      //2.���������� � "main"
      IBQ2.SQL.Text:=p2;
      IBQ2.Params.ParamValues['idd']:=FieldValues['idd'];
      IBQ2.ExecSQL;

      IBQ2.SQL.Text:='update main set idd='+idd+
                     ', dt_n_sub='''+p1+''' where idd=0';
      IBQ2.ExecSQL;

      //3.���������� � "fio"
      IBQ2.SQL.Text:=p3;
      IBQ2.Params.ParamValues['idd']:=FieldValues['idd'];
      IBQ2.ExecSQL;

      IBQ2.SQL.Clear;
      IBQ2.SQL.Add('update fio set idd='+IDD+' where idd=0');
      IBQ2.ExecSQL;

      //4.���������� � "main_bank"
      IBQ2.SQL.Text:=p5;
      IBQ2.Params.ParamValues['idd']:=FieldValues['idd'];
      IBQ2.ExecSQL;

      IBQ2.SQL.Clear;
      IBQ2.SQL.Add('update main_bank set idd='+IDD+' where idd=0');
      IBQ2.ExecSQL;

      //5.��������� � "main_old"
      IBQ2.SQL.Text:=Const_sql_4;
      IBQ2.Params.ParamValues['idd']:=FieldValues['idd'];
      IBQ2.ExecSQL;

      IBQ2.SQL.Clear;
      IBQ2.SQL.Add('update main_old set idd='+IDD+' where idd=0');
      IBQ2.ExecSQL;

      //6.�������� ���� � ������� ����������
      IBQ2.SQL.Clear;
      IBQ2.SQL.Add('update main set last_idd=0, ');
      IBQ2.SQL.Add('dt_k_sub='''+p1_1+''' ');
      IBQ2.SQL.Add('where idd='+IntToStr(FieldValues['idd']));
      IBQ2.ExecSQL;
    end;
    Next;
  end;
  Active:=False;
  Transaction.CommitRetaining;
end;
end;

function TSubsCommands.CommandMessage: Boolean;
begin
if Trim(p1)='' then p1:='�� ������� �������� ����� ����� ������ ��� ������?';
Result:=False;
case MessageDlg(p1, mtCustom, [mbYes, mbNo, mbCancel], 0) of
  mrYes:   Result:=True;
  mrNo:    ShowMessage('�������� ��������!');
  mrCancel:ShowMessage('�������� ��������!');
end;
end;

function TSubsCommands.CommandSetNewVersionBegin: Boolean;
var mx, nom: Integer;
begin
with IBQ1 do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('Select max(n) from log');
  Active:=True;
  if VarIsNull(FieldValues['max']) then mx:=0 else mx:=FieldValues['max'];
  Active:=False;
end;

//���������� �����
p1            :=Trim(p1);
Field_N       :=p1;
Field_Comments:=p2;
//����� �������� ����������
try Nom:=StrToInt(p1) except Nom:=0 end;
if mx+1=Nom then Result:=True else Result:=False;
end;

procedure TSubsCommands.CommandSetNewVersionEnd;
begin
with IBQ1 do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('insert into log (n, comments) values ('+Field_N+', '''+Field_Comments+''')');
  ExecSQL;
  Transaction.CommitRetaining;
end;
end;

procedure TSubsCommands.CommandShowText;
begin
  ShowMessage(p1);
end;

procedure TSubsCommands.CommandSubsCreateSecond;
var IDD        : String;    
    PSNLRefresh: Boolean;
    CD         : TDate;
begin
//1.���� �������
p1:='01'+Copy(p1,3,Length(p1));
CD:=StrToDate(p1);
//2.������ ���������� � main
if Trim(p2)='' then p2:=Const_sql_1;
//3.������ ���������� � FIO
if Trim(p3)='' then p3:=Const_sql_2;
//4.������ �� ������� ������� �� ��
p4:=Trim(p4);
If p4<>'' then
begin
  IBQ1.Active:=False;
  If IBQ1.Prepared then IBQ1.Prepared:=False;
  IBQ1.SQL.Text:=p4;
  IBQ1.Active:=True;
end;
If IBQ1.Active=False then Exit;
//5.��������������� �� ����
try PsnlRefresh:=StrToBool(p5);
except PsnlRefresh:=False; end;
//6.������ �� ���������� � main_bank
if Trim(p6)='' then p6:=Const_sql_3;

//������ � ���������� ��������
with IBQ1 do
begin
  First; 
  FetchAll;
  SubsOperations1.RefreshPSNL:=PsnlRefresh;
  SubsOperations1.DopReestr:=True;

  //����������
  IBQ2.SQL.Text:='delete from main      where idd=0';IBQ2.ExecSQL;
  IBQ2.SQL.Text:='delete from fio       where idd=0';IBQ2.ExecSQL;
  IBQ2.SQL.Text:='delete from main_bank where idd=0';IBQ2.ExecSQL;

  while not Eof do
  begin
    if(StrToDate(FieldValues['dt_n_sub'])<=CD)and
      (StrToDate(FieldValues['dt_k_sub'])>CD)then
    begin
      //1.��������� ������ IDD
      IDD:=GetIDDNew;
      //2.���������� � "main"
      IBQ2.SQL.Text:=p2;
      IBQ2.Params.ParamValues['idd']:=FieldValues['idd'];
      IBQ2.ExecSQL;

      IBQ2.SQL.Text:='update main set idd='+IDD+', '+
        'dt_n_sub='''+p1+''', last_idd=0, dp_r=-1 where idd=0';
      IBQ2.ExecSQL;
      //3.���������� � "fio"
      IBQ2.SQL.Text:=p3;
      IBQ2.Params.ParamValues['idd']:=FieldValues['idd'];
      IBQ2.ExecSQL;

      IBQ2.SQL.Text:='update fio set idd='+IDD+' where idd=0';
      IBQ2.ExecSQL;
      //4.���������� � "main_bank"
      IBQ2.SQL.Text:=p6;
      IBQ2.Params.ParamValues['idd']:=FieldValues['idd'];
      IBQ2.ExecSQL;

      IBQ2.SQL.Text:='update main_bank set idd='+IDD+' where idd=0';
      IBQ2.ExecSQL;
      //5.���������� ��������� ������
      SubsOperations1.SetDataFromIB;
      SubsOperations1.SetOldSub;
      //6.������ ��������
      SubsOperations1.RaschetSubs;
      //7.������
      SubsOperations1.IDD:=StrToInt(IDD);
      SubsOperations1.SetDataToIB;
    end;
    Next; 
  end;
  Active:=False;
  Transaction.CommitRetaining;
end;
end;

procedure TSubsCommands.CommandSubsRefresh;
var PsnlRefresh, KLgRefresh:  Boolean;
    OtoplUpdate:              Boolean;
    OtoplT1,OtoplT2:          Real;
begin
//1.������ �� ������� ������� �� ��
p1:=Trim(p1);
If p1<>'' then
begin
  IBQ1.Active:=False;
  If IBQ1.Prepared then IBQ1.Prepared:=False;
  IBQ1.SQL.Text:=p1;
  IBQ1.Active:=True;
end;
If IBQ1.Active=False then Exit;
//2.���������� ����
try PsnlRefresh:=StrToBool(p2);
except PsnlRefresh:=False; end;
//3.���������� ���������
try OtoplUpdate:=StrToBool(p3);
except OtoplUpdate:=False; end;
//4.��������� ������� ������ ���������
try OtoplT1:=StrToFloat(p4);
except OtoplT1:=0; end;
//5.��������� ������ ������ ���������
try OtoplT2:=StrToFloat(p5);
except OtoplT2:=0; end;
//6.���������� ������������ �����
try KLgRefresh:=StrToBool(p6);
except KLgRefresh:=False; end;

//������ � ���������� ��������
with IBQ1 do
begin
  First;
  FetchAll;
  SubsOperations1.RefreshPSNL:=PsnlRefresh;
  while not Eof do
  begin
    if(FieldValues['stat']<>'1')and(FieldValues['stat']<>'2')then
    begin
      //1.���������� ��������� ������
      if FieldValues['dp_r']=0
      then SubsOperations1.DopReestr:=False
      else SubsOperations1.DopReestr:=True;
      SubsOperations1.SetDataFromIB;
      //2.���������� ���������
      if OtoplUpdate=True
      then SetOtoplenie(OtoplT1, OtoplT2);
      //3.���������� ������������ �����
      SubsOperations1.RefreshKLG:=KLgRefresh;
      //4.������ ��������
      SubsOperations1.RaschetSubs;
      //5.������ "����" � "��������"
      SubsOperations1.IDD:=FieldValues['idd'];
      SubsOperations1.SetDataToIB;
    end;
    Next;
  end;
  Active:=False;
  Transaction.CommitRetaining;
end; 
end;

procedure TSubsCommands.CommandSubsCompare;
var PsnlRefresh, VisualReport: Boolean;
    SbOld  : Real;
    Rslt   : Variant;
    XLSName: String;
begin
//1.������ �� ������� ������� �� ��
p1:=Trim(p1);
If p1<>'' then
begin
  IBQ1.Active:=False;
  If IBQ1.Prepared then IBQ1.Prepared:=False;
  IBQ1.SQL.Text:=p1;
  IBQ1.Active:=True;
end;
If IBQ1.Active=False then Exit;
//2.���������� ����
try PsnlRefresh:=StrToBool(p2);
except PsnlRefresh:=False; end;
//3.�������� ����� �� ����������� ���������
try VisualReport:=StrToBool(p3);
except VisualReport:=True; end;
//4.�������� ������
XLSName:='������������ �������� �������� ����������� '+DateToStr(now)+'�.xls';
if Trim(p4)<>'' then XLSName:=Trim(p4);  

//������ � ���������� ��������
with IBQ1 do
begin
  First;
  FetchAll;
  SubsOperations1.RefreshPSNL:=PsnlRefresh;

  //��������� ���� ��������
  Rslt:=VarArrayCreate([0, RecordCount+1, 1, 10], varVariant);
  Rslt[0,1]:='�';
  Rslt[0,2]:='���';
  Rslt[0,3]:='���.';
  Rslt[0,4]:='�./����';
  Rslt[0,5]:='�������';
  Rslt[0,6]:='���';
  Rslt[0,7]:='��������';
  Rslt[0,8]:='����.��';
  Rslt[0,9]:='����.�����';
  Rslt[0,10]:='<����.>';

  while not Eof do
  begin
    if(FieldValues['stat']<>'1')and(FieldValues['stat']<>'2')then
    begin
      //1.���������� ��������� ������
      if FieldValues['dp_r']=0
      then SubsOperations1.DopReestr:=False
      else SubsOperations1.DopReestr:=True;
      SubsOperations1.SetDataFromIB;
      SbOld:=SubsOperations1.RazmerSubs;
      //2.������ ��������
      SubsOperations1.RaschetSubs;
      //3.����� ����������
      Rslt[RecNo,1]:=RecNo;
      Rslt[RecNo,2]:=FieldValues['idd'];
      Rslt[RecNo,3]:=FieldValues['zak'];
      Rslt[RecNo,4]:=FieldValues['lschet'];
      Rslt[RecNo,5]:=FieldValues['fam'];
      Rslt[RecNo,6]:=FieldValues['im'];
      Rslt[RecNo,7]:=FieldValues['ot'];
      Rslt[RecNo,8]:=SbOld;
      Rslt[RecNo,9]:=SubsOperations1.RazmerSubs;
      Rslt[RecNo,10]:=sr.RoundReal(SbOld-SubsOperations1.RazmerSubs);
    end;
    Next;
  end;
  Active:=False;
  //�������� ������
  SubsXLSReport1.XLSVisible:=VisualReport;
  SubsXLSReport1.XLSPath:=ExtractFilePath(p2);
  SubsXLSReport1.XLSName:=XLSName;
  SubsXLSReport1.XLSCaption.Text:='������������ �������� ��������';
  SubsXLSReport1.StartVA(Rslt);
end;
end;

procedure TSubsCommands.CommandUpdateS_Bank_NomToGDB;
begin
IBQ1.Active:=False;
IBQ1.SQL.Clear;
IBQ1.SQL.add('delete from s_bank_nom');
IBQ1.ExecSQL;
with BDEQ do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_bank_nom');
  Active:=True;
  First;
  while not Eof do
  begin
    IBQ1.SQL.Clear;
    IBQ1.SQL.add('insert into s_bank_nom (bank_nom, bank, adr, ');
    IBQ1.SQL.add('post_ind,tel,rkc,bik, okpo, ksnp, inn, kpp, rsch)values('+
      GetVNN(FieldValues['bank_nom'])     +', '''+
      GetVNN(FieldValues['bank'])    +''','''+
      GetVNN(FieldValues['adr'])     +''','''+
      GetVNN(FieldValues['post_ind'])+''','''+
      GetVNN(FieldValues['tel'])     +''','''+

      GetVNN(FieldValues['rkc'])     +''','''+
      GetVNN(FieldValues['bik'])     +''','''+
      GetVNN(FieldValues['okpo'])    +''','''+
      GetVNN(FieldValues['ksnp'])    +''','''+
      GetVNN(FieldValues['inn'])     +''','''+
      GetVNN(FieldValues['kpp'])     +''','''+
      GetVNN(FieldValues['rsch'])    +''')');
    IBQ1.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
IBQ1.Transaction.CommitRetaining;
end;

procedure TSubsCommands.CommandUpdateS_Bank_OtdToGDB;
begin
IBQ1.Active:=False;
IBQ1.SQL.Clear;
IBQ1.SQL.add('delete from s_bank_otd');
IBQ1.ExecSQL;
with BDEQ do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_bank_otd');
  Active:=True;
  First;
  while not Eof do
  begin
    IBQ1.SQL.Clear;
    IBQ1.SQL.add('insert into s_bank_otd (bank_nom, bank_otd, '+
                            'r1, r2, r3, r4, r5, r6, r7, r8)values('+
        GetVNN(FieldValues['bank_nom'])+', '+
        GetVNN(FieldValues['bank_otd'])+', '+
        GetVNN(FieldValues['r1'])      +', '+
        GetVNN(FieldValues['r2'])      +', '+
        GetVNN(FieldValues['r3'])      +', '+
        GetVNN(FieldValues['r4'])      +', '+
        GetVNN(FieldValues['r5'])      +', '+
        GetVNN(FieldValues['r6'])      +', '+
        GetVNN(FieldValues['r7'])      +', '+
        GetVNN(FieldValues['r8'])      +') ');
    IBQ1.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
IBQ2.Transaction.CommitRetaining;
end;

procedure TSubsCommands.CommandUpdateS_St_N_PlToGDB;
begin
IBQ1.Active:=False;
IBQ1.SQL.Clear;
IBQ1.SQL.add('delete from s_st_n_pl');
IBQ1.ExecSQL;
with BDEQ do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_st_n_pl');
  Active:=True;
  First;
  while not Eof do
  begin
    IBQ1.SQL.Clear;
    IBQ1.SQL.add('insert into s_st_n_pl (kod, kol_vo, name, st_n_pl) values ('+
      GetVNN(FieldValues['kod'])      +', '+
      GetVNN(FieldValues['kol_vo'])   +', '''+
      GetVNN(FieldValues['name'])+''', '+
      GetVNN(FieldValues['st_n_pl']) +')');
    IBQ1.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
IBQ1.Transaction.CommitRetaining;
end;

procedure TSubsCommands.CommandUpdateS_St_N_ZKUToGDB;
begin
IBQ1.Active:=False;
IBQ1.SQL.Clear;
IBQ1.SQL.add('delete from s_st_n_zku');
IBQ1.ExecSQL;
with BDEQ do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_st_n_zku');
  Active:=True;
  First;
  while not Eof do
  begin
    IBQ1.SQL.Clear;
    IBQ1.SQL.add('insert into s_st_n_zku (kod, n, name, st_n_zku, dt, st_n_pl) values ('+
      GetVNN(FieldValues['kod'])      +', '+
      GetVNN(FieldValues['n'])      +', '''+
      GetVNN(FieldValues['name'])+''', '+
      GetVNN(FieldValues['st_n_zku'])+', '''+
      GetVNN(FieldValues['dt'])+''', '+
      GetVNN(FieldValues['st_n_pl'])+')');
    IBQ1.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
IBQ1.Transaction.CommitRetaining;
end;

procedure TSubsCommands.CommandUpdateS_EvToGDB;
begin
IBQ1.Active:=False;
IBQ1.SQL.Clear;
IBQ1.SQL.add('delete from s_ev');
IBQ1.ExecSQL;
with BDEQ do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_ev');
  Active:=True;
  First;
  while not Eof do
  begin
    IBQ1.SQL.Clear;
    IBQ1.SQL.add('insert into s_ev (kod, ev, comments)values('+
      GetVNN(FieldValues['kod'])+', '''+
      GetVNN(FieldValues['ev'])+''', '''+
      GetVNN(FieldValues['comments'])+''')');
    IBQ1.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
IBQ1.Transaction.CommitRetaining;
end;

procedure TSubsCommands.CommandInsertAdrToGDB;
begin
IBQ1.Active:=False;
IBQ1.SQL.Clear;
with BDEQ do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from adr');
  Active:=True;
  First;
  while not Eof do
  begin
    IBQ1.SQL.Clear;
    IBQ1.SQL.add('insert into adr (str, dom, korp, kv, st_bl, t)values('+
      GetVNN(FieldValues['str'])  +', '+
      GetVNN(FieldValues['dom'])  +', '''+
      GetVNN(FieldValues['korp']) +''', '''+
      GetVNN(FieldValues['kv'])   +''', 0'+
      GetVNN(FieldValues['st_bl'])+', ''0'+
      GetVNN(FieldValues['t'])    +''')');
    IBQ1.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
IBQ1.Transaction.CommitRetaining;
end;

procedure TSubsCommands.CommandUpdateS_LgKatToGDB;
begin
IBQ1.Active:=False;
IBQ1.SQL.Clear;
IBQ1.SQL.add('delete from s_lgkat');
IBQ1.ExecSQL;
with BDEQ do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_lgkat');
  Active:=True;
  First;
  while not Eof do
  begin
    IBQ1.SQL.Clear;
    IBQ1.SQL.add('insert into s_lgkat (kod, nazvanie, nom) values ('+
      GetVNN(FieldValues['kod'])+', '''+
      GetVNN(FieldValues['nazvanie'])+''', 0'+
      GetVNN(FieldValues['nom'])+')');
    IBQ1.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
IBQ1.Transaction.CommitRetaining;
end;

procedure TSubsCommands.CommandUpdateS_Proj_MinToGDB;
begin
IBQ1.Active:=False;
IBQ1.SQL.Clear;
IBQ1.SQL.add('delete from s_proj_min');
IBQ1.ExecSQL;
with BDEQ do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_proj_min');
  Active:=True;
  First;
  while not Eof do
  begin
    IBQ1.SQL.Clear;
    IBQ1.SQL.add('insert into s_proj_min (kod, proj_min, gruppa, '+
                            'name, dt_n, dt_k, proj_min_s) values ('+
      GetVNN(FieldValues['kod'])        +', '''+
      GetVNN(FieldValues['proj_min'])   +''', '+
      GetVNN(FieldValues['gruppa'])     +', '''+
      GetVNN(FieldValues['name'])       +''', '''+
      GetVNN(FieldValues['dt_n'])       +''', '''+
      GetVNN(FieldValues['dt_k'])       +''', '''+
      GetVNN(FieldValues['proj_min_s']) +''')');
    IBQ1.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
IBQ1.Transaction.CommitRetaining;
end;

procedure TSubsCommands.CommandUpdateS_RayonToGDB;
begin
IBQ1.Active:=False;
IBQ1.SQL.Clear;
IBQ1.SQL.add('delete from s_rayon');
IBQ1.ExecSQL;
with BDEQ do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_rayon');
  Active:=True;
  First;
  while not Eof do
  begin
    IBQ1.SQL.Clear;
    IBQ1.SQL.add('insert into s_rayon (kod, rayon, rayonu, lim,'+
                 'adr, post_ind, tel, rkc, bik, okpo, ksnp, inn, kpp, '+
                 'rsch, kor_bank) values ('+
        GetVNN(FieldValues['kod'])      +', '''+
        GetVNN(FieldValues['rayon'])    +''', '''+
        GetVNN(FieldValues['rayonu'])   +''', '+
        GetVNN(FieldValues['lim'])      +', '''+

        GetVNN(FieldValues['adr'])      +''', '''+
        GetVNN(FieldValues['post_ind']) +''', '''+
        GetVNN(FieldValues['tel'])      +''', '''+
        GetVNN(FieldValues['rkc'])      +''', '''+
        GetVNN(FieldValues['bik'])      +''', '''+
        GetVNN(FieldValues['okpo'])     +''', '''+
        GetVNN(FieldValues['ksnp'])     +''', '''+
        GetVNN(FieldValues['inn'])      +''', '''+
        GetVNN(FieldValues['kpp'])      +''', '''+
        GetVNN(FieldValues['rsch'])     +''', '''+
        GetVNN(FieldValues['kor_bank']) +''')');
    IBQ1.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
IBQ1.Transaction.CommitRetaining;
end;

procedure TSubsCommands.CommandUpdateS_Soc_NormaToGDB;
begin
IBQ1.Active:=False;
IBQ1.SQL.Clear;
IBQ1.SQL.add('delete from s_soc_norma');
IBQ1.ExecSQL;
with BDEQ do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_soc_norma');
  Active:=True;
  First;
  while not Eof do
  begin
    IBQ1.SQL.Clear;
    IBQ1.SQL.add('insert into s_soc_norma (kod, kol_vo, soc_norma, '+
                     'soc_n_pl) values ('+
      GetVNN(FieldValues['kod'])      +', '+
      GetVNN(FieldValues['kol_vo'])   +', '''+
      GetVNN(FieldValues['soc_norma'])+''', '+
      GetVNN(FieldValues['soc_n_pl']) +')');
    IBQ1.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
IBQ1.Transaction.CommitRetaining;
end;

procedure TSubsCommands.CommandUpdateS_Step_RodstvaToGDB;
begin
IBQ1.Active:=False;
IBQ1.SQL.Clear;
IBQ1.SQL.add('delete from s_step_rodstva');
IBQ1.ExecSQL;
with BDEQ do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_step_rodstva');
  Active:=True;
  First;
  while not Eof do
  begin
    IBQ1.SQL.Clear;
    IBQ1.SQL.add('insert into s_step_rodstva (kod, step_rod) values ('+
        GetVNN(FieldValues['kod'])+', '''+
        GetVNN(FieldValues['step_rod'])+''')');
    IBQ1.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
IBQ1.Transaction.CommitRetaining;
end;

procedure TSubsCommands.CommandUpdateS_StreetToGDB;
begin
IBQ1.Active:=False;
IBQ1.SQL.Clear;
IBQ1.SQL.add('delete from s_street');
IBQ1.ExecSQL;
with BDEQ do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_street');
  Active:=True;
  First;
  while not Eof do
  begin
    IBQ1.SQL.Clear;
    IBQ1.SQL.add('insert into s_street (kod, kod_nda, street, '+
                 'socr, post_ind, kod_gni, kod_city) values ('+
      GetVNN(FieldValues['kod'])     +', '''+
      GetVNN(FieldValues['kod_nda']) +''', '''+
      GetVNN(FieldValues['street'])  +''', '''+
      GetVNN(FieldValues['socr'])    +''', '''+
      GetVNN(FieldValues['post_ind'])+''', '''+
      GetVNN(FieldValues['kod_gni']) +''', '''+
      GetVNN(FieldValues['kod_city'])+''')');
    IBQ1.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
IBQ1.Transaction.CommitRetaining;
end;

procedure TSubsCommands.CommandUpdateS_Vid_DocToGDB;
begin
IBQ1.Active:=False;
IBQ1.SQL.Clear;
IBQ1.SQL.add('delete from s_vid_doc');
IBQ1.ExecSQL;
with BDEQ do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_vid_doc');
  Active:=True;
  First;
  while not Eof do
  begin
    IBQ1.SQL.Clear;
    IBQ1.SQL.add('insert into s_vid_doc (kod, vid_doc, kod_nda, kod_cib) values ('+
                     GetVNN(FieldValues['kod'])+', '''+
                     GetVNN(FieldValues['vid_doc'])+''', '''+
                     GetVNN(FieldValues['kod_nda'])+''', '''+
                     GetVNN(FieldValues['kod_cib'])+''')');
    IBQ1.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
IBQ1.Transaction.CommitRetaining;
end;

procedure TSubsCommands.CommandUpdateS_Vid_SobsToGDB;
begin
IBQ1.Active:=False;
IBQ1.SQL.Clear;
IBQ1.SQL.add('delete from s_vid_sobs');
IBQ1.ExecSQL;
with BDEQ do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_vid_sobs');
  Active:=True;
  First;
  while not Eof do
  begin
    IBQ1.SQL.Clear;
    IBQ1.SQL.add('insert into s_vid_sobs (kod, vid_sobs)values('+
      GetVNN(FieldValues['kod'])   +', '''+
      GetVNN(FieldValues['vid_sobs']) +''')');
    IBQ1.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
IBQ1.Transaction.CommitRetaining;
end;

procedure TSubsCommands.CommandUpdateS_ZakToGDB;
begin
IBQ1.Active:=False;
IBQ1.SQL.Clear;
IBQ1.SQL.add('delete from s_zak');
IBQ1.ExecSQL;
with BDEQ do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_zak');
  Active:=True;
  First;
  while not Eof do
  begin
    IBQ1.SQL.Clear;
    IBQ1.SQL.add('insert into s_zak (kod,nazvanie, rg, '+
                            'r1,r2,r3,r4,r5,r6,r7,r8,comments) values ('+
      GetVNN(FieldValues['kod'])     +', '''+
      GetVNN(FieldValues['nazvanie'])+''', '+
      GetVNN(FieldValues['rg'])      +', '+
      GetVNN(FieldValues['r1'])      +', '+
      GetVNN(FieldValues['r2'])      +', '+
      GetVNN(FieldValues['r3'])      +', '+
      GetVNN(FieldValues['r4'])      +', '+
      GetVNN(FieldValues['r5'])      +', '+
      GetVNN(FieldValues['r6'])      +', '+
      GetVNN(FieldValues['r7'])      +', '+
      GetVNN(FieldValues['r8'])      +', '''+
      GetVNN(FieldValues['comments'])+''')');
    IBQ1.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
IBQ1.Transaction.CommitRetaining;
end;

constructor TSubsCommands.Create(AOwner: TComponent);
begin
  inherited;
  IBQ1:=TIBQuery.Create(IBQ1);
  IBQ2:=TIBQuery.Create(IBQ2);
  IBStoredProc1:=TIBStoredProc.Create(IBStoredProc1);
  IBStoredProc1.StoredProcName:='IDD_NEW';
  SubsOperations1:=TSubsOperations.Create(SubsOperations1);
  SubsXLSReport1:=TSubsXLSReport.Create(SubsXLSReport1);
  SubsUsers1:=TSubsUsers.Create(SubsUsers1);
  BDEQ:=TQuery.Create(BDEQ);
  BDEQ.DatabaseName:='S_DATA';
  FText:=TStringList.Create;
  SetNullParams;
end;

destructor TSubsCommands.Destroy;
begin   
  SubsOperations1.Free;
  SubsXLSReport1.Free;
  SubsUsers1.Free;
  IBStoredProc1.Free;
  IBQ1:=Nil;  IBQ1.Free;
  IBQ2:=Nil;  IBQ2.Free;
  BDEQ.Free;
  FText.Free; 
  inherited;
end;

//���������� ��������
procedure TSubsCommands.Execute;
var SQL_char: PChar;
    i       : Integer;
begin
  if(not Assigned(IBQ1))or(not Assigned(IBQ2))then Exit;
  SetObjectsBefore;
  SetNullParams;
  AutoTryValue:=False;
  AutoSetNotEndingSQL:=False;
  //��������� ���������� ��������
  AutoSetNewVersion:=True;
  AutoSetEndFromMessage:=True;
  //���� ����� ������� ����, ��
  if Trim(FText.Text)='' then Exit;

  SQL_txt:='';
  SQL_char:=Pchar(FText.Text);
  for i:=0 to length(FText.Text)-1 do
  begin
    case Ord(SQL_char[i]) of
    59: if AutoSetNotEndingSQL=False  then
{;}     begin
          if AutoTryValue=False then ExecuteNextSQL else
          begin
            Try ExecuteNextSQL Except end;
          end;
          SQL_txt:='';
          Continue;
        end;
    96: begin
{`}       AutoSetNotEndingSQL:=not(AutoSetNotEndingSQL);
          if AutoTryValue=False then ExecuteNextSQL else
          begin
            Try ExecuteNextSQL Except end;
          end;
          SQL_txt:='';
          Continue;
        end;
   126: begin
{~}       IBQ1.Transaction.CommitRetaining;
          SQL_txt:='';
          Continue;
        end;
    end;
    SQL_txt:=SQL_txt+SQL_char[i];
  end;
  if AutoTryValue=False then
     ExecuteNextSQL else
  begin
    Try
      ExecuteNextSQL
    Except
    end;
  end;
end;

//��������� ������
procedure TSubsCommands.ExecuteNextSQL;
var SQL_txt_old: String;
begin
if Assigned(FOnSubsCommandsEvent) then OnSubsCommandsEvent(Self);
SQL_txt_old:=Trim(SQL_txt);
SQL_txt:=Trim(LowerCase(SQL_txt));

{if(Pos('/*', SQL_txt)>0)and
  (Pos('*/', SQL_txt)>0)and
  (Pos('*/', SQL_txt)>Pos('/*', SQL_txt))then
  ;}
//1.��������� ���������� � ���������� ������
if SQL_txt='commandmessageend' then
begin AutoSetEndFromMessage:=True;
      Exit;
      end;
if(AutoSetEndFromMessage=False)then Exit;
if SQL_txt='commandsetnewversionend' then
begin if AutoSetNewVersion=True then CommandSetNewVersionEnd;
      AutoSetNewVersion:=True;
      Exit;
      end;
if(AutoSetNewVersion=False)then Exit;
if SQL_txt='commandsetnewversionbegin' then
begin AutoSetNewVersion:=CommandSetNewVersionBegin;
      SetNullParams;
      Exit;
      end;
if SQL_txt='commandmessage' then
begin if Trim(p1)='' then AutoSetEndFromMessage:=CommandMessage
 else AutoSetEndFromMessage:=CommandMessage;
      SetNullParams;
      Exit;
      end;
if SQL_txt='commandshowtext' then
begin CommandShowText;
      SetNullParams;
      Exit;
      end;

//2. �������� ���������� ������������ � GDB
if SQL_txt='commandupdates_lgkattogdb' then begin CommandUpdateS_LgKatToGDB;Exit;end;
if SQL_txt='commandupdates_streettogdb' then begin CommandUpdateS_StreetToGDB;Exit;end;
if SQL_txt='commandupdates_vid_doctogdb'then begin CommandUpdateS_Vid_DocToGDB;Exit;end;
if SQL_txt='commandupdates_soc_normatogdb' then begin CommandUpdateS_Soc_NormaToGDB;Exit;end;
if SQL_txt='commandupdates_proj_mintogdb' then begin CommandUpdateS_Proj_MinToGDB;Exit;end;
if SQL_txt='commandupdates_step_rodstvatogdb' then begin CommandUpdateS_Step_RodstvaToGDB;Exit;end;
if SQL_txt='commandupdates_rayontogdb' then begin CommandUpdateS_RayonToGDB;Exit;end;
if SQL_txt='commandupdates_zaktogdb' then begin CommandUpdateS_ZakToGDB;Exit;end;
if SQL_txt='commandupdates_vid_sobstogdb' then begin CommandUpdateS_Vid_SobsToGDB;Exit;end;
if SQL_txt='commandupdates_bank_nomtogdb' then begin CommandUpdateS_Bank_NomToGDB;Exit;end;
if SQL_txt='commandupdates_bank_otdtogdb' then begin CommandUpdateS_Bank_OtdToGDB;Exit;end;
if SQL_txt='commandupdates_st_n_pltogdb' then begin CommandUpdateS_St_N_PlToGDB;Exit;end;
if SQL_txt='commandupdates_st_n_zkutogdb' then begin CommandUpdateS_St_N_ZKUToGDB;Exit;end;
if SQL_txt='commandupdates_evtogdb' then begin CommandUpdateS_EvToGDB;Exit;end;
if SQL_txt='commandinsertadrtogdb' then begin CommandInsertAdrToGDB;Exit;end;

//3. �������� ���������� ������������ � DB
if SQL_txt='commandupdates_lgkattobde' then begin CommandUpdateS_LgKatToBDE;Exit;end;
if SQL_txt='commandupdates_streettobde' then begin CommandUpdateS_StreetToBDE;Exit;end;
if SQL_txt='commandupdates_vid_doctobde'then begin CommandUpdateS_Vid_DocToBDE;Exit;end;
if SQL_txt='commandupdates_soc_normatobde' then begin CommandUpdateS_Soc_NormaToBDE;Exit;end;
if SQL_txt='commandupdates_proj_mintobde' then begin CommandUpdateS_Proj_MinToBDE;Exit;end;
if SQL_txt='commandupdates_step_rodstvatobde' then begin CommandUpdateS_Step_RodstvaToBDE;Exit;end;
if SQL_txt='commandupdates_rayontobde' then begin CommandUpdateS_RayonToBDE;Exit;end;
if SQL_txt='commandupdates_zaktobde' then begin CommandUpdateS_ZakToBDE;Exit;end;
if SQL_txt='commandupdates_vid_sobstobde' then begin CommandUpdateS_Vid_SobsToBDE;Exit;end;
if SQL_txt='commandupdates_bank_nomtobde' then begin CommandUpdateS_Bank_NomToBDE;Exit;end;
if SQL_txt='commandupdates_bank_otdtobde' then begin CommandUpdateS_Bank_OtdToBDE;Exit;end;
if SQL_txt='commandupdates_st_n_pltobde' then begin CommandUpdateS_St_N_PlToBDE;Exit;end;
if SQL_txt='commandupdates_st_n_zkutobde' then begin CommandUpdateS_St_N_ZKUToBDE;Exit;end;
if SQL_txt='commandinsertadrtobde' then begin CommandInsertAdrToBDE;Exit;end;

//4.�������� ������ � ��������
if SQL_txt='commandtrybegin' then begin AutoTryValue:=True;Exit;end;
if SQL_txt='commandtryend' then begin AutoTryValue:=False;Exit;end;
if SQL_txt='commandsubscreatesecond' then begin CommandSubsCreateSecond;SetNullParams;Exit;end;
if SQL_txt='commandsubsrefresh' then begin CommandSubsRefresh;SetNullParams;Exit;end;
if SQL_txt='commandsubscompare' then begin CommandSubsCompare;SetNullParams;Exit;end;
if SQL_txt='commandcutmaindata' then begin CommandCutMainData;SetNullParams;Exit;end;
if SQL_txt='commandcreatereport' then
begin
  try SubsXLSReport1.XLSVisible:=StrToBool(p1) except
  SubsXLSReport1.XLSVisible:=True end;
  SubsXLSReport1.XLSName:=p2;
  SubsXLSReport1.XLSCaption.Text:=p3;
  try SubsXLSReport1.Start except end;
  SetNullParams;
  Exit;
end;
if SQL_txt='commandcreatespr'    then begin CommandCreateSpr;SetNullParams;Exit;end;
if SQL_txt='commandcreatesprotk' then begin CommandCreateSprOtk;SetNullParams;Exit;end;
if SQL_txt='commandsetv3toib'    then begin CommandSetV3ToIB;SetNullParams;Exit;end;
if SQL_txt='commandsetdolg'      then begin CommandSetDolg;SetNullParams;Exit;end;
if SQL_txt='commandchangetarifs' then begin CommandChangeTarifs;SetNullParams;Exit;end;

//5.�������� ������ � �����������
if Copy(SQL_txt_old,1,4)='1:>>' then begin p1:=Copy(SQL_txt_old,5,length(SQL_txt_old)-4);Exit;end;
if Copy(SQL_txt_old,1,4)='2:>>' then begin p2:=Copy(SQL_txt_old,5,length(SQL_txt_old)-4);Exit;end;
if Copy(SQL_txt_old,1,4)='3:>>' then begin p3:=Copy(SQL_txt_old,5,length(SQL_txt_old)-4);Exit;end;
if Copy(SQL_txt_old,1,4)='4:>>' then begin p4:=Copy(SQL_txt_old,5,length(SQL_txt_old)-4);Exit;end;
if Copy(SQL_txt_old,1,4)='5:>>' then begin p5:=Copy(SQL_txt_old,5,length(SQL_txt_old)-4);Exit;end;
if Copy(SQL_txt_old,1,4)='6:>>' then begin p6:=Copy(SQL_txt_old,5,length(SQL_txt_old)-4);Exit;end;
if Copy(SQL_txt_old,1,4)='7:>>' then begin p7:=Copy(SQL_txt_old,5,length(SQL_txt_old)-4);Exit;end;
if Copy(SQL_txt_old,1,4)='8:>>' then begin p8:=Copy(SQL_txt_old,5,length(SQL_txt_old)-4);Exit;end;
if Copy(SQL_txt_old,1,4)='9:>>' then begin p9:=Copy(SQL_txt_old,5,length(SQL_txt_old)-4);Exit;end;

//6.�������� ���������� ��������� ��������
if Length(SQL_txt_old)>0 then
  with IBQ1 do
  begin
    Active:=False;
    SQL.Text:=SQL_txt_old;
    Active:=True;
    if RecordCount>0 then FetchAll;
  end;
end;

function TSubsCommands.GetIDDNew: String;
begin
  If IBStoredProc1.Prepared=False then IBStoredProc1.Prepared:=True;
  try
    IBStoredProc1.ExecProc;
    Result:=IBStoredProc1.ParamByName('idd').AsString;
  except
    ShowMessage('������ ���������� ��������� ��������� "IDD_NEW"!');
    Result:='Error';
  end;
end;

procedure TSubsCommands.SetFText(AValue: TStrings);
begin
  if FText.Text <> AValue.Text then
  begin
    FText.BeginUpdate;
    try
      FText.Assign(AValue);
    finally
      FText.EndUpdate;
    end;
  end;
end;

{��������� ��������� � �����������}
procedure TSubsCommands.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if(Operation=opRemove)and(AComponent=IBQ1)then IBQ1:=nil; 
  if(Operation=opRemove)and(AComponent=SubsXLSReport1.ProgressBarSet)
    then SubsXLSReport1.ProgressBarSet:=nil;    
end;

//���������� ������ �� ����������������  ������ BDEQ
function TSubsCommands.GetBBDECount: Integer;
begin
  Result:=BDEQ.RecordCount;
end;

function TSubsCommands.GetBDERecNo: Integer;
begin
  Result:=BDEQ.RecNo;
end;

{���������� ��������� ������ (�������)}
procedure TSubsCommands.SetIBQ1(AValue: TIBQuery);
begin
  if AValue<>IBQ1 then
  begin
    if AValue<>nil then
    begin
      if Assigned(IBQ1)and(IBQ1.Owner=Self)then IBQ1.Free;
      IBQ1:=AValue;
      IBQ1.FreeNotification(self);
    end else //nil value
    begin
      if Assigned(IBQ1)and(IBQ1.Owner<>Self)then
      begin
        //IBQ1:=TIBQuery.Create(Self);
        IBQ1.Name:='IBQ1'; //optional bit, but makes result much nicer
        IBQ1.SetSubComponent(True);
        IBQ1.FreeNotification(Self);
      end;
    end;
  end;
  SubsOperations1.IBDataSet:=IBQ1;
  SubsXLSReport1.DataSet:=IBQ1;
end;

procedure TSubsCommands.SetNullParams;
begin
  p1:=''; p2:=''; p3:=''; p4:=''; p5:='';
  p6:=''; p7:=''; p8:=''; p9:=''; p10:='';
  p11:='';p12:='';p13:='';p14:='';p15:='';
  p16:='';p17:='';p18:='';p19:='';p20:='';
end;

procedure TSubsCommands.SetObjectsBefore;
begin
  IBStoredProc1.Database:=    IBQ1.Database;
  IBStoredProc1.Transaction:= IBQ1.Transaction;
  IBQ2.Database:=             IBQ1.Database;
  IBQ2.Transaction:=          IBQ1.Transaction;
  SubsOperations1.IBDataSet2:=IBQ2;
                                                               
  SubsUsers1.IBDataSet:=IBQ2;
  SubsUsers1.GetUsers;
  IBQ1.ParamCheck:=False;
end;

procedure TSubsCommands.SetPrBar(AValue: TProgressBar);
begin
  if AValue<>SubsXLSReport1.ProgressBarSet then
  begin
    if AValue<>nil then
    begin
      if Assigned(SubsXLSReport1.ProgressBarSet)and(SubsXLSReport1.ProgressBarSet.Owner=Self)then SubsXLSReport1.ProgressBarSet.Free;
      SubsXLSReport1.ProgressBarSet:=AValue;
      SubsXLSReport1.ProgressBarSet.FreeNotification(Self);
    end else //nil value
    begin
      if Assigned(SubsXLSReport1.ProgressBarSet)and(SubsXLSReport1.ProgressBarSet.Owner<>Self)then
      begin  
        SubsXLSReport1.ProgressBarSet.Name:='SubsXLSReport1ProgressBarSet'; //optional bit, but makes result much nicer
        SubsXLSReport1.ProgressBarSet.SetSubComponent(True);
        SubsXLSReport1.ProgressBarSet.FreeNotification(Self);
      end;
    end;
  end;
end;

function TSubsCommands.GetPrBar: TProgressBar;
begin
  Result:=SubsXLSReport1.ProgressBarSet;
end;

function TSubsCommands.GetXLSPath: String;
begin
  Result:=SubsXLSReport1.XLSPath;
end;

procedure TSubsCommands.SetXLSPath(AValue: String);
begin
  SubsXLSReport1.XLSPath:=AValue;
end;

procedure TSubsCommands.SetOtoplenie(Const OtoplT1, OtoplT2: Real);
var k_lgot     : Real;
    n1,n2,n3,n4: Real;
begin
  k_lgot:=0;
  n1:=SR.RoundReal(IBQ1.FieldValues['soc_nrm_pl'],2);
  n2:=SR.RoundReal(IBQ1.FieldValues['soc_n_r_pl'],2);
  n3:=SR.RoundReal(IBQ1.FieldValues['obsh_pl'],2);
  //���� �� ���. � ���. �����
  if SubsOperations1.ZKUNew[4, 1]>0 then
  begin
    //1.0.��������� ����
    If SubsOperations1.ZKUNew[4,3]>0 then
    begin
      //1.1.�������� �����������
      k_lgot:=SubsOperations1.ZKUNew[5,3]/SubsOperations1.ZKUNew[4,3];
      //1.2.����� ���
      If OtoplT1<>0
      then n4:=SR.RoundReal(SubsOperations1.ZKUNew[4,3]/OtoplT1,2)
      else n4:=0;
      If(n4=n1)then SubsOperations1.ZKUNew[4,3]:=SR.RoundReal(n1*OtoplT2);
      If(n4=n2)then SubsOperations1.ZKUNew[4,3]:=SR.RoundReal(n2*OtoplT2);
      If(n4=n3)then SubsOperations1.ZKUNew[4,3]:=SR.RoundReal(n3*OtoplT2);
      If(n4<>n1)and(n4<>n2)and(n4<>n3)
      then SubsOperations1.ZKUNew[4,3]:=SR.RoundReal(SubsOperations1.ZKUNew[4,3]*OtoplT2/OtoplT1);
    end else
    //2.0.��������� ���
    begin
      //2.1.�������� �����������
      k_lgot:=SubsOperations1.ZKUNew[5,1]/SubsOperations1.ZKUNew[4,1];
      //2.2.����� ���
      SubsOperations1.ZKUNew[4,3]:=SR.RoundReal(n2*OtoplT2);
    end;
  end;
  //3.0.������
  SubsOperations1.ZKUNew[5,3]:=Sr.RoundReal(SubsOperations1.ZKUNew[4,3]*k_lgot);
  SubsOperations1.ZKUNew[4,20]:=
    SubsOperations1.ZKUNew[4,1] +SubsOperations1.ZKUNew[4,2]+
    SubsOperations1.ZKUNew[4,3] +SubsOperations1.ZKUNew[4,4]+
    SubsOperations1.ZKUNew[4,5] +SubsOperations1.ZKUNew[4,6]+
    SubsOperations1.ZKUNew[4,7] +SubsOperations1.ZKUNew[4,8]+
    SubsOperations1.ZKUNew[4,9] +SubsOperations1.ZKUNew[4,10]+
    SubsOperations1.ZKUNew[4,11]+SubsOperations1.ZKUNew[4,12]+
    SubsOperations1.ZKUNew[4,13]+SubsOperations1.ZKUNew[4,14]+
    SubsOperations1.ZKUNew[4,15]+SubsOperations1.ZKUNew[4,16]+
    SubsOperations1.ZKUNew[4,17]+SubsOperations1.ZKUNew[4,18]+
    SubsOperations1.ZKUNew[4,19];
  SubsOperations1.ZKUNew[5,20]:=
    SubsOperations1.ZKUNew[5,1] +SubsOperations1.ZKUNew[5,2]+
    SubsOperations1.ZKUNew[5,3] +SubsOperations1.ZKUNew[5,4]+
    SubsOperations1.ZKUNew[5,5] +SubsOperations1.ZKUNew[5,6]+
    SubsOperations1.ZKUNew[5,7] +SubsOperations1.ZKUNew[5,8]+
    SubsOperations1.ZKUNew[5,9] +SubsOperations1.ZKUNew[5,10]+
    SubsOperations1.ZKUNew[5,11]+SubsOperations1.ZKUNew[5,12]+
    SubsOperations1.ZKUNew[5,13]+SubsOperations1.ZKUNew[5,14]+
    SubsOperations1.ZKUNew[5,15]+SubsOperations1.ZKUNew[5,16]+
    SubsOperations1.ZKUNew[5,17]+SubsOperations1.ZKUNew[5,18]+
    SubsOperations1.ZKUNew[5,19];
end;

//������� ��� ����� � ����� � �����
function DeleteDir(Dir: string; DelDir: Boolean=False): boolean;
var
  Found:     Integer;
  SearchRec: TSearchRec;
begin
  Result:=True;
  If Copy(Dir, Length(Dir), 1)<>'\' then Dir:=Dir+'\';
  Found:=FindFirst(Dir+'*.*', faAnyFile, SearchRec);
  while Found=0 do
  begin
    if SearchRec.Attr and faDirectory = 0 then
      if not DeleteFile(Dir+SearchRec.name) then
      begin
        ShowMessage('�� ���� ������� ����: ' + SearchRec.name);
        Result:=False;
      end;
    Found:=FindNext(SearchRec);
  end;
  FindClose(SearchRec);
  if DelDir=True then RemoveDir(Dir);
end;

{��������� �������������� ������ ���e���� - xor ���������
���� ������� ��� ����������� � �������������
Input - ������� ������. ��� ����������� ��� ���������������� ������,
��� ������������ ��� �������������� ������.
Key - ����� ���� ���� � ��� �� � ����� �������.

��� ���������� �������� �� ������� ������ �
������ ����� �� ������ ���������� ������ '#0'}
function VigenerCoDec(Value, Key: pchar): pchar;
var
  i, j: integer;
  tmps, text: string;
begin
  text := Value;
  for i := 1 to length(text) do
  begin
    if i > length(key) then
      j := i mod length(key)
    else
      j := i;
    tmps := tmps + chr((ord(text[i])) xor (ord(key[j])));
  end;
  Result:=PChar(tmps);
end; 

//��������� ���-�� ���� ������ ���������
function GetWorkDay(Reg: String; Value: String=''; Key: String='Default'; Day: Word=30): Integer;

  function GetDt(Day: Word):String;
  begin
    Result:=FormatDateTime('DD.MM.YYYY', IncDay(Now, Day+1));
  end;

  function GetDay(Dt: String): Integer;
  begin
    if Dt='00.00.0000' then Result:=-1
    else
    begin
      if StrToDate(Dt)<Now
      then Result:=0
      else Result:=Round(StrToDate(Dt)-Now);
    end;
  end;

var
  h: TRegistry;
  OldKey, OldValue: String;
Const
  K='Default';
begin
  h:=TRegistry.Create;
  with h do
  begin
    RootKey:=HKEY_LOCAL_MACHINE;
    OpenKey('\Software\'+Reg, True);
    if ReadString('Key')='' then
    begin
      WriteString('Key', K);
      WriteString('Value', VigenerCoDec(PAnsiChar(GetDt(Day)), PAnsiChar(K)));
    end;

    OldKey:=ReadString('Key');
    OldValue:=ReadString('Value');
    if(Key<>OldKey)and(Key<>'')      then WriteString('Key', Key);
    if(Value<>OldValue)and(Value<>'')then WriteString('Value', Value);
    try
      Result:=GetDay(VigenerCoDec(PAnsiChar(ReadString('Value')), PAnsiChar(ReadString('Key'))));
    except
      WriteString('Key', OldKey);
      WriteString('Value', OldValue);
      try
        Result:=GetDay(VigenerCoDec(PAnsiChar(ReadString('Value')), PAnsiChar(ReadString('Key'))));
      except
        Result:=0
      end;
    end;
    CloseKey;
    Free;
  end;
end;

procedure TSubsCommands.CommandUpdateS_LgKatToBDE;
begin
BDEQ.Active:=False;
BDEQ.SQL.Clear;
BDEQ.SQL.add('delete from s_lgkat');
BDEQ.ExecSQL;
with IBQ1 do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_lgkat');
  Active:=True;
  First;
  while not Eof do
  begin
    BDEQ.SQL.Clear;
    BDEQ.SQL.Add('insert into s_lgkat (kod, nazvanie, nom) values ('+
      GetVNN(FieldValues['kod'])+', '''+
      GetVNN(FieldValues['nazvanie'])+''', 0'+
      GetVNN(FieldValues['nom'])+')');
    BDEQ.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
end;

procedure TSubsCommands.CommandUpdateS_StreetToBDE;
begin
BDEQ.Active:=False;
BDEQ.SQL.Clear;
BDEQ.SQL.add('delete from s_street');
BDEQ.ExecSQL;
with IBQ1 do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_street');
  Active:=True;
  First;
  while not Eof do
  begin
    BDEQ.SQL.Clear;
    BDEQ.SQL.add('insert into s_street (kod, kod_nda, street, '+
                 'socr, post_ind, kod_gni, kod_city) values ('+
      GetVNN(FieldValues['kod'])     +', '''+
      GetVNN(FieldValues['kod_nda']) +''', '''+
      GetVNN(FieldValues['street'])  +''', '''+
      GetVNN(FieldValues['socr'])    +''', '''+
      GetVNN(FieldValues['post_ind'])+''', '''+
      GetVNN(FieldValues['kod_gni']) +''', '''+
      GetVNN(FieldValues['kod_city'])+''')');
    BDEQ.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
end;

procedure TSubsCommands.CommandUpdateS_Vid_DocToBDE;
begin
BDEQ.Active:=False;
BDEQ.SQL.Clear;
BDEQ.SQL.add('delete from s_vid_doc');
BDEQ.ExecSQL;
with IBQ1 do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_vid_doc');
  Active:=True;
  First;
  while not Eof do
  begin
    BDEQ.SQL.Clear;
    BDEQ.SQL.add('insert into s_vid_doc (kod, vid_doc, kod_nda, kod_cib) values ('+
                     GetVNN(FieldValues['kod'])+', '''+
                     GetVNN(FieldValues['vid_doc'])+''', '''+
                     GetVNN(FieldValues['kod_nda'])+''', '''+
                     GetVNN(FieldValues['kod_cib'])+''')');
    BDEQ.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
end;

procedure TSubsCommands.CommandUpdateS_Soc_NormaToBDE;
begin
BDEQ.Active:=False;
BDEQ.SQL.Clear;
BDEQ.SQL.add('delete from s_soc_norma');BDEQ.ExecSQL;
with IBQ1 do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_soc_norma');
  Active:=True;
  First;
  while not Eof do
  begin
    BDEQ.SQL.Clear;
    BDEQ.SQL.add('insert into s_soc_norma (kod, kol_vo, soc_norma, '+
                     'soc_n_pl) values ('+
      GetVNN(FieldValues['kod'])      +', '+
      GetVNN(FieldValues['kol_vo'])   +', '''+
      GetVNN(FieldValues['soc_norma'])+''', '+
      GetVNN(FieldValues['soc_n_pl']) +')');
    BDEQ.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
end;

procedure TSubsCommands.CommandUpdateS_Proj_MinToBDE;
begin
BDEQ.Active:=False;
BDEQ.SQL.Clear;
BDEQ.SQL.add('delete from s_proj_min');
BDEQ.ExecSQL;
with IBQ1 do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_proj_min');
  Active:=True;
  First;
  while not Eof do
  begin
    BDEQ.SQL.Clear;
    BDEQ.SQL.add('insert into s_proj_min (kod, proj_min, gruppa, '+
                 'name, dt_n, dt_k, proj_min_s) values ('+
      GetVNN(FieldValues['kod'])        +', '''+
      GetVNN(FieldValues['proj_min'])   +''', '+
      GetVNN(FieldValues['gruppa'])     +', '''+
      GetVNN(FieldValues['name'])       +''', '''+
      GetVNN(FieldValues['dt_n'])       +''', '''+
      GetVNN(FieldValues['dt_k'])       +''', '''+
      GetVNN(FieldValues['proj_min_s']) +''')');
    BDEQ.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
end;

procedure TSubsCommands.CommandUpdateS_Step_RodstvaToBDE;
begin
BDEQ.Active:=False;
BDEQ.SQL.Clear;
BDEQ.SQL.add('delete from s_step_rodstva');
BDEQ.ExecSQL;
with IBQ1 do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_step_rodstva');
  Active:=True;
  First;
  while not Eof do
  begin
    BDEQ.SQL.Clear;
    BDEQ.SQL.add('insert into s_step_rodstva (kod, step_rod) values ('+
        GetVNN(FieldValues['kod'])+', '''+
        GetVNN(FieldValues['step_rod'])+''')');
    BDEQ.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
end;

procedure TSubsCommands.CommandUpdateS_RayonToBDE;
begin
BDEQ.Active:=False;
BDEQ.SQL.Clear;
BDEQ.SQL.add('delete from s_rayon');
BDEQ.ExecSQL;
with IBQ1 do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_rayon');
  Active:=True;
  First;
  while not Eof do
  begin
    BDEQ.SQL.Clear;
    BDEQ.SQL.add('insert into s_rayon (kod, rayon, rayonu, lim,'+
                 'adr, post_ind, tel, rkc, bik, okpo, ksnp, inn, kpp, '+
                 'rsch, kor_bank) values ('+
        GetVNN(FieldValues['kod'])      +', '''+
        GetVNN(FieldValues['rayon'])    +''', '''+
        GetVNN(FieldValues['rayonu'])   +''', '+
        GetVNN(FieldValues['lim'])      +', '''+

        GetVNN(FieldValues['adr'])      +''', '''+
        GetVNN(FieldValues['post_ind']) +''', '''+
        GetVNN(FieldValues['tel'])      +''', '''+
        GetVNN(FieldValues['rkc'])      +''', '''+
        GetVNN(FieldValues['bik'])      +''', '''+
        GetVNN(FieldValues['okpo'])     +''', '''+
        GetVNN(FieldValues['ksnp'])     +''', '''+
        GetVNN(FieldValues['inn'])      +''', '''+
        GetVNN(FieldValues['kpp'])      +''', '''+
        GetVNN(FieldValues['rsch'])     +''', '''+
        GetVNN(FieldValues['kor_bank']) +''')');
    BDEQ.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
end;

procedure TSubsCommands.CommandUpdateS_ZakToBDE;
begin
BDEQ.Active:=False;
BDEQ.SQL.Clear;
BDEQ.SQL.add('delete from s_zak');
BDEQ.ExecSQL;
with IBQ1 do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_zak where(r'+SubsUsers1.Rai+'=-1)');
  Active:=True;
  First;
  while not Eof do
  begin
    BDEQ.SQL.Clear;
    BDEQ.SQL.add('insert into s_zak (kod,nazvanie, rg, '+
                 'r1,r2,r3,r4,r5,r6,r7,r8,comments) values ('+
      GetVNN(FieldValues['kod'])     +', '''+
      GetVNN(FieldValues['nazvanie'])+''', '+
      GetVNN(FieldValues['rg'])      +', '+
      GetVNN(FieldValues['r1'])      +', '+
      GetVNN(FieldValues['r2'])      +', '+
      GetVNN(FieldValues['r3'])      +', '+
      GetVNN(FieldValues['r4'])      +', '+
      GetVNN(FieldValues['r5'])      +', '+
      GetVNN(FieldValues['r6'])      +', '+
      GetVNN(FieldValues['r7'])      +', '+
      GetVNN(FieldValues['r8'])      +', '''+
      GetVNN(FieldValues['comments'])+''')');
    BDEQ.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
end;

procedure TSubsCommands.CommandUpdateS_Vid_SobsToBDE;
begin
BDEQ.Active:=False;
BDEQ.SQL.Clear;
BDEQ.SQL.add('delete from s_vid_sobs');
BDEQ.ExecSQL;
with IBQ1 do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_vid_sobs');
  Active:=True;
  First;
  while not Eof do
  begin
    BDEQ.SQL.Clear;
    BDEQ.SQL.add('insert into s_vid_sobs (kod, vid_sobs)values('+
      GetVNN(FieldValues['kod'])   +', '''+
      GetVNN(FieldValues['vid_sobs']) +''')');
    BDEQ.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
end;

procedure TSubsCommands.CommandUpdateS_Bank_NomToBDE;
begin
BDEQ.Active:=False;
BDEQ.SQL.Clear;
BDEQ.SQL.add('delete from s_bank_nom');
BDEQ.ExecSQL;
with IBQ1 do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_bank_nom');
  Active:=True;
  First;
  while not Eof do
  begin
    BDEQ.SQL.Clear;
    BDEQ.SQL.add('insert into s_bank_nom (bank_nom, bank, adr, ');
    BDEQ.SQL.add('post_ind,tel,rkc,bik, okpo, ksnp, inn, kpp, rsch)values('+
      GetVNN(FieldValues['bank_nom'])     +', '''+
      GetVNN(FieldValues['bank'])    +''','''+
      GetVNN(FieldValues['adr'])     +''','''+
      GetVNN(FieldValues['post_ind'])+''','''+
      GetVNN(FieldValues['tel'])     +''','''+

      GetVNN(FieldValues['rkc'])     +''','''+
      GetVNN(FieldValues['bik'])     +''','''+
      GetVNN(FieldValues['okpo'])    +''','''+
      GetVNN(FieldValues['ksnp'])    +''','''+
      GetVNN(FieldValues['inn'])     +''','''+
      GetVNN(FieldValues['kpp'])     +''','''+
      GetVNN(FieldValues['rsch'])    +''')');
    BDEQ.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
end;

procedure TSubsCommands.CommandUpdateS_Bank_OtdToBDE;
begin
BDEQ.Active:=False;
BDEQ.SQL.Clear;
BDEQ.SQL.add('delete from s_bank_otd');
BDEQ.ExecSQL;
with IBQ1 do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_bank_otd');
  Active:=True;
  First;
  while not Eof do
  begin
    BDEQ.SQL.Clear;
    BDEQ.SQL.add('insert into s_bank_otd (bank_nom, bank_otd, '+
                            'r1, r2, r3, r4, r5, r6, r7, r8)values('+
        GetVNN(FieldValues['bank_nom'])+', '+
        GetVNN(FieldValues['bank_otd'])+', '+
        GetVNN(FieldValues['r1'])      +', '+
        GetVNN(FieldValues['r2'])      +', '+
        GetVNN(FieldValues['r3'])      +', '+
        GetVNN(FieldValues['r4'])      +', '+
        GetVNN(FieldValues['r5'])      +', '+
        GetVNN(FieldValues['r6'])      +', '+
        GetVNN(FieldValues['r7'])      +', '+
        GetVNN(FieldValues['r8'])      +') ');
    BDEQ.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
end;

procedure TSubsCommands.CommandUpdateS_St_N_PlToBDE;
begin
BDEQ.Active:=False;
BDEQ.SQL.Clear;
BDEQ.SQL.add('delete from s_st_n_pl');BDEQ.ExecSQL;
with IBQ1 do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_st_n_pl');
  Active:=True;
  First;
  while not Eof do
  begin
    BDEQ.SQL.Clear;
    BDEQ.SQL.add('insert into s_st_n_pl (kod, kol_vo, name, st_n_pl) values ('+
      GetVNN(FieldValues['kod'])      +', '+
      GetVNN(FieldValues['kol_vo'])   +', '''+
      GetVNN(FieldValues['name'])+''', '+
      GetVNN(FieldValues['st_n_pl']) +')');
    BDEQ.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
end;

procedure TSubsCommands.CommandUpdateS_St_N_ZKUToBDE;
begin
BDEQ.Active:=False;
BDEQ.SQL.Clear;
BDEQ.SQL.add('delete from s_st_n_zku');BDEQ.ExecSQL;
with IBQ1 do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from s_st_n_zku');
  Active:=True;
  First;
  while not Eof do
  begin
    BDEQ.SQL.Clear;
    BDEQ.SQL.add('insert into s_st_n_zku (kod, n, name, st_n_zku, dt, st_n_pl) values ('+
      GetVNN(FieldValues['kod'])      +', '+
      GetVNN(FieldValues['n'])      +', '''+
      GetVNN(FieldValues['name'])+''', '+
      GetVNN(FieldValues['st_n_zku']) +','''+
      GetVNN(FieldValues['dt'])+''', '+
      GetVNN(FieldValues['st_n_pl'])+')');
    BDEQ.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
end;

procedure TSubsCommands.CommandInsertAdrToBDE;
begin
BDEQ.Active:=False;
BDEQ.SQL.Clear;
with IBQ1 do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from adr');
  Active:=True;
  First;
  while not Eof do
  begin
    BDEQ.SQL.Clear;
    BDEQ.SQL.add('insert into adr (str, dom, korp, kv, st_bl, t) values ('+
      GetVNN(FieldValues['str'])  +', '+
      GetVNN(FieldValues['dom'])  +', '''+
      GetVNN(FieldValues['korp']) +''','''+
      GetVNN(FieldValues['kv'])   +''', 0'+
      GetVNN(FieldValues['st_bl'])+', ''0'+
      GetVNN(FieldValues['t'])    +''')');
    BDEQ.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  Active:=False;
end;
end;

procedure TSubsCommands.SetDolg;
begin
IBQ1.Active:=False;
with BDEQ do
begin
  Active:=False;
  SQL.Clear;
  SQL.Add('select * from "'+p2+'"');
  Active:=True;
  First;

  If IBQ1.Prepared then IBQ1.UnPrepare;
  IBQ1.SQL.Clear;
  IBQ1.SQL.add('insert into dolg (dt, zak, lschet, rai, sm_nch, sm_opl, sm_dlg, mes)');
  IBQ1.SQL.add('values(:dt, :zak, :l_schet, :rai, :sm_nch, :sm_opl, :sm_dlg, :mes)');
  IBQ1.Prepare;

  while not Eof do
  begin
    IBQ1.ParamByName('dt').Value:=p3;
    IBQ1.ParamByName('zak').Value:=p1;
    IBQ1.ParamByName('l_schet').Value:=FieldValues['l_schet'];
    IBQ1.ParamByName('rai').Value:=FieldValues['k_raion'];
    IBQ1.ParamByName('sm_nch').Value:=FieldValues['sm_nch'];
    IBQ1.ParamByName('sm_opl').Value:=FieldValues['sm_opl'];
    IBQ1.ParamByName('sm_dlg').Value:=FieldValues['sm_dlg'];
    IBQ1.ParamByName('mes').Value:=FieldValues['mes'];
    IBQ1.ExecSQL;
    if Assigned(FOnBDEQNextEvent) then OnBDEQNextEvent(Self);
    Next;
  end;
  IBQ1.UnPrepare;
  Active:=False;
end;
end;

//����������� � ��������� ���������������
procedure TSubsCommands.ReportDLG1;
var ExcelApp, Workbook, Range, Cell1, Cell2, ArrayData: Variant;
    BeginCol, BeginRow, ColCount, NomRecQ1, RowCount,k: Integer;
    p51: String;
begin
{0.�������� ����������� � ������������� ������������ ������� ����-�������}
if IBQ1.Active=False then Exit;
if IBQ1.RecordCount=0 then Exit;  

{1.���������� � ������������}
//���������� ������ �������� ���� �������, � ������� ����� �������� ������
BeginCol := 1;
BeginRow := 0;
//������� ���������� ������� ������
ColCount :=9;
RowCount :=27;
with IBQ1 do
begin
  First;
  //�������� Excel
  ExcelApp :=CreateOleObject('Excel.Application');
  //��������� ������� Excel �� �������, ����� �������� ����� ����������
  ExcelApp.Application.EnableEvents:=False;
  Workbook :=ExcelApp.WorkBooks.Add;
  WorkBook.Worksheets[3].Delete;
  WorkBook.Worksheets[2].Delete;

{2.������������ ������� ����-�������}
  while not Eof do
  begin
    //������� ���������� ������, ������� �������� ��������� �������
    ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);
    NomRecQ1:=RowCount*(RecNo-1)+1;

    ArrayData[2,   1]:=
      '���������� ���������� ������ ��������� ������������� '+
      SubsUsers1.Rayonu+' ������ �.���������� �� '+p6+' �.';
    ArrayData[5,   4]:='����������� � ���������������';
    ArrayData[6,   3]:='�������� �� ������ ����� � ������������ �����';
    ArrayData[8,   1]:=
      '    ���������(��) '+
      Fieldvalues['fam']+' '+
      Fieldvalues['im']+' '+
      Fieldvalues['ot'];
    ArrayData[9,   1]:=
      '�����������(��) �� ������: '+
      Fieldvalues['socr']+'.'+
      Fieldvalues['street']+', '+
      IntToStr(Fieldvalues['dom'])+
      Ansiuppercase(Fieldvalues['korp'])+'-'+
      Fieldvalues['kv'];
    ArrayData[10,  1]:=
      '    ����������� ��� � ���, ��� �� ���������� '+
      Fieldvalues['nazvanie']+' (��� �����. '+IntToStr(Fieldvalues['zak'])+')';
    ArrayData[11,  1]:='�� �� ������ ����� �� ����� � ������������ ������ �� '+
      IntToStr(Fieldvalues['mes'])+' ������ ('+
      FormatDateTime('MMMM YYYY�.',IncMonth(StrToDate(p3),-1))+', ';
    ArrayData[12,  1]:=
      FormatDateTime('MMMM YYYY�.',StrToDate(p3))+').';
    ArrayData[13,  1]:=
      '    ��� ���������� ������ �������� ������������� �� ��� ���� ��������� ������� � ';
    ArrayData[14,  1]:=
      '���������������� � �������� ������������ � ����������� ��������� �� ������ �������-';
    ArrayData[15,  1]:=
      '������������ ����� ��� ������� � ���������������� ������������� � ����� �������� ';
    ArrayData[16,  1]:=
      '���������� ���������� ������ ��������� ������������� '+SubsUsers1.Rayonu+' ������ ';
    ArrayData[17,  1]:=
      '�.���������� � ���� ��';
    ArrayData[18,  1]:=
      '    � ������������ � ������� 19 ������������� ������������� ����������� ������� �� 21';
    ArrayData[19,  1]:=
      '������� 2005 ���� �21-� � ������ �� �������������� � ������ ���������� ������ ������-';
    ArrayData[20,  1]:=
      '��� ��������� ���������� �������������� ��� �������� ����� ����������.';
    ArrayData[23,  2]:='��������� ���������� '; ArrayData[23,   7]:=SubsUsers1.FIO1;
    ArrayData[25,  2]:='����������� ';          ArrayData[25,   7]:=SubsUsers1.FIO0;
                                                ArrayData[26,   7]:=SubsUsers1.Tel;
    Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1, BeginCol];
    Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+RowCount-1,BeginCol+ColCount-1];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
    Range.value:=ArrayData;
    Range.Borders[9].LineStyle:=10;

    WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+1, BeginCol].Font.Size:=8;
    WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+RowCount-2, 7].Font.Size:=8;

    BeginRow:=BeginRow+1;
    Next;
  end;
{3. ����� � ���������� ������������ ������� ����-�������}
  //���������� ���������
  k:=-1;
  p51:=p5+'DOLG1_'+p1+'_'+p3+'.XLS';
  if FileExists(p51)=True then DeleteFile(p51);
  while k=-1 do
  begin
    try    k:=0; ExcelApp.ActiveWorkbook.SaveAs(P51);
    except k:=-1
    end;
    P51:=PathCopy(P51);
  end;
  //������ Excel �������
  if StrToBoolDef(p4, True)=True
  then ExcelApp.Visible:=True
  else ExcelApp.ActiveWorkbook.Close;
end;
end;

//������������ � �����������
procedure TSubsCommands.ReportDLG2;
var ExcelApp, Workbook, Range, Cell1, Cell2, ArrayData: Variant;
    BeginCol, BeginRow, ColCount, NomRecQ1, RowCount,k: Integer;
    p51: String;
begin
{0.�������� ����������� � ������������� ������������ ������� ����-�������}
if IBQ1.Active=False then Exit;
if IBQ1.RecordCount=0 then Exit;  

{1.���������� � ������������}
//���������� ������ �������� ���� �������, � ������� ����� �������� ������
BeginCol := 1;
BeginRow := 0;
//������� ���������� ������� ������
ColCount :=9;
RowCount :=27;
with IBQ1 do
begin
  First;
  //�������� Excel
  ExcelApp :=CreateOleObject('Excel.Application');
  //��������� ������� Excel �� �������, ����� �������� ����� ����������
  ExcelApp.Application.EnableEvents:=False;
  Workbook :=ExcelApp.WorkBooks.Add;
  WorkBook.Worksheets[3].Delete;
  WorkBook.Worksheets[2].Delete;

{2.������������ ������� ����-�������}
  while not Eof do
  begin
    //������� ���������� ������, ������� �������� ��������� �������
    ArrayData := VarArrayCreate([1, RowCount, 1, ColCount], varVariant);
    NomRecQ1:=RowCount*(RecNo-1)+1;

    ArrayData[2,   1]:=
      '���������� ���������� ������ ��������� ������������� '+
      SubsUsers1.Rayonu+' ������ �.���������� �� '+p6+' �.';
    ArrayData[6,   4]:='������������ � �����������';
    ArrayData[7,   3]:='�������� �� ������ ����� � ������������ �����';
    ArrayData[10,  1]:=
      '    � ����������� � ������� 20 ������������� ������������� ����������� ������� ';
    ArrayData[11,  1]:=
      '�� 21 ������� 2005 �. �21-� ���������� �������������� �������� ';
    ArrayData[12,  1]:=
      Fieldvalues['fam']+' '+
      Fieldvalues['im']+' '+
      Fieldvalues['ot'];
    ArrayData[13,  1]:=
      '������������(��) �� ������: '+
      Fieldvalues['socr']+'.'+
      Fieldvalues['street']+', '+
      IntToStr(Fieldvalues['dom'])+
      Ansiuppercase(Fieldvalues['korp'])+'-'+
      Fieldvalues['kv'];
    ArrayData[14,  1]:=
      '������ ���� � '+GetVNN(Fieldvalues['n_dela'])+' �� ������� �������� ������������ � ������ �������-������������';
    ArrayData[15,  1]:=
      '�����.';
    ArrayData[16,  1]:=
      '    ����� �������� ���� �������������� � '+
      FormatDateTime('MMMM YYYY�.',IncMonth(Fieldvalues['dt_k_sub'], 1))+' � ������������  � ������� 19 ';
    ArrayData[17,  1]:=
      '������������� ������������� ����������� ������� �� 21 ������� 2005 ���� � 21-�, ';
    ArrayData[18,  1]:=
      '� ��� ���������  ����������� �� ';
    ArrayData[19,  1]:=
      '    ���� � ������ �������-������������ ����� �� ��� ������ ���������� '+GetVNN(Fieldvalues['sm_dlg'], True)+' ���.';

    ArrayData[23,  2]:='��������� ���������� '; ArrayData[23,   7]:=SubsUsers1.FIO1;
    ArrayData[25,  2]:='����������� ';          ArrayData[25,   7]:=SubsUsers1.FIO0;
                                                ArrayData[26,   7]:=SubsUsers1.Tel;
    Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1, BeginCol];
    Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+RowCount-1,BeginCol+ColCount-1];
    Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
    Range.value:=ArrayData;
    Range.Borders[9].LineStyle:=10;

    WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+1, BeginCol].Font.Size:=8;
    WorkBook.WorkSheets[1].Cells[BeginRow+NomRecQ1+RowCount-2, 7].Font.Size:=8;

    BeginRow:=BeginRow+1;
    Next;
  end;
{3. ����� � ���������� ������������ ������� ����-�������}
  //���������� ���������
  k:=-1;
  p51:=p5+'DOLG2_'+p1+'_'+p3+'.XLS';
  if FileExists(p51)=True then DeleteFile(p51);
  while k=-1 do
  begin
    try    k:=0; ExcelApp.ActiveWorkbook.SaveAs(P51);
    except k:=-1
    end;
    P51:=PathCopy(P51);
  end;
  //������ Excel �������
  if StrToBoolDef(p4, True)=True
  then ExcelApp.Visible:=True
  else ExcelApp.ActiveWorkbook.Close;
end;
end;

//�������� ����������
procedure TSubsCommands.CommandChangeTarifs;
Const
    CountUsl=19;
var q: Array[1..CountUsl] of TQuery;
    v: Array[1..2, 1..3] of Real;
    e: Array[1..4] of Real;
    Rslt : Variant;
    i,j,k,Okr2: Integer;
    Alpha, AlphaLg, AlphaOkr2: Real;
    AlphaOkr1: Array [1..2] of Real;
    Okr1: Array [1..2] of Integer;
    VisualReport: Boolean;
Label
    st, st2, st3, st4;

function IsValid: Boolean;
var EUSL, USL, l: Integer;
    TUSL: Real;
begin
  Result:=False;
  try
    USL :=q[i].FieldValues['USL'];
    EUSL:=q[i].FieldValues['EUSL'];
    TUSL:=q[i].FieldValues['TUSL'];
  except
    Result:=True;
    Exit;
  end;

  if(EUSL<1)or(EUSL>4)or(TUSL<=0)or(USL<1)or(USL>19)then Exit;


  if usl=4 then
    Alpha:=Alpha;

  Alpha:=IBQ1.FieldValues['sn'+IntToStr(USL)]/TUSL;
  AlphaOkr1[1]:=Sr.RoundReal(Alpha,Okr1[1]);
  AlphaOkr1[2]:=Sr.RoundReal(Alpha,Okr1[2]);
  AlphaOkr2:=Sr.RoundReal(Alpha,Okr2);

  Case EUSL of
  0:   Result:=True;
  1,2: for l:=1 to 3 do
         if(Sr.RoundReal(v[EUSL,l],Okr1[EUSL])=AlphaOkr1[EUSL])then Result:=True;
  3:   if AlphaOkr2=1 then Result:=True;
  4:   if(AlphaOkr2>1)and(AlphaOkr2=Int(AlphaOkr2))then Result:=True;
  end;
end;

begin
  //(1) ��������� ==============================================================
  //1.������ �� ������� ������� �� ��
  p1:=Trim(p1);
  If p1<>'' then
  begin
    IBQ1.Active:=False;
    If IBQ1.Prepared then IBQ1.Prepared:=False;
    IBQ1.SQL.Text:=p1;
    IBQ1.Active:=True;
  end;
  If IBQ1.Active=False then Exit;
  //2.������� � ��������
  p2:=Trim(p2);
  if FileExists(p2)=False then Exit;
  //3.���� �����������
  p3:=Trim(p3);
  if p3='' then p3:='01.'+Copy(p2,Length(p2)-10,7);
  //4.�������� - ���������
  try    VisualReport:=StrToBool(p4);
  except VisualReport:=True; end;
  //5.�������� - ���������� �� 1 ��. �������
  try    Okr1[1]:=StrToInt(p5);
  except Okr1[1]:=2; end;
  if Okr1[1]<0 then Okr1[1]:=2;
  //6.�������� - ���������� �� 2 ��. �������
  try    Okr1[2]:=StrToInt(p6);
  except Okr1[2]:=2; end;
  if Okr1[2]<0 then Okr1[2]:=2;
  //7.�������� - ���������� �� 3, 4 ��. �������
  try    Okr2:=StrToInt(p7);
  except Okr2:=2; end;
  if Okr2<0 then Okr2:=2;

  //(2) ������������ �������� �������� =========================================
  for i:=1 to CountUsl do
  begin
    q[i]:=TQuery.Create(q[i]);
    q[i].SQL.Text:='select * from "'+p2+'" where n_usl='+IntToStr(i)+' order by n';
    q[i].Active:=True;
  end;

  //(3) ������ � ���������� �������� ===========================================
  with IBQ1 do
  begin
    First;
    FetchAll;

    //��������� ���� ��������
    Rslt:=VarArrayCreate([0, RecordCount+1, 1, CountUsl+8], varVariant);
    Rslt[0,1]:='�';
    Rslt[0,2]:='���';
    Rslt[0,3]:='���.';
    Rslt[0,4]:='�./����';
    Rslt[0,5]:='�������';
    Rslt[0,6]:='���';
    Rslt[0,7]:='��������';
    Rslt[0,8]:='���.';
    for k:=9 to CountUsl+8 do Rslt[0,k]:='��'+IntToStr(k-8);

    While Not Eof do
    begin
      //1.���������� ��������� ������
      Rslt[RecNo,1]:=RecNo;
      Rslt[RecNo,2]:=FieldValues['idd'];
      Rslt[RecNo,3]:=FieldValues['zak'];
      Rslt[RecNo,4]:=FieldValues['lschet'];
      Rslt[RecNo,5]:=FieldValues['fam'];
      Rslt[RecNo,6]:=FieldValues['im'];
      Rslt[RecNo,7]:=FieldValues['ot'];
      for k:=8 to CountUsl+8 do Rslt[RecNo,k]:=0;

      if(FieldValues['stat']<>'1')and(FieldValues['stat']<>'2')then
      begin
        SubsOperations1.RefreshPSNL:=True;
        if FieldValues['dp_r']=0
        then SubsOperations1.DopReestr:=False
        else SubsOperations1.DopReestr:=True;
        SubsOperations1.SetDataFromIB;

        e[1]:=FieldValues['prop_all'];//������� ������� �� ��������
        e[2]:=SR.RoundReal(FieldValues['soc_nrm_pl']);
        e[3]:=1;
        //2.���������� ������ ��� ���������
        v[1,1]:=FieldValues['prop_all'];
        v[1,2]:=FieldValues['sub_all'];
        if v[1,1]=0 then v[1,3]:=0 else v[1,3]:=SR.RoundReal(v[1,2]/v[1,1]);

        v[2,1]:=SR.RoundReal(FieldValues['soc_nrm_pl']);
        v[2,2]:=SR.RoundReal(FieldValues['soc_n_r_pl']);
        v[2,3]:=SR.RoundReal(FieldValues['obsh_pl']);

        //3.������ �������
        for i:=1 to CountUsl do
        begin
          q[i].First;
          if(q[i].RecordCount=0)or
            ((SubsOperations1.ZKUNew[4,i]=0)and(GetVNN(q[i].FieldValues['SNULL'])<>'1'))then goto st2;
          Rslt[RecNo,8+i]:=1;//����� �� ��������� �� ���������
          while not q[i].Eof do
          begin
            if IsValid=False then goto st3;    //����� �� ����� �� ������� ������

            //����������� �������������
            Alpha:=SubsOperations1.ZKUNew[4,i]/q[i].FieldValues['TOLD'];
            if SubsOperations1.ZKUNew[5,i]<>0 then
            AlphaLg:=SR.RoundReal(SubsOperations1.ZKUNew[4,i]/SubsOperations1.ZKUNew[5,i],4) else
            AlphaLg:=0;

            //��������� ������������ ����� ���� ����������
            if GetVNN(q[i].FieldValues['USL_LG'])<>'' then
              if SubsOperations1.ZKUNew[5,StrToInt(q[i].FieldValues['USL_LG'])]<>0 then
                 AlphaLg:=SR.RoundReal(SubsOperations1.ZKUNew[4,StrToInt(q[i].FieldValues['USL_LG'])]/
                                       SubsOperations1.ZKUNew[5,StrToInt(q[i].FieldValues['USL_LG'])],4) else
                 AlphaLg:=0;      

            AlphaOkr1[1]:=Sr.RoundReal(Alpha,Okr1[1]);
            AlphaOkr1[2]:=Sr.RoundReal(Alpha,Okr1[2]);
            AlphaOkr2:=Sr.RoundReal(Alpha,Okr2);

            //������� ������� �� ������ ������
            //1-����,2-�������,3-�������,4-������ ������ �������,5-��������� �������
            k:=q[i].FieldValues['E_USL'];
            if GetVNN(q[i].FieldValues['USL'])<>'' then
              if((SubsOperations1.ZKUNew[4,StrToInt(q[i].FieldValues['USL'])]=0)and
                 ((GetVNN(q[i].FieldValues['EUSL'])='')or
                  (GetVNN(q[i].FieldValues['EUSL'])<>'0')))or
                 ((SubsOperations1.ZKUNew[4,StrToInt(q[i].FieldValues['USL'])]>0)and
                  (GetVNN(q[i].FieldValues['EUSL'])='0'))then goto st3;
            //����������� �� � 0 ������
            If GetVNN(q[i].FieldValues['SNULL'])<>'1' then
            Case k of
            1,2:  for j:=1 to 3 do
                    if(Sr.RoundReal(v[k,j],Okr1[k])=AlphaOkr1[k])then
                    begin
                      SubsOperations1.ZKUNew[4,i]:=SR.RoundReal(v[k,j]*q[i].FieldValues['TNEW']);
                      goto st;
                    end;
            3:    if AlphaOkr2=1 then
                  begin
                    SubsOperations1.ZKUNew[4,i]:=SR.RoundReal(Alpha*q[i].FieldValues['TNEW']);
                    goto st;
                  end;
            4:    if(AlphaOkr2>=1)and(AlphaOkr2=Int(AlphaOkr2))then
                  begin
                    SubsOperations1.ZKUNew[4,i]:=SR.RoundReal(Sr.RoundReal(Alpha,Okr2)*q[i].FieldValues['TNEW']);
                    goto st;
                  end;
            5:    begin
                    SubsOperations1.ZKUNew[4,i]:=
                      SR.RoundReal(SubsOperations1.ZKUNew[4,i]*q[i].FieldValues['TNEW']/q[i].FieldValues['TOLD']);
                    goto st;
                  end;
            end else
            Case k of
            1,2,3:begin
                    SubsOperations1.ZKUNew[4,i]:=SR.RoundReal(e[k]*q[i].FieldValues['TNEW']);
                    if AlphaLg<>0 then
                      SubsOperations1.ZKUNew[5,i]:=SR.RoundReal(SubsOperations1.ZKUNew[4,i]/AlphaLg)else
                      SubsOperations1.ZKUNew[5,i]:=0;
                    goto st4;
                  end;
            end;
st3:        q[i].Next;
          end;
          goto st2;
st:       if AlphaLg<>0 then
          SubsOperations1.ZKUNew[5,i]:=SR.RoundReal(SubsOperations1.ZKUNew[4,i]/AlphaLg)else
          SubsOperations1.ZKUNew[5,i]:=0;
st4:      Rslt[RecNo,8+i]:=0;
st2:    end;
        //4.���������� ��������
        SubsOperations1.RaschetSubs;
        //5.������ "����" � "��������"
        SubsOperations1.IDD:=FieldValues['idd'];
        SubsOperations1.SetDataToIB;
      end;
      //���� �����������
      Rslt[RecNo,8]:=0;
      for k:=1 to CountUsl do Rslt[RecNo,8]:=Rslt[RecNo,8]+Rslt[RecNo,8+k];
      if Rslt[RecNo,8]>1 then Rslt[RecNo,8]:=1;
      Next;
    end;
    Active:=False;
    //������������ ������������� �������� (���)
    for i:=1 to CountUsl do
    begin
      q[i].Active:=False;
      q[i].Free;
    end;
    //������������� ���������
    Transaction.CommitRetaining;
    //�������� ������
    SubsXLSReport1.XLSVisible:=VisualReport;
    SubsXLSReport1.XLSPath:=ExtractFilePath(p2);
    SubsXLSReport1.XLSName:='����� �� ����������� �� '+p3+'�.xls';;
    SubsXLSReport1.XLSCaption.Text:='������ ������� �� ������� ��� ����������� ���������� �� '+p3+'�.'+#13+#10+
                                    '      1-���������� �� ������� �����������,'+#13+#10+
                                    '      0-���������� ��� ����������� ��� �� ���������� ������  ����� 0';
    SubsXLSReport1.StartVA(Rslt);
  end;
end;

{ TSubsDatePanel }

constructor TSubsDatePanel.Create(AOwner: TComponent);
begin
  inherited;
  Parent:=TWinControl(AOwner);
  VDefaultColorMonth:=clWhite;
  VDefaultColorYear:=clWhite;
  VDefaultDay:=1;
  VDefaultMonth:=1;
  VDefaultYear:=2000;
  Caption:=' ';
  Width:=209;
  Height:=33;
  BevelInner:=bvLowered;
  BevelOuter:=bvNone;
  ParentColor:=True;
  ParentFont:=True;

  KZa:=TLabel.Create(KZa);
  with KZa do
  begin
    Parent:=Self;
    Caption:='��';
    Width:=12;
    Height:=13;
    ParentColor:=True;
    ParentFont:=True;
    Left:=40;
    Top:=11;
  end;

  KMonth:=TComboBox.Create(KMonth);
  with KMonth do
  begin
    Parent:=Self;
    Items.Clear;
    Items.Add('������');
    Items.Add('�������');
    Items.Add('����');
    Items.Add('������');
    Items.Add('���');
    Items.Add('����');
    Items.Add('����');
    Items.Add('������');
    Items.Add('��������');
    Items.Add('�������');
    Items.Add('������');
    Items.Add('�������');

    ItemHeight:=13;
    DropDownCount:=8;
    Style:=csOwnerDrawFixed;
    Width:=89;
    Height:=19;
    ParentFont:=True;
    Left:=56;
    Top:=8;
    Color:=VDefaultColorMonth;

    ItemIndex:=VDefaultMonth-1;
  end;

  KYear:=TComboBox.Create(KYear);  
  with KYear do
  begin
    Parent:=Self;
    Items.Clear;
    Items.Add('2000');
    Items.Add('2001');
    Items.Add('2002');
    Items.Add('2003');
    Items.Add('2004');
    Items.Add('2005');
    Items.Add('2006');
    Items.Add('2007');
    Items.Add('2008');
    Items.Add('2009');
    Items.Add('2010');
    Items.Add('2011');
    Items.Add('2012');
    Items.Add('2013');
    Items.Add('2014');
    Items.Add('2015');
    Items.Add('2016');
    Items.Add('2017');
    Items.Add('2018');
    Items.Add('2019');
    Items.Add('2020');

    ItemHeight:=13;
    DropDownCount:=8;
    Style:=csOwnerDrawFixed;
    Width:=49;
    Height:=19;
    ParentFont:=True;
    Left:=152;
    Top:=8;
    Color:=VDefaultColorYear;

    ItemIndex:=VDefaultYear-2000;
  end;
end;

destructor TSubsDatePanel.Destroy;
begin
  KZa.Free;
  KMonth.Free;
  KYear.Free;
  inherited;
end;

{������ �� Ini-�����}
procedure TSubsDatePanel.ReadIniFile(Fl: TIniFile);
var CNm: String;
begin
  CNm:=Owner.Name+'.'+Name;
  KMonth.ItemIndex:=Fl.ReadInteger(CNm,'Month',0);
  KYear.ItemIndex:=Fl.ReadInteger(CNm,'Year',0);
end;

{������ � Ini-����}
procedure TSubsDatePanel.WriteIniFile(Fl: TIniFile);
var CNm: String;
begin
  try
    CNm:=Owner.Name+'.'+Name;
    Fl.WriteInteger(CNm,'Month',KMonth.ItemIndex);
    Fl.writeinteger(CNm,'Year', KYear.ItemIndex);
  except
  end;
end;  

{���� � ��������� ��������}
{��}
function TSubsDatePanel.GetDD: String;
begin
  if VDefaultDay<10
  then Result:='0'+IntToStr(VDefaultDay)
  else Result:=IntToStr(VDefaultDay);
end;

{��}
function TSubsDatePanel.GetMM: String;
var ms: string;
begin
  ms:=IntToStr(KMonth.ItemIndex+1);
  if Length(ms)=1 then ms:='0'+ms;
  Result:=ms;
end;

{����}
function TSubsDatePanel.GetMMMM: String;
begin
  Result:=KMonth.Text;
end;

{����}
function TSubsDatePanel.GetYYYY: String;
begin
  Result:=KYear.Text;
end;

{��.����}
function TSubsDatePanel.GetMMYYYY: String;
begin
  Result:=GetMM+'.'+GetYYYY;
end;

{����.����}
function TSubsDatePanel.GetMMMMYYYY: String;
begin
  Result:=GetMMMM+' '+GetYYYY;
end;

{��.��.����}
function TSubsDatePanel.GetDDMMYYYY: String;
begin
  Result:=GetDD+'.'+GetMMYYYY;
end;

{��.����.����}
function TSubsDatePanel.GetDDMMMMYYYY: String;
begin
  Result:=IntToStr(VDefaultDay)+' '+GetMMMMYYYY;
end;

{��������� �������� DefaultDay}
procedure TSubsDatePanel.SetVDefaultDay(AValue: Integer);
var MaxDay: Word;
begin
  MaxDay:=DaysInMonth(StrToDate('01.'+GetMMYYYY));
  VDefaultDay:=AValue;
  If AValue<1 then VDefaultDay:=1;
  If AValue>MaxDay then VDefaultDay:=MaxDay;
end;

{��������� �������� DefaultMonth}
procedure TSubsDatePanel.SetVDefaultMonth(AValue: Integer);
begin
  VDefaultMonth:=AValue;
  if AValue<1 then VDefaultMonth:=1;
  if AValue>12 then VDefaultMonth:=12;
  if VDefaultMonth<>KMonth.ItemIndex+1 then KMonth.ItemIndex:=VDefaultMonth-1;
end;

{��������� �������� DefaultYear}
procedure TSubsDatePanel.SetVDefaultYear(AValue: Integer);
begin
  VDefaultYear:=AValue;
  if AValue<2000 then VDefaultYear:=2000;
  if AValue>2020 then VDefaultYear:=2020;
  if VDefaultYear<>KYear.ItemIndex+2000 then KYear.ItemIndex:=VDefaultYear-2000;
end;

{������ ������ � Label}
function TSubsDatePanel.GetLabelText: string;
begin
  Result:=KZa.Caption;
end;

{������ ������ � Label}
procedure TSubsDatePanel.SetLabelText(AValue: string);
begin
  KZa.Caption:=AValue;
end;

{����������� Enabled}
function TSubsDatePanel.GetEn: boolean;
begin
  Result:=inherited Enabled;
end;

{������ Enabled}
procedure TSubsDatePanel.SetEn(AValue: boolean);
begin
  if inherited Enabled<>AValue then
  begin
    if AValue=False then
    begin
      KMonth.Color:=Color;
      KYear.Color:=Color;
      inherited Enabled:=AValue;
    end else
    begin
      inherited Enabled:=AValue;
      KMonth.Color:=VDefaultColorMonth;
      KYear.Color:=VDefaultColorYear;
    end;
  end;
end;

{��������� ����� ������}
procedure TSubsDatePanel.SetColorMonth(AValue: TColor);
begin
  if AValue<>VDefaultColorMonth then
  begin
    VDefaultColorMonth:=AValue;
    KMonth.Color:=AValue;
  end;
end;

{��������� ����� ����}
procedure TSubsDatePanel.SetColorYear(AValue: TColor);
begin
  if AValue<>VDefaultColorYear then
  begin
    VDefaultColorYear:=AValue;
    KYear.Color:=AValue;
  end;
end;

{���������������}
procedure TSubsDatePanel.WMSize(var message: TWMSize);
begin
  if VChangeHeight=True then
  begin
    KMonth.ItemHeight:=Round(Height * 13/33);
    KYear.ItemHeight :=Round(Height * 13/33);
  end;
end;

{������������}
procedure TSubsDatePanel.SetVChangeHeight(AValue: boolean);
begin
  if VChangeHeight<>AValue then
  begin
    VChangeHeight:=AValue;
    PostMessage(Handle,WM_SIZE,WM_SIZE,0);
  end;
end;  


end.
