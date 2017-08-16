{*******************************************************}
{                                                       }
{                Delphi Component Library               }
{        ��� ������������� �.���������� (2005�.)        }
{                     ������ ������                     }
{              (rob_t@mail.ru, rob_t@74.ru)             }
{                                                       }
{*******************************************************}

unit Subs;

interface
uses Classes, Dialogs, IBQuery, Grids, Forms, DB, Messages, Controls,
     StdCtrls, Graphics, TypINFO, DBTables, ComCtrls, ComObj, ShlObj,
     Windows, ShellAPI, SysUtils, Registry, IniFiles, BDE;

Type
  TStatus=(S1,S2,S3,S4,S5);
  TRaion=(R1,R2,R3,R4,R5,R6,R7,R8);
  TPageSetup=(Horizontal, Vertical);
  TAFormat=(xl3DEffects1,
            xl3DEffects2,
            xlAccounting1,
            xlAccounting2,
            xlAccounting3,
            xlAccounting4,
            xlClassic1,
            xlClassic2,
            xlClassic3,
            xlClassicPivotTable,
            xlColor1,
            xlColor2,
            xlColor3,
            xlList1,
            xlList2,
            xlList3,
            xlLocalFormat1,
            xlLocalFormat2,
            xlLocalFormat3,
            xlLocalFormat4,
            xlNone,
            xlPTNone,
            xlReport1,
            xlReport10,
            xlReport2,
            xlReport3,
            xlReport4,
            xlReport5,
            xlReport6,
            xlReport7,
            xlReport8,
            xlReport9,
            xlSimple,
            xlTable1,
            xlTable10,
            xlTable2,
            xlTable3,
            xlTable4,
            xlTable5,
            xlTable6,
            xlTable7,
            xlTable8,
            xlTable9);
  TSubsOperationEvent = procedure(AObject: TObject) of object;
  TSubsGridEvent      = procedure(AObject: TObject) of object;
  TSubsXLSReportEvent = procedure(AObject: TObject) of object;

Type
  TSubsRound=class
    function RoundReal(VReal: Variant; const Decimals: Integer=2): Real;     
    function FloatText(VText: String;   const Decimals: Integer=2): String;
  end;

Type
  TSubsOperations=Class(TComponent)
  Private
    VSubs:      Currency;
    RPSNL:      Boolean;
    RKLG:       Boolean;
    D_max:      Currency;
    Dt_obr_sub: TDateTime;
    Dt_n_sub:   TDateTime;
    Dt_k_sub:   TDateTime;
    Koef_izn:   Real;
    Koef_subs:  Real;
    Kol_Subs:   Integer;
    Pr_min:     Currency;
    Dohod:      Currency;
    Pl_o:       Currency;
    Pl_r:       Currency;
    Pl_i:       Currency;
    St_ZKU:     Currency;
    St_pl:      Currency;
    Dp_r:       Boolean;
    Status:     Integer;
    IBQ:        TIBQuery;
    IBQ2:       TIBQuery;
    SubsRound:  TSubsRound;
    FOnSubsOpAfter:  TSubsOperationEvent;
    FOnSubsOpBefore: TSubsOperationEvent;
    procedure GetDpRData;
    procedure SetDpRData;

    procedure SetIBQ(AValue: TIBQuery);
    procedure SetIBQ2(AValue: TIBQuery);

    function  RaschetPF: Currency;
    procedure RaschetPFL;
    procedure RaschetPN;
    procedure RefreshFunction(ARefreshValue: Boolean);
    procedure CopyZKU;
  Protected
    RefreshValue: Boolean;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  Public
    IDD: Integer;
    ZKUNew: array[4..8, 1..20] of Currency;
    ZKUOldSubs: array[1..20] of Currency;
    procedure SetOldSub;
    procedure SetDataFromIB;
    procedure SetDataFromIBNext;
    procedure SetSubsZKU(Subs2: Currency=0);

    procedure SetDataToIB;
    procedure RaschetSubs;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  Published
    property ValueSubs: Currency Read VSubs;
    property IBDataSet: TIBQuery Read IBQ Write SetIBQ;
    property IBDataSet2: TIBQuery Read IBQ2 Write SetIBQ2;
    property Refresh: Boolean Read RefreshValue Write RefreshFunction;
    property Dmax: Currency Read D_max;
    property DateObrSub: TDateTime Read Dt_obr_sub Write Dt_obr_sub;
    property DateNSub: TDateTime Read Dt_n_sub Write Dt_n_sub;
    property DateKSub: TDateTime Read Dt_k_sub Write Dt_k_sub;
    property KoefSubs: Real Read Koef_subs Write Koef_subs;
    property KoefLgot: Real Read Koef_izn Write Koef_izn;
    property KolSubs: Integer Read Kol_Subs Write Kol_Subs;
    property PlO: Currency Read Pl_o Write Pl_o;
    property PlR: Currency Read Pl_r Write Pl_r;
    property PlI: Currency Read Pl_i Write Pl_i;
    property ProjitMin: Currency Read Pr_min Write Pr_min;
    property StPl: Currency Read St_pl Write St_pl;
    property StZKU: Currency Read St_ZKU Write St_ZKU;
    property DohodAll: Currency Read Dohod Write Dohod;
    property DopReestr: Boolean Read Dp_r Write Dp_r;
    property StatusSubs: Integer Read Status Write Status;
    property RazmerPSNL: Currency Read ZKUNew[6,20] Write ZKUNew[6,20];
    property RazmerSubs: Currency Read ZKUNew[7,20] Write ZKUNew[7,20];
    property RefreshPSNL: Boolean Read RPSNL Write RPSNL;
    property RefreshKLG: Boolean Read RKLG Write RKLG;
    property OnSubsOpAfter: TSubsOperationEvent read FOnSubsOpAfter
       write FOnSubsOpAfter;
    property OnSubsOpBefore: TSubsOperationEvent read FOnSubsOpBefore
       write FOnSubsOpBefore;
  end;

Type
  TSubsGrid=Class(TStringGrid)
    SubsOper:     TSubsOperations;
  private
    DM:           TLabel;
    FOnZakSelect: TSubsGridEvent;

    SubsRound:    TSubsRound;
    procedure CMExit(var Msg: TMessage); message CM_EXIT;
    procedure SubsGridSelectCell(Sender: TObject; Col, Row: Longint;
      var CanSelect: Boolean);
    procedure CopyZKU;
    procedure CopyZKUfromArrayBefore(AObject: TObject);
    procedure CopyZKUfromArrayAfter(AObject: TObject);
    procedure SetWidth(Value: Integer);
    function GetWidth: Integer;
    procedure SetHeight(Value: Integer);
    function GetHeight: Integer;
    procedure SetIBQ(AValue: TIBQuery);
    function GetIBQ: TIBQuery;
    procedure SetDM(AValue: TLabel);
  protected
    RefreshValue: Boolean;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure Click; override;
    procedure OtherClick;
    procedure Subs20Round;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    procedure Default;
    procedure SetOldSub;
    procedure SetDataFromIB;
    procedure SetDataFromIBNext;

    procedure SetDataToIB;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;

    procedure WriteIniFile(Fl: TIniFile);
    procedure ReadIniFile(Fl: TIniFile);
  published
    property IBDataSet: TIBQuery Read GetIBQ Write SetIBQ;
    property RefreshSubs: Boolean Read RefreshValue Write RefreshValue;
    property Width: Integer read GetWidth write SetWidth default 601;
    property Height: Integer read GetHeight write SetHeight;
    property DmaxLabel: TLabel read DM write SetDM;
    property OnZakSelect: TSubsGridEvent read FOnZakSelect write FOnZakSelect;
  end;

Type
  TSubsUsers=Class(TComponent)
  private
    IBQ:          TIBQuery;
    BDEQ:         TQuery;
    user_active            :boolean; //������� (�� �������) �� ���. �����.
    user_stat              :String;  //���� ������������
    user_rai               :String;  //����� ������������
    user_name              :string;  //"Login" ������������
    user_0                 :string;  //��� ������������
    user_1                 :string;  //��������� ����������
    user_2                 :string;  //������� ���������
    user_3                 :string;  //��������� ������
    user_del               :Boolean; //����������� ��������
    user_vp                :Boolean; //����������� �������� ����� ������
    user_vip               :Boolean; //����������� ��������� �����. �������
    user_history_mod       :Boolean; //����������� ��������� �������
    user_get               :Boolean; //�������� �� ������
    function GV(ARefreshValue: Variant): Boolean;
    procedure SetStat(ARefreshValue: TStatus);
    function GetStat: TStatus;
    procedure SetRai(ARefreshValue: TRaion);
    function GetRai : TRaion;

    procedure SetBDEQ(AValue: TQuery);
    procedure SetIBQ(AValue: TIBQuery);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    user_time              :TDateTime;    //����� ������ �� �������� �����.
    user_time_limit        :TDateTime;    //����� ������� ������
    user_dh10              :Boolean;
    Tel                    :String;       //���������� �������
    Rayon                  :String;       //�������� ������
    Rayonu                 :String;       //�������� ������ � �����. ������
    procedure Default;
    procedure GetUsers;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  published
    property IBDataSet : TIBQuery Read IBQ Write SetIBQ;
    property BDEDataSet: TQuery Read BDEQ Write SetBDEQ;
    property PStatus   : TStatus  Read GetStat  Write SetStat;
    property PRaion    : TRaion   Read GetRai   Write SetRai;
    property Rai : String Read user_rai Write user_rai;
    property Stat: String Read user_stat;

    property Login : string  Read user_name;
    property FIO0  : string  Read user_0      Write user_0;
    property FIO1  : string  Read user_1      Write user_1;
    property FIO2  : string  Read user_2      Write user_2;
    property FIO3  : string  Read user_3      Write user_3;
    property Del   : Boolean Read user_del    Write user_del;
    property Vp    : Boolean Read user_vp     Write user_vp;
    property Vip   : Boolean Read user_vip    Write user_vip;
    property Act   : Boolean Read user_active Write user_active;
    property History_mod :Boolean Read user_history_mod  Write user_history_mod;
    property Get   : boolean Read user_get;
  end;

Type
  TSubsXLSReport=Class(TComponent)
  private
    IBQ:       TDataSet;
    PrBar:     TProgressBar;
    FMax:      Integer;
    FNom:      Integer;
    TmStart:   TTime;
    TmEnd:     TTime;
    TmDelta:   TTime;
    Name:      String;
    Cptn:      TStrings;
    PathXLS:   String;
    NameXLS:   String;
    SizeXLS:   Integer;

    TFormat        : Cardinal;
    PageSetupXLS   : Integer;
    ListsCountXLS  : Integer;
    FCaptionXLS    : TFont;
    FCaptionXLSEnd : TFont;
    FTextXLS       : TFont;
    CaptionXLS     : TStrings;
    CaptionXLSEnd  : TStrings;
    ShwInf         : Boolean;
    ThreadXLS      : Boolean;
    VisibleXLS     : Boolean;
    FOnReportCreateLoop:  TSubsXLSReportEvent;
    procedure SetCaptionXLS(AValue: TStrings);
    procedure SetCaptionXLSEnd(AValue: TStrings);
    procedure SetSizeXLS(AValue: Integer);

    procedure SetFTextXLS(AValue: TFont);
    procedure SetFCaptionXLS(AValue: TFont);
    procedure SetFCaptionXLSEnd(AValue: TFont);

    procedure SetIBQ(AValue: TDataSet);
    procedure SetPrBar(AValue: TProgressBar);

    procedure SetPageSetupXLS(AValue: TPageSetup);
    function  GetPageSetupXLS: TPageSetup;

    procedure SetTFormat(AValue: TAFormat);
    function  GetTFormat: TAFormat;

    procedure Excel(Path: String);
    procedure ExcelVA(Path: String; ArrayData: Variant);
  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    procedure Start;
    procedure StartVA(VarArrayOfValues: Variant);
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  published
    property DataSet        : TDataSet Read IBQ Write SetIBQ;
    property ProgressBarSet : TProgressBar Read PrBar Write SetPrBar;

    property TimeStart : TTime   Read TmStart;
    property TimeDelta : TTime   Read TmDelta;
    property TimeEnd   : TTime   Read TmEnd;
    property Max       : Integer Read FMax;
    property Nom       : Integer Read FNom;
    property ListsCount: Integer Read ListsCountXLS;
    property TextFormat: TAFormat Read GetTFormat Write SetTFormat;

    property XLSPageSetup  : TPageSetup Read GetPageSetupXLS Write SetPageSetupXLS;
    property XLSPath       : String Read PathXLS Write PathXLS;
    property XLSSize       : Integer Read SizeXLS Write SetSizeXLS;
    property XLSName       : String Read NameXLS Write NameXLS;

    property XLSFCaption   : TFont Read FCaptionXLS Write SetFCaptionXLS;
    property XLSFCaptionEnd: TFont Read FCaptionXLSEnd Write SetFCaptionXLSEnd;
    property XLSFText      : TFont Read FTextXLS Write SetFTextXLS;

    property XLSCaption    : TStrings Read CaptionXLS Write SetCaptionXLS;
    property XLSCaptionEnd : TStrings Read CaptionXLSEnd Write SetCaptionXLSEnd;

    property XLSThread     : Boolean Read ThreadXLS  Write ThreadXLS default False;
    property XLSVisible    : Boolean Read VisibleXLS Write VisibleXLS default True;

    property ShowInfo      : Boolean Read ShwInf Write ShwInf default True;
    property OnReportCreateLoop: TSubsXLSReportEvent
      read FOnReportCreateLoop write FOnReportCreateLoop;
  end;


function GetWindowsTempPath: string;
function GetWindowsPath: string; 
function SelectDirectory(s: String='�������� �����!'): String;
function WindowsCopyFile(FromFile,ToDir: String): Boolean;
function GetDBPath(AliasName: string): TFileName;
procedure SetDBPath(const AliasName, AliasType, AliasPath: String);
procedure AdjustResolution(oForm:TForm; X: Integer=0; Y: Integer=0);
procedure ChangeResolution(X, Y: word);
function IsWordInstalled: Boolean;
function IsExcelInstalled: Boolean;
function IsBDEInstalled: Boolean;
function PathCopy(Path: String): String;
function GetVNN(VarOfField: Variant; Money :Boolean=False):String;

procedure GetKV(Kv: string; Var Kv1, Kv2: String);

{���� ����������� ����.����.}
Const User_data_obr_sub  ='01.02.2005';
      User_data_obr_sub2 ='01.12.2005';
      User_data_obr_sub3 ='01.01.2006';
      User_data_obr_sub4 ='01.07.2006';
      User_data_obr_sub5 ='01.08.2006';
      User_data_obr_sub6 ='01.01.2007';
      User_data_obr_sub7 ='01.07.2007';
      User_data_obr_sub8 ='16.03.2007';
      User_data_obr_sub9 ='01.04.2009';
      User_data_obr_sub10='01.01.2010';
      User_data_obr_sub11='01.04.2010';

{������ ���������� �� ��������� � SubsGrid}
Const ZKUZak: Array[1..19] of string = ('0', '0', '0', '0', '0',
                                        '0', '0', '0', '0', '0',
                                        '0', '0', '0', '0', '95',
                                        '96','96','88','0');
{������ �������� ����� �� ��� � ������� "KVPL.dbf"}
Const ZKUFieldKVPL: Array[1..20, 3..4] of string =
                                       (('sod_rem_sn', 'sod_rem_lg'),
                                        ('naem_sn',    'naem_lg'),
                                        ('otopl_sn',   'otopl_lg'),
                                        ('gvs_sn',     'gvs_lg'),
                                        ('hvs_sn',     'hvs_lg'),
                                        ('kanal_sn',   'kanal_lg'),
                                        ('lift_sn',    'lift_lg'),
                                        ('mus_pr_sn',  'mus_pr_lg'),
                                        ('tbo_zbo_sn', 'tbo_zbo_lg'),
                                        ('ub_dv_sn',   'ub_dv_lg'),

                                        ('ub_pod_sn',  'ub_pod_lg'),
                                        ('el_pl_sn',   'el_pl_lg'),
                                        ('elect_sn',   'elect_lg'),
                                        ('gaz_sn',     'gaz_lg'),
                                        ('gaz_bal_sn', 'gaz_bal_lg'),
                                        ('tv_top_sn',  'tv_top_lg'),
                                        ('dos_top_sn', 'dos_top_lg'),
                                        ('',           ''),
                                        ('to_vdgo_sn', 'to_vdgo_lg'),
                                        ('kvpl_sn',    'kvpl_lg'));
{���� �������������� Excel}
Const
  xlRangeAutoFormat3DEffects1=13;
  xlRangeAutoFormat3DEffects2=14;
  xlRangeAutoFormatAccounting1=4;
  xlRangeAutoFormatAccounting2=5;
  xlRangeAutoFormatAccounting3=6;
  xlRangeAutoFormatAccounting4=17;
  xlRangeAutoFormatClassic1=1;
  xlRangeAutoFormatClassic2=2;
  xlRangeAutoFormatClassic3=3;
  xlRangeAutoFormatClassicPivotTable=31;
  xlRangeAutoFormatColor1=7;
  xlRangeAutoFormatColor2=8;
  xlRangeAutoFormatColor3=9;
  xlRangeAutoFormatList1=10;
  xlRangeAutoFormatList2=11;
  xlRangeAutoFormatList3=12;
  xlRangeAutoFormatLocalFormat1=15;
  xlRangeAutoFormatLocalFormat2=16;
  xlRangeAutoFormatLocalFormat3=19;
  xlRangeAutoFormatLocalFormat4=20;
  xlRangeAutoFormatNone=4294963154;
  xlRangeAutoFormatPTNone=42;
  xlRangeAutoFormatReport1=21;
  xlRangeAutoFormatReport10=30;
  xlRangeAutoFormatReport2=22;
  xlRangeAutoFormatReport3=23;
  xlRangeAutoFormatReport4=24;
  xlRangeAutoFormatReport5=25;
  xlRangeAutoFormatReport6=26;
  xlRangeAutoFormatReport7=27;
  xlRangeAutoFormatReport8=28;
  xlRangeAutoFormatReport9=29;
  xlRangeAutoFormatSimple=4294963142;
  xlRangeAutoFormatTable1=32;
  xlRangeAutoFormatTable10=41;
  xlRangeAutoFormatTable2=33;
  xlRangeAutoFormatTable3=34;
  xlRangeAutoFormatTable4=35;
  xlRangeAutoFormatTable5=36;
  xlRangeAutoFormatTable6=37;
  xlRangeAutoFormatTable7=38;
  xlRangeAutoFormatTable8=39;
  xlRangeAutoFormatTable9=40;


procedure Register;

implementation
uses Variants, Math, IBDatabase, IBCustomDataSet;

{������: ����������� ����������� ����������� � ������� �����������}

Procedure Register;
Begin
  RegisterComponents('Subs',[TSubsOperations]);
  RegisterComponents('Subs',[TSubsGrid]);
  RegisterComponents('Subs',[TSubsUsers]);
  RegisterComponents('Subs',[TSubsXLSReport]);
End;

{������: TSubsOperations ******************************************************}

{������: ������������ � ����������� �����������}
constructor TSubsOperations.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Dt_obr_sub:=Now;
  RPSNL:=True;
  RKLG:=False;
  Koef_subs:=1;
  Kol_subs:=1;
  IBQ:=TIBQuery.Create(IBQ);
end;

destructor TSubsOperations.Destroy;
begin
  IBQ :=nil;IBQ.Free;
  IBQ2:=nil;IBQ2.Free;
  inherited Destroy;
end;

{������: ������ ����������� �����������}

{������ �������� �� ���������� ��������}
procedure TSubsOperations.RefreshFunction(ARefreshValue: Boolean);
begin
if ARefreshValue=True then
try
  RaschetSubs;
except
ShowMessage('������ � �������� ������!');
end;
RefreshValue:=False;
end;

{���������� ZKU �� IBQuery}
procedure TSubsOperations.SetDataFromIB;
begin
Try
  CopyZKU;
Except
ShowMessage('���������� ������ � ������ �������!');
end;
end;

{���������� ZKU �� IBQuery}
procedure TSubsOperations.SetDataFromIBNext;
begin
IBQ.Next;
Try
  CopyZKU;
Except
ShowMessage('���������� ������ � ������ �������!');
end;
end;

{���������� ������� ������� �������� �������� ������ �� ��������}
procedure TSubsOperations.SetOldSub;
var i :integer;
begin
for i:=1 to 20 do ZKUOldSubs[i]:=ZKUNew[7,i];
end;

{���������� ZKU �� IBQuery}
procedure TSubsOperations.CopyZKU;
var i :integer;
begin
if IBQ.Active=False then Exit;
with IBQ do
begin
  {������ ������� ��������}
  If(not VarIsNull(FieldValues['stat']))then
    Status:=FieldValues['stat'] else
    Status:=0;
  {����. �����.}
  If(not VarIsNull(FieldValues['koef_izn']))then
  begin
    Koef_izn:=SubsRound.RoundReal(FieldValues['koef_izn'],9);
  end else
    Koef_izn:=0;
  {����. ����.}
  If(not VarIsNull(FieldValues['prop_all']))
  and(not VarIsNull(FieldValues['sub_all']))then
  begin
    If FieldValues['prop_all']=0 then
      Koef_subs:=1 else
      Koef_subs:=SubsRound.RoundReal(FieldValues['sub_all']/FieldValues['prop_all'],4);
  end else
    Koef_subs:=1;
  {���. ����.}
  If(not VarIsNull(FieldValues['sub_all']))then
  begin
    If FieldValues['sub_all']=0 then
      Kol_subs:=0 else
      Kol_subs:=FieldValues['sub_all'];
  end else
    Kol_Subs:=1;
  {�������� ����������� �������}
  If not VarIsNull(FieldValues['st_n_pl_pl']) then
  begin
    If FieldValues['st_n_pl_pl']=0 then
      St_pl:=0 else
      St_pl:=SubsRound.RoundReal(FieldValues['st_n_pl_pl']);
  end else
    St_pl:=0;
  {�������� ���� �����}
  St_zku:=0;
  If not VarIsNull(FieldValues['st_n_zku1']) then
  begin
    If FieldValues['st_n_zku1']=0 then
    St_ZKU:=0 else
    St_ZKU:=SubsRound.RoundReal(FieldValues['st_n_zku1']);
  end;
  {������� ���������}
  If not VarIsNull(FieldValues['soc_nrm_pl']) then
  begin
    If FieldValues['soc_nrm_pl']=0 then
      Pl_r:=1 else
      Pl_r:=SubsRound.RoundReal(FieldValues['soc_nrm_pl']);
  end else
    Pl_r:=1;
  {������� �����}
  if(not VarIsNull(FieldValues['obsh_pl']))then
  begin
    If FieldValues['obsh_pl']=0 then
      Pl_o:=1 else
      Pl_o:=SubsRound.RoundReal(FieldValues['obsh_pl']);
  end else
    Pl_o:=1;
  {������� ��������}
  if(not VarIsNull(FieldValues['soc_n_r_pl']))then
  begin
    If FieldValues['soc_n_r_pl']=0 then
      Pl_i:=1 else
      Pl_i:=SubsRound.RoundReal(FieldValues['soc_n_r_pl']);
  end else
    Pl_i:=1;
  {���������� ���� ���.}
  if not VarIsNull(FieldValues['dt_obr_sub'])then
    Dt_obr_sub:=StrToDate(FieldValues['dt_obr_sub'])else
    Dt_obr_sub:=now;
  {���������� ���� ������ �������}
  if not VarIsNull(FieldValues['dt_n_sub'])then
    Dt_n_sub:=StrToDate(FieldValues['dt_n_sub'])else
    Dt_n_sub:=now;
  {���������� ���� ����� �������}
  if not VarIsNull(FieldValues['Dt_k_sub'])then
    Dt_k_sub:=StrToDate(FieldValues['Dt_k_sub'])else
    Dt_k_sub:=now;
  {���������� ������}
  If not VarIsNull(FieldValues['s_doh']) then
    Dohod:=FieldValues['s_doh'] else
    Dohod:=0;
  {���������� ����. ���.}
  If not VarIsNull(FieldValues['s_p_m']) then
    pr_min:=FieldValues['s_p_m'] else
    pr_min:=0;
  {���������� �������� �� �������}
  {1,2}
  If not VarIsNull(FieldValues['sn']) then
  begin
    for i:=1 to 19 do
    begin
      ZKUNew[4,i]:=FieldValues['sn'+inttostr(i)];
      ZKUNew[5,i]:=FieldValues['lg'+inttostr(i)];
    end;
    ZKUNew[4,20]:=FieldValues['sn'];
    ZKUNew[5,20]:=FieldValues['lg'];
    {3}
    if not VarIsNull(FieldValues['pl']) then
    begin
      for i:=1 to 19 do ZKUNew[6,i]:=FieldValues['pl'+inttostr(i)];
      ZKUNew[6,20]:=FieldValues['pl'];
    end;
    {4}
    if not VarIsNull(FieldValues['sb']) then
    begin
      for i:=1 to 19 do ZKUNew[7,i]:=FieldValues['sb'+inttostr(i)];
      ZKUNew[7,20]:=FieldValues['sb'];
    end;
    {5}
    if not VarIsNull(FieldValues['pn']) then
    begin
      for i:=1 to 19 do ZKUNew[8,i]:=FieldValues['pn'+inttostr(i)];
      ZKUNew[8,20]:=FieldValues['pn'];
    end;
    {6}
    GetDpRData;
  end;
end;
end;

{���������� "����/���"}
procedure TSubsOperations.RaschetPFL;
var i        : Integer;
    pfl      : Currency;
    Koef_fakt: Real;
    Koef_sobs: Real;
begin
  pfl:=0;
  if Pl_r=0 then Koef_sobs:=0 else Koef_sobs:=pl_i/Pl_r;
  if Pl_o=0 then Koef_fakt:=0 else Koef_fakt:=Pl_i/Pl_o;

  for i:=1 to 19 do
  begin
{1}
    if not
   ((((Dt_obr_sub>=StrToDate(User_data_obr_sub8))and(Dt_n_sub<StrToDate(User_data_obr_sub7))and(ZKUNew[6,16]<>0))or
      (Dt_n_sub>=StrToDate(User_data_obr_sub7))))then
    case i of
    1,3:
      ZKUNew[6,i]:=SubsRound.RoundReal(koef_sobs*(ZKUNew[4,i]-ZKUNew[5,i]));
    2,4,5,6,12,13,14,15,16,17,18:
      ZKUNew[6,i]:=SubsRound.RoundReal(Koef_subs*(ZKUNew[4,i]-ZKUNew[5,i]));
    7,8,19:
      if Dt_n_sub>=StrToDate(User_data_obr_sub6) then
      ZKUNew[6,i]:=SubsRound.RoundReal(koef_sobs*(ZKUNew[4,i]-ZKUNew[5,i])) else
      ZKUNew[6,i]:=SubsRound.RoundReal(Koef_subs*(ZKUNew[4,i]-ZKUNew[5,i]));
    9:
      if(Dt_n_sub>=StrToDate(User_data_obr_sub6))and(ZKUNew[6,1]>0)then
      ZKUNew[6,i]:=SubsRound.RoundReal(koef_sobs*(ZKUNew[4,i]-ZKUNew[5,i])) else
      ZKUNew[6,i]:=SubsRound.RoundReal(Koef_subs*(ZKUNew[4,i]-ZKUNew[5,i]));
    10,11:
      if Dt_k_sub>StrToDate(User_data_obr_sub3) then
      ZKUNew[6,i]:=SubsRound.RoundReal(koef_sobs*(ZKUNew[4,i]-ZKUNew[5,i])) else
      ZKUNew[6,i]:=SubsRound.RoundReal(Koef_subs*(ZKUNew[4,i]-ZKUNew[5,i]));
    end else
{2}
    case i of
    1,3,7,8,9,10,11,19:
      ZKUNew[6,i]:=SubsRound.RoundReal(Koef_fakt*ZKUNew[4,i]-koef_sobs*ZKUNew[5,i]);
    2,4,5,6,12,13,14,15,16,17,18:
      ZKUNew[6,i]:=SubsRound.RoundReal(Koef_subs*(ZKUNew[4,i]-ZKUNew[5,i]));
    end;

    pfl:=pfl+ZKUNew[6,i];
  end;
  ZKUNew[6,20]:=pfl;
end;

{���������� "���/��"}
function TSubsOperations.RaschetPF: Currency;
var i        : Integer;
    Koef_fakt: Real;
begin
  Result:=0;
  if Pl_o=0 then Koef_fakt:=0 else Koef_fakt:=Pl_i/Pl_o;

  for i:=1 to 19 do
    case i of
    1,3,7,8,10,11,19:
      Result:=Result+SubsRound.RoundReal(Koef_fakt*ZKUNew[4,i]);
    9:
      if ZKUNew[4,1]>0 then
        Result:=Result+SubsRound.RoundReal(Koef_fakt*ZKUNew[4,i]) else
        Result:=Result+SubsRound.RoundReal(Koef_subs*ZKUNew[4,i]);
    2,4,5,6,12,13,14,15,16,17,18:
      Result:=Result+SubsRound.RoundReal(Koef_subs*ZKUNew[4,i]);
    end;
end;

{������ "��"}
procedure TSubsOperations.RaschetPN;
var i : Integer;
    pn, pfl, pf: Currency;
begin
  pn:=0;
{1}
  if(Dt_n_sub<StrToDate(User_data_obr_sub4))then
    for i:=1 to 20 do
      ZKUNew[8,i]:=0;
{2}
  if(Dt_n_sub>=StrToDate(User_data_obr_sub4))and not(
  (((Dt_obr_sub>=StrToDate(User_data_obr_sub8))and(Dt_n_sub<StrToDate(User_data_obr_sub7))and(ZKUNew[6,16]<>0))or
      (Dt_n_sub>=StrToDate(User_data_obr_sub7))))and(Dt_n_sub<StrToDate(User_data_obr_sub9))then
  for i:=1 to 19 do
  begin
    case i of
    1,3,10,11:
      if Pl_r<>0 then ZKUNew[8,i]:=SubsRound.RoundReal(ZKUNew[4,i]/Pl_r*St_pl)
                 else ZKUNew[8,i]:=0;
    2,4,5,6,12,13,14,15,16,17,18:
      ZKUNew[8,i]:=SubsRound.RoundReal(ZKUNew[4,i]*Koef_subs);
    7,8,19:
      if Dt_n_sub>=StrToDate(User_data_obr_sub6) then
      begin
        if Pl_r<>0 then ZKUNew[8,i]:=SubsRound.RoundReal(ZKUNew[4,i]/Pl_r*St_pl)
                   else ZKUNew[8,i]:=0;
      end else
        ZKUNew[8,i]:=SubsRound.RoundReal(ZKUNew[4,i]*Koef_subs);
    9:
      if(Dt_n_sub>=StrToDate(User_data_obr_sub6))and(ZKUNew[6,1]>0)then
      begin
        if Pl_r<>0 then ZKUNew[8,i]:=SubsRound.RoundReal(ZKUNew[4,i]/Pl_r*St_pl)
                   else ZKUNew[8,i]:=0;
      end else
        ZKUNew[8,i]:=SubsRound.RoundReal(ZKUNew[4,i]*Koef_subs);
    end;
    pn:=pn+ZKUNew[8,i];
  end else
{3}
  if(((Dt_obr_sub>=StrToDate(User_data_obr_sub8))and(Dt_n_sub<StrToDate(User_data_obr_sub7))and(ZKUNew[6,16]<>0))or
      (Dt_n_sub>=StrToDate(User_data_obr_sub7)))and(Dt_n_sub<StrToDate(User_data_obr_sub9))then
  begin
    for i:=1 to 20 do
      ZKUNew[8,i]:=0;
    PF:=RaschetPF;
    PFL:=ZKUNew[6,20];
    if pf=0 then pn:=0 else pn:=SubsRound.RoundReal(St_pl*St_ZKU*PFL/PF);
  end;
{4}
  if(Dt_n_sub>=StrToDate(User_data_obr_sub9))and(Dt_n_sub<StrToDate(User_data_obr_sub10))then
  begin
    for i:=1 to 20 do
      ZKUNew[8,i]:=0;
    PF:=RaschetPF;
    PFL:=ZKUNew[6,20];

    if(Koef_izn=0)or(RKLG=True)or
      ((Dt_obr_sub<StrToDateTime('16.'+FormatDateTime('mm.yyyy', Dt_n_sub)))and
       (Dt_obr_sub>=StrToDateTime('16.'+FormatDateTime('mm.yyyy', IncMonth(Dt_n_sub,-1)))))or
      ((Dt_obr_sub<StrToDateTime('16.'+FormatDateTime('mm.yyyy', IncMonth(Dt_n_sub,1))))and
       (Dt_obr_sub>=StrToDateTime('16.'+FormatDateTime('mm.yyyy', Dt_n_sub))))then
    begin
      if pf=0
      then Koef_izn:=0
      else Koef_izn:=SubsRound.RoundReal(PFL/PF,9);
    end;

    if pf=0 then pn:=0 else pn:=SubsRound.RoundReal(St_pl*St_ZKU*Koef_izn);
  end;
{5}
  if(Dt_n_sub>=StrToDate(User_data_obr_sub10))and(Dt_n_sub<StrToDate(User_data_obr_sub11))then
  begin
    for i:=1 to 20 do
      ZKUNew[8,i]:=0;
    PF:=RaschetPF;
    PFL:=ZKUNew[6,20];

    if(Koef_izn=0)or(RKLG=True)or
      ((Dt_obr_sub<StrToDateTime('16.'+FormatDateTime('mm.yyyy', Dt_n_sub)))and
       (Dt_obr_sub>=StrToDateTime('16.'+FormatDateTime('mm.yyyy', IncMonth(Dt_n_sub,-1)))))or
      ((Dt_obr_sub<StrToDateTime('16.'+FormatDateTime('mm.yyyy', IncMonth(Dt_n_sub,1))))and
       (Dt_obr_sub>=StrToDateTime('16.'+FormatDateTime('mm.yyyy', Dt_n_sub))))then
    begin
      if pf=0
      then Koef_izn:=0
      else Koef_izn:=SubsRound.RoundReal(PFL/PF,9);
    end;

    if pf=0 then pn:=0 else pn:=SubsRound.RoundReal(St_ZKU*Kol_Subs*PFL/PF);
  end;
{6}
  if(Dt_n_sub>=StrToDate(User_data_obr_sub11))then
  begin
    for i:=1 to 20 do
      ZKUNew[8,i]:=0;
    PF:=RaschetPF;
    PFL:=ZKUNew[6,20];

    if(Koef_izn=0)or(RKLG=True)or
      ((Dt_obr_sub<StrToDateTime('16.'+FormatDateTime('mm.yyyy', Dt_n_sub)))and
       (Dt_obr_sub>=StrToDateTime('16.'+FormatDateTime('mm.yyyy', IncMonth(Dt_n_sub,-1)))))or
      ((Dt_obr_sub<StrToDateTime('16.'+FormatDateTime('mm.yyyy', IncMonth(Dt_n_sub,1))))and
       (Dt_obr_sub>=StrToDateTime('16.'+FormatDateTime('mm.yyyy', Dt_n_sub))))then
    begin
      if pf=0
      then Koef_izn:=0
      else Koef_izn:=1;//SubsRound.RoundReal(PFL/PF,9);
    end;

    if pf=0 then pn:=0 else pn:=SubsRound.RoundReal(St_ZKU*Kol_Subs*Koef_izn);
  end;

  ZKUNew[8,20]:=pn;
end;

{������ ������� ��������}
procedure TSubsOperations.RaschetSubs;
var PFL, PN, L, Subs: Currency;
    k, k2: real;
begin
if Assigned(FOnSubsOpBefore) then FOnSubsOpBefore(Self);
if RPSNL=True then RaschetPFL;
RaschetPN;
D_max:=0;
Subs:=0;
L:=ZKUNew[5,20];
PFL:=ZKUNew[6,20];
PN:=ZKUNew[8,20];
if Pr_min=0 then ZKUNew[7,20]:=0 else
begin
  if Dt_obr_sub>=StrToDate(User_data_obr_sub)then k2:=1 else k2:=koef_subs;
  if(StrToDate(User_data_obr_sub2)<Dt_n_sub)and(Status=3)then k:=1.2 else k:=1;
{1}
  if Dt_n_sub<StrToDate(User_data_obr_sub4)then
  begin
    if Dohod>=k*Pr_min then D_max:=Dohod*0.22*k2 else D_max:=Dohod*0.22*Dohod/Pr_min*k2;
    case Status of
    0: begin
         D_max:=SubsRound.RoundReal(D_max);
         Subs:=SubsRound.RoundReal(PFL-D_max);
       end;
    3: begin
         D_max:=SubsRound.RoundReal(D_max/2);
         Subs:=SubsRound.RoundReal(PFL-D_max);
       end;
    end;
  end;
{2}
  if(Dt_n_sub>=StrToDate(User_data_obr_sub4))and(Dt_n_sub<StrToDate(User_data_obr_sub7))then
  begin
    if Dohod>=k*Pr_min then D_max:=Dohod*0.22 else D_max:=Dohod*0.22*Dohod/Pr_min;
    case Status of
    0: begin
         D_max:=SubsRound.RoundReal(D_max);
         Subs:=SubsRound.RoundReal(PN-L-D_max);
       end;
    3: begin
         if(Dohod<k*Pr_min)and(Dohod>=Pr_min)then D_max:=Dohod*0.22;
         D_max:=SubsRound.RoundReal(D_max/2);
         Subs:=SubsRound.RoundReal(PN-L-D_max);
       end;
    end;
    VSubs:=Subs;
    if Subs>PFL then Subs:=PFL;
  end;
{3}
  if((((Dt_obr_sub>=StrToDate(User_data_obr_sub8))and(Dt_n_sub<StrToDate(User_data_obr_sub7))and(ZKUNew[6,16]<>0))or
      (Dt_n_sub>=StrToDate(User_data_obr_sub7))))and(Dt_n_sub<StrToDate(User_data_obr_sub9))then
  begin
    if Dohod>=k*Pr_min then D_max:=Dohod*0.22 else D_max:=Dohod*0.22*Dohod/Pr_min;
    case Status of
    0: begin
         D_max:=SubsRound.RoundReal(D_max);
         Subs:=SubsRound.RoundReal(PN-D_max);
       end;
    3: begin
         if(Dohod<k*Pr_min)and(Dohod>=Pr_min)then D_max:=Dohod*0.22;
         D_max:=SubsRound.RoundReal(D_max/2);
         Subs:=SubsRound.RoundReal(PN-D_max);
       end;
    end;
    VSubs:=Subs;
    if Subs>PFL then Subs:=PFL;
  end;
{4}
  if(Dt_n_sub>=StrToDate(User_data_obr_sub9))and(Dt_n_sub<StrToDate(User_data_obr_sub10))then
  begin
    if Dohod>=k*Pr_min then D_max:=Dohod*0.22 else D_max:=Dohod*0.22*Dohod/Pr_min;
    case Status of
    0: begin
         D_max:=SubsRound.RoundReal(D_max);
         Subs:=SubsRound.RoundReal(PN-D_max);
       end;
    3: begin
         if(Dohod<k*Pr_min)and(Dohod>=Pr_min)then D_max:=Dohod*0.22;
         D_max:=SubsRound.RoundReal(D_max/2);
         Subs:=SubsRound.RoundReal(PN-D_max);
       end;
    end;
    VSubs:=Subs;
    if Subs>PFL then Subs:=PFL;
  end; 
{5}
  if(Dt_n_sub>=StrToDate(User_data_obr_sub10))then
  begin
    if Dohod>=k*Pr_min then D_max:=Dohod*0.22 else D_max:=Dohod*0.22*Dohod/Pr_min;
    case Status of
    0: begin
         D_max:=SubsRound.RoundReal(D_max);
         Subs:=SubsRound.RoundReal(PN-D_max);
       end;
    3: begin
         if(Dohod<k*Pr_min)and(Dohod>=Pr_min)then D_max:=Dohod*0.22;
         D_max:=SubsRound.RoundReal(D_max/2);
         Subs:=SubsRound.RoundReal(PN-D_max);
       end;
    end;
    VSubs:=Subs;
    if Subs>PFL then Subs:=PFL;
  end;
end;
ZKUNew[7,20]:=Subs;
SetSubsZKU;
if Assigned(FOnSubsOpAfter) then FOnSubsOpAfter(self);
end;

{������������� ������� �������� �� �������}
procedure TSubsOperations.SetSubsZKU;
var subs: Currency;
    n, i: Integer;
begin
subs:=0; n:=1;
if ZKUNew[6,20]<>0 then
begin
  for i:=1 to 19 do
  begin
    ZKUNew[7,i]:=SubsRound.RoundReal(ZKUNew[6,i]/ZKUNew[6,20]*ZKUNew[7,20]);
    subs:=subs+ZKUNew[7,i];
    if ZKUNew[7,i]<>0 then n:=i;
  end;
  ZKUNew[7,n]:=SubsRound.RoundReal(ZKUNew[7,n]+ZKUNew[7,20]-subs);
  {���� �������������� ������, ��}
  if dp_r=True then
  begin
    if ZKUNew[7, 20]<0 then for i:=1 to 20 do ZKUNew[7,i]:=0;
    {1.������ �������� ������/����� 0}
    if ZKUOldSubs[20]<=0 then Exit;
    {2.������ ������}
    for i:=1 to 20 do ZKUNew[7,i]:=SubsRound.RoundReal(ZKUNew[7,i]-ZKUOldSubs[i]);
  end;
end else
begin
 for i:=1 to 20 do
   ZKUNew[7,i]:=0;
end;
end;

{������  � ��}
procedure TSubsOperations.SetDataToIB;
var i: integer;
begin
  if(Assigned(IBDataSet2))and(idd>0)then
  begin
    //������ "����" � "��������"
    IBQ2.Active:=False;
    IBQ2.SQL.Clear;
    IBQ2.SQL.add('update main set ');
    ZKUNew[4,20]:=0;
    ZKUNew[5,20]:=0;
    for i:=1 to 19 do
    begin
      IBQ2.SQL.add('sn'+IntToStr(i)+'='+FloatToStr(ZKUNew[4,i])+', ');
      IBQ2.SQL.add('lg'+IntToStr(i)+'='+FloatToStr(ZKUNew[5,i])+', ');
      IBQ2.SQL.add('pl'+IntToStr(i)+'='+FloatToStr(ZKUNew[6,i])+', ');
      IBQ2.SQL.add('sb'+IntToStr(i)+'='+FloatToStr(ZKUNew[7,i])+', ');
      IBQ2.SQL.add('pn'+IntToStr(i)+'='+FloatToStr(ZKUNew[8,i])+', ');
      ZKUNew[4,20]:=ZKUNew[4,20]+ZKUNew[4,i];
      ZKUNew[5,20]:=ZKUNew[5,20]+ZKUNew[5,i];
    end;
    IBQ2.SQL.add('sn='+FloatToStr(ZKUNew[4,20])+', ');
    IBQ2.SQL.add('lg='+FloatToStr(ZKUNew[5,20])+', ');
    IBQ2.SQL.add('pl='+FloatToStr(ZKUNew[6,20])+', ');
    IBQ2.SQL.add('sb='+FloatToStr(ZKUNew[7,20])+', ');
    IBQ2.SQL.add('pn='+FloatToStr(ZKUNew[8,20])+', ');
    IBQ2.SQL.add('d_max='+FloatToStr(Dmax)+', ');
    IBQ2.SQL.add('koef_izn='+FloatToStr(Koef_izn)+' ');
    IBQ2.SQL.add('where idd='+IntToStr(idd));
    IBQ2.ExecSQL;
    SetDpRData;
  end;
end;

{������ ������ ��������}
procedure TSubsOperations.GetDpRData;
var i: Integer;
begin
for i:=1 to 20 do ZKUOldSubs[i]:=0;
with IBQ do
  if FieldDefs.IndexOf('os')<>-1 then
    if not VarIsNull(FieldValues['os']) then
    begin
      for i:=1 to 19 do ZKUOldSubs[i]:=FieldValues['os'+IntToStr(i)];
      ZKUOldSubs[20]:=FieldValues['os'];
    end;
end;

{������ ������ ��������, �� ������ ���� �������������� ������ ��� ������������}
procedure TSubsOperations.SetDpRData;
var i: Integer;
begin
  If Dp_r=True then
  begin
    IBQ2.SQL.Clear;
    IBQ2.SQL.add('select idd from main_old where idd='+IntToStr(idd));
    IBQ2.Active:=True;
    if VarIsNull(IBQ2.FieldValues['idd']) then
    begin
      IBQ2.Active:=False;
      IBQ2.SQL.Clear;
      IBQ2.SQL.add('insert into main_old (idd, os1, os2, os3, os4, os5, ');
      IBQ2.SQL.add('os6,  os7,  os8,  os9,  os10, ');
      IBQ2.SQL.add('os11, os12, os13, os14, os15, ');
      IBQ2.SQL.add('os16, os17, os18, os19, os) values ('+IntToStr(idd)+', ');
      for i:=1 to 19 do IBQ2.SQL.Add(FloatToStr(ZKUOldSubs[i])+', ');
      IBQ2.SQL.add(FloatToStr(ZKUOldSubs[20])+')');
      IBQ2.ExecSQL;
    end;
    IBQ2.Active:=False;
  end;
end;

{�������� ��� �����������}
procedure TSubsOperations.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if(Operation=opRemove)and(AComponent=IBQ)then IBQ:=nil;
  if(Operation=opRemove)and(AComponent=IBQ2)then IBQ2:=nil;
end;

{������ ������ �� ������}
procedure TSubsOperations.SetIBQ(AValue: TIBQuery);
begin
  if AValue<>IBQ then
  begin
    if AValue<>nil then
    begin
      if Assigned(IBQ)and(IBQ.Owner=Self)then IBQ.Free;
      IBQ:=AValue;
      IBQ.FreeNotification(self);
    end else //nil value
    begin
      if Assigned(IBQ)and(IBQ.Owner<>Self)then
      begin
        IBQ.Name:='IBQ'; //optional bit, but makes result much nicer
        IBQ.SetSubComponent(True);
        IBQ.FreeNotification(Self);
      end;
    end;
  end;
end;

{������ ������ �� ������}
procedure TSubsOperations.SetIBQ2(AValue: TIBQuery);
begin
  if AValue<>IBQ2 then
  begin
    if AValue<>nil then
    begin
      if Assigned(IBQ2)and(IBQ2.Owner=Self)then IBQ2.Free;
      IBQ2:=AValue;
      IBQ2.FreeNotification(Self);
    end else //nil value
    begin
      if Assigned(IBQ2)and(IBQ2.Owner<>Self)then
      begin
        IBQ2.Name:='IBQ2'; //optional bit, but makes result much nicer
        IBQ2.SetSubComponent(True);
        IBQ2.FreeNotification(Self);
      end;  
    end;
  end;
end;

{������: TSubsGrid ************************************************************}
{������: ������������ � ����������� �����������}

constructor TSubsGrid.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  SubsOper:=TSubsOperations.Create(SubsOper);
  OnSelectCell:=SubsGridSelectCell;
  SubsOper.OnSubsOpAfter:=CopyZKUfromArrayAfter;
  SubsOper.OnSubsOpBefore:=CopyZKUfromArrayBefore;
  ColCount:=9;
  RowCount:=21;
  Font.Size:=8;
  Width:=601;
  DefaultColWidth:=5;
  FixedCols:=2;
  FixedRows:=1;
  Height:=427;

  ScrollBars:=ssNone;
  FixedColor:=clCream;
  Cursor:=crHandPoint;
  Color:=clWhite;
  ParentFont:=False;
  Font.Color:=clNavy;
  Font.Name:='Arial';

  ColWidths[0]:=23;              
  ColWidths[1]:=235;
  ColWidths[2]:=25;
  ColWidths[3]:=66;
  ColWidths[4]:=48;
  ColWidths[5]:=48;
  ColWidths[6]:=48;
  ColWidths[7]:=48;
  ColWidths[8]:=48;

  Default;

  Cells[0, 0]:='�';
  Cells[1, 0]:='���� �����';
  Cells[2, 0]:='���.';
  Cells[3, 0]:='���.����';
  Cells[4, 0]:='��';
  Cells[5, 0]:='������';
  Cells[6, 0]:='���';
  Cells[7, 0]:='��������';
  Cells[8, 0]:='��';

  Cells[1, 1]:='���������� � ������ �����';
  //Cells[1, 2]:='���������� (�����������) ���';
  Cells[1, 2]:='���������� (��������) ���';
  Cells[1, 3]:='��������� (��������������)';
  Cells[1, 4]:='������� �������������';
  Cells[1, 5]:='�������� �������������';

  Cells[1, 6]:='������������� (�����������)';
  Cells[1, 7]:='���� (������������ � ������)';
  Cells[1, 8]:='������������ (������������ � ������)';
  Cells[1, 9]:='����� ������� ������� �������';
  Cells[1,10]:='������ ���������� ����������';

  Cells[1,11]:='������ ���� ������ �����������';
  Cells[1,12]:='������������ (������������ � ������)';
  Cells[1,13]:='��������������';
  Cells[1,14]:='�������������';
  Cells[1,15]:='��� ��������� ���������';

  Cells[1,16]:='������� �������';
  Cells[1,17]:='�������� �������';
  Cells[1,18]:='�������������� (�����������)';
  Cells[1,19]:='����������� ������������ ����';
  Cells[1,20]:='�����:';
end;

destructor TSubsGrid.Destroy;
begin
  SubsOper.Free;
  inherited Destroy;
end;

{������: ������ ����������� �����������}

{���������� ������� OnExit}
procedure TSubsGrid.CMExit(var Msg: TMessage);
begin
OtherClick;
inherited;
end;

{���������� ������� OnSelectCell}
procedure TSubsGrid.SubsGridSelectCell(Sender: TObject; Col, Row: Longint; var CanSelect: Boolean);
begin
OtherClick;
inherited;
end;

{���������� ��������� Width}
procedure TSubsGrid.SetWidth(Value: Integer);
begin
  ColWidths[0]:=round(Value*23/601);
  ColWidths[1]:=round(Value*235/601);
  ColWidths[2]:=round(Value*25/601);
  ColWidths[3]:=round(Value*66/601);

  ColWidths[4]:=round(Value*48/601);
  ColWidths[5]:=round(Value*48/601);
  ColWidths[6]:=round(Value*48/601);
  ColWidths[7]:=round(Value*48/601);
  ColWidths[8]:=round(Value*48/601);

  while ColWidths[0]+ColWidths[1]+
        ColWidths[2]+ColWidths[3]+
        ColWidths[4]+ColWidths[5]+
        ColWidths[6]+ColWidths[7]+
        ColWidths[8]<Value-12 do
        begin
          ColWidths[1]:=ColWidths[1]+1;
        end;
  while ColWidths[0]+ColWidths[1]+
        ColWidths[2]+ColWidths[3]+
        ColWidths[4]+ColWidths[5]+
        ColWidths[6]+ColWidths[7]+
        ColWidths[8]>Value-12 do
        begin
          ColWidths[1]:=ColWidths[1]-1;
        end;
  Refresh;
  Update;
  inherited Width := Value;
end;

{���������� ���������� Width}
function TSubsGrid.GetWidth;
begin
  Result:=inherited Width;
end;

{���������� ��������� Height}
procedure TSubsGrid.SetHeight(Value: Integer);
var i, rrr: Integer;
begin
  rrr:=Value div 22;
  for i:=0 to 20 do RowHeights[i]:=rrr;
  RowHeights[0]:=rrr-9+Value mod 22;
  inherited Height:= Value;
end;

{���������� ��������� Height}
function TSubsGrid.GetHeight;
begin
  Result := inherited Height;
end;

{��������� ������������ ������� IBQ}
function TSubsGrid.GetIBQ: TIBQuery;
begin
  Result:=SubsOper.IBQ;
end;

{������ DM-�����}
procedure TSubsGrid.SetDM(AValue: TLabel);
begin
  if AValue<>DM then
  begin
    if AValue<>nil then
    begin
      if Assigned(DM)and(DM.Owner=Self)then DM.Free;
      DM:=AValue;
      DM.FreeNotification(self);
    end else //nil value
    begin
      if Assigned(DM)and(DM.Owner<>Self)then
      begin
        DM.Name:='DM'; //optional bit, but makes result much nicer
        DM.SetSubComponent(True);
        DM.FreeNotification(Self);
      end;
    end;
  end;
end;

{��������� ��������� � �����������}
procedure TSubsGrid.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if(Operation=opRemove)and(AComponent=DM)then DM:=nil;
  if(Operation=opRemove)and(AComponent=SubsOper.IBQ)then SubsOper.IBQ:=nil;
end;

{���������� ������� IBQ}
procedure TSubsGrid.SetIBQ(AValue: TIBQuery);
begin
  if AValue<>SubsOper.IBQ then
  begin
    if AValue<>nil then
    begin
      if Assigned(SubsOper.IBQ)and(SubsOper.IBQ.Owner=Self)then SubsOper.IBQ.Free;
      SubsOper.IBQ:=AValue;
      SubsOper.IBQ.FreeNotification(self);
    end else //nil value
    begin
      if Assigned(SubsOper.IBQ)and(SubsOper.IBQ.Owner<>Self)then
      begin
        SubsOper.IBQ.Name:='SubsOperIBQ'; //optional bit, but makes result much nicer
        SubsOper.IBQ.SetSubComponent(True);
        SubsOper.IBQ.FreeNotification(Self);
      end;
    end;
  end;
end;

{���������� ������� ������� �������� �������� ������ �� ��������}
procedure TSubsGrid.SetOldSub;
var i :integer;
begin
if Trim(Cells[7,20])='' then
begin
  for i:=1 to 20 do SubsOper.ZKUOldSubs[i]:=0;
end else
begin
  if StrToFloat(Cells[7,20])>0 then
    for i:=1 to 20 do SubsOper.ZKUOldSubs[i]:=StrToFloat(Cells[7,i])else
    for i:=1 to 20 do SubsOper.ZKUOldSubs[i]:=0;
end;
end;

{���������� ������� OnClick}
procedure TSubsGrid.Click;
begin
inherited Click;
//��������� ������� �������� � �����
if RefreshSubs=False then Exit;
if(Col=7)and(Row=20)then
begin
  Options:=Options+[goEditing];
  Subs20Round;
  Exit;
end;
//==============================================================================
if(col=6)or(col=7)or(col=8)or(row=20)
then
   Options:=Options-[goEditing]
else
  begin
  Options:=Options+[goEditing];
  case col of
  2: begin
     if Assigned(FOnZakSelect) then FOnZakSelect(Self);
     Cells[Col,Row]:=SubsRound.FloatText(Cells[Col,Row],0);
     end;
  3: Cells[Col,Row]:=SubsRound.FloatText(Cells[Col,Row],0);
  4: begin
     Cells[Col,Row]:=SubsRound.FloatText(Cells[Col,Row]);
     Cells[4,20]:=FloatToStr(StrToFloat(Cells[4,1]) +StrToFloat(Cells[4,2])+
                             StrToFloat(Cells[4,3]) +StrToFloat(Cells[4,4])+
                             StrToFloat(Cells[4,5]) +StrToFloat(Cells[4,6])+
                             StrToFloat(Cells[4,7]) +StrToFloat(Cells[4,8])+
                             StrToFloat(Cells[4,9]) +StrToFloat(Cells[4,10])+
                             StrToFloat(Cells[4,11])+StrToFloat(Cells[4,12])+
                             StrToFloat(Cells[4,13])+StrToFloat(Cells[4,14])+
                             StrToFloat(Cells[4,15])+StrToFloat(Cells[4,16])+
                             StrToFloat(Cells[4,17])+StrToFloat(Cells[4,18])+
                             StrToFloat(Cells[4,19]));
     end;
  5: begin
     Cells[Col,Row]:=SubsRound.FloatText(Cells[Col,Row]);
     Cells[5,20]:=FloatToStr(StrToFloat(Cells[5,1]) +StrToFloat(Cells[5,2])+
                             StrToFloat(Cells[5,3]) +StrToFloat(Cells[5,4])+
                             StrToFloat(Cells[5,5]) +StrToFloat(Cells[5,6])+
                             StrToFloat(Cells[5,7]) +StrToFloat(Cells[5,8])+
                             StrToFloat(Cells[5,9]) +StrToFloat(Cells[5,10])+
                             StrToFloat(Cells[5,11])+StrToFloat(Cells[5,12])+
                             StrToFloat(Cells[5,13])+StrToFloat(Cells[5,14])+
                             StrToFloat(Cells[5,15])+StrToFloat(Cells[5,16])+
                             StrToFloat(Cells[5,17])+StrToFloat(Cells[5,18])+
                             StrToFloat(Cells[5,19]));
      end;
    end;
  end;
end;

{���������� ������ ������� ������� �� OnClick}
procedure TSubsGrid.OtherClick;
begin
inherited Click;
//��������� ������� �������� � �����
if RefreshSubs=False then Exit;
if(Col=7)and(Row=20)then
begin
  Options:=Options+[goEditing];
  Subs20Round;
  Exit;
end;
//==============================================================================
if(col=6)or(col=7)or(col=8)or(row=20)
then
   Options:=Options-[goEditing]
else
  begin
  Options:=Options+[goEditing];
  case col of
  2: Cells[Col,Row]:=SubsRound.FloatText(Cells[Col,Row],0);
  3: Cells[Col,Row]:=SubsRound.FloatText(Cells[Col,Row],0);
  4: begin
     Cells[Col,Row]:=SubsRound.FloatText(Cells[Col,Row]);
     Cells[4,20]:=FloatToStr(StrToFloat(Cells[4,1]) +StrToFloat(Cells[4,2])+
                             StrToFloat(Cells[4,3]) +StrToFloat(Cells[4,4])+
                             StrToFloat(Cells[4,5]) +StrToFloat(Cells[4,6])+
                             StrToFloat(Cells[4,7]) +StrToFloat(Cells[4,8])+
                             StrToFloat(Cells[4,9]) +StrToFloat(Cells[4,10])+
                             StrToFloat(Cells[4,11])+StrToFloat(Cells[4,12])+
                             StrToFloat(Cells[4,13])+StrToFloat(Cells[4,14])+
                             StrToFloat(Cells[4,15])+StrToFloat(Cells[4,16])+
                             StrToFloat(Cells[4,17])+StrToFloat(Cells[4,18])+
                             StrToFloat(Cells[4,19]));
     end;
  5: begin
     Cells[Col,Row]:=SubsRound.FloatText(Cells[Col,Row]);
     Cells[5,20]:=FloatToStr(StrToFloat(Cells[5,1]) +StrToFloat(Cells[5,2])+
                             StrToFloat(Cells[5,3]) +StrToFloat(Cells[5,4])+
                             StrToFloat(Cells[5,5]) +StrToFloat(Cells[5,6])+
                             StrToFloat(Cells[5,7]) +StrToFloat(Cells[5,8])+
                             StrToFloat(Cells[5,9]) +StrToFloat(Cells[5,10])+
                             StrToFloat(Cells[5,11])+StrToFloat(Cells[5,12])+
                             StrToFloat(Cells[5,13])+StrToFloat(Cells[5,14])+
                             StrToFloat(Cells[5,15])+StrToFloat(Cells[5,16])+
                             StrToFloat(Cells[5,17])+StrToFloat(Cells[5,18])+
                             StrToFloat(Cells[5,19]));
      end;
    end;
  end;
end;

{����������� � ���������� ������� �������� ����� �����}
procedure TSubsGrid.Subs20Round;
var i,n : Integer;
    subs: Real;
begin
  Cells[7,20]:=SubsRound.FloatText(Cells[7,20]);
  if Assigned(DmaxLabel) then
  begin
    CopyZKUfromArrayBefore(Self);
    //���� �������� �� 0
    if SubsOper.ZKUNew[6,20]<>0 then
    begin
      if SubsOper.Dp_r=True then
      begin
        //�������� ������� �������� �� ����� �� ���������
        if SubsOper.ZKUNew[7,20]+SubsOper.ZKUOldSubs[20]-
           SubsOper.ZKUNew[6,20]>StrToFloat(DM.Caption) then
           SubsOper.ZKUNew[7,20]:=SubsOper.ZKUNew[6,20]-StrToFloat(DM.Caption);
        if(SubsOper.ZKUOldSubs[20]>=0)and(SubsOper.ZKUNew[7,20]<0)then
          if(abs(SubsOper.ZKUNew[7,20])>SubsOper.ZKUOldSubs[20])then
            SubsOper.ZKUNew[7,20]:=-SubsOper.ZKUOldSubs[20];
      end else
      begin
        //�������� ������� �������� �� ����� �� ���������
        if SubsOper.ZKUNew[7,20]-SubsOper.ZKUNew[6,20]>StrToFloat(DM.Caption) then
           SubsOper.ZKUNew[7,20]:=SubsOper.ZKUNew[6,20]-StrToFloat(DM.Caption);
      end;
    end;
    //������������� ������� �������� �� �������
    n:=0;
    Subs:=0;
    for i:=1 to 19 do
    begin
      SubsOper.ZKUNew[7,i]:=SubsRound.RoundReal(
        SubsOper.ZKUNew[6,i]/SubsOper.ZKUNew[6,20]*SubsOper.ZKUNew[7,20]);
      subs:=subs+SubsOper.ZKUNew[7,i];
      if SubsOper.ZKUNew[7,i]<>0 then n:=i;
    end;
    SubsOper.ZKUNew[7,n]:=SubsRound.RoundReal(
      SubsOper.ZKUNew[7,n]+SubsOper.ZKUNew[7,20]-subs);
    for i:=20 Downto 1 do Cells[7,i]:=FloatToStr(SubsOper.ZKUNew[7,i]);
  end;
end;

{�������� ��� ������ � �����}
procedure TSubsGrid.Default;
var i: Integer;
begin
for i:=1 to 19 do
begin
  Cells[0, i]:=IntToStr(i);
  Cells[2, i]:=ZKUZak[i];
  Cells[3, i]:='0';
  Cells[4, i]:='0';
  Cells[5, i]:='0';
  Cells[6, i]:='';
  Cells[7, i]:='';
  Cells[8, i]:='';
  SubsOper.ZKUOldSubs[i]:=0;
end;
Cells[0,20]:='';
Cells[2,20]:='';
Cells[3,20]:='';
Cells[4,20]:='0';
Cells[5,20]:='0';
Cells[6,20]:='';
Cells[7,20]:='';
Cells[8,20]:='';
SubsOper.ZKUOldSubs[20]:=0;
end;

{���������� ZKU �� IBQuery}
procedure TSubsGrid.SetDataFromIB;
begin
Try
  CopyZKU;
Except
ShowMessage('���������� ������ � ������ �������!');
end;
end;

{���������� ZKU �� IBQuery}
procedure TSubsGrid.SetDataFromIBNext;
begin
SubsOper.IBQ.Next;
Try
  CopyZKU;
Except
ShowMessage('���������� ������ � ������ �������!');
end;
end;

{���������� ZKU �� IBQuery}
procedure TSubsGrid.CopyZKU;
var i: Integer;
begin
if SubsOper.IBQ.Active=False then Exit;
with SubsOper.IBQ do
begin
  for i:=1 to 19 do
  begin
    Cells[2,i]:=FieldValues['zk'+IntToStr(i)];
    Cells[3,i]:=FieldValues['ls'+IntToStr(i)];
    Cells[4,i]:=FieldValues['sn'+IntToStr(i)];
    Cells[5,i]:=FieldValues['lg'+IntToStr(i)];
    Cells[6,i]:=FieldValues['pl'+IntToStr(i)];
    Cells[7,i]:=FieldValues['sb'+IntToStr(i)];
    Cells[8,i]:=FieldValues['pn'+IntToStr(i)];
  end;
  Cells[4,20]:=FieldValues['sn'];
  Cells[5,20]:=FieldValues['lg'];
  Cells[6,20]:=FieldValues['pl'];
  Cells[7,20]:=FieldValues['sb'];
  Cells[8,20]:=FieldValues['pn'];

  SubsOper.GetDpRData;
end;
end;

{����������� � ������ �� �����}
procedure TSubsGrid.CopyZKUfromArrayBefore(AObject: TObject);
var i: Integer;
begin
for i:=1 to 20 do
begin
  SubsOper.ZKUNew[4,i]:=StrToFloat(Cells[4,i]);
  SubsOper.ZKUNew[5,i]:=StrToFloat(Cells[5,i]);
  if Cells[6,i]<>'' then
    SubsOper.ZKUNew[6,i]:=StrToFloat(Cells[6,i]) else
    SubsOper.ZKUNew[6,i]:=0;
  if Cells[7,i]<>'' then
    SubsOper.ZKUNew[7,i]:=StrToFloat(Cells[7,i]) else
    SubsOper.ZKUNew[7,i]:=0;
end;
end;

{����������� � ����� �� �������}
procedure TSubsGrid.CopyZKUfromArrayAfter(AObject: TObject);
var i: Integer;
begin
for i:=20 downto 1 do
begin
  Cells[4,i]:=FloatToStr(SubsOper.ZKUNew[4,i]);
  Cells[5,i]:=FloatToStr(SubsOper.ZKUNew[5,i]);
  Cells[6,i]:=FloatToStr(SubsOper.ZKUNew[6,i]);
  Cells[7,i]:=FloatToStr(SubsOper.ZKUNew[7,i]);
  Cells[8,i]:=FloatToStr(SubsOper.ZKUNew[8,i]);
end;
end;

{������  � ��}
procedure TSubsGrid.SetDataToIB;
var i: Integer;
begin
if Assigned(SubsOper.IBDataSet2)and(SubsOper.IDD>0)then
begin
  //1. ������ "����������"
  //2. ������ "���.������"
  SubsOper.IBQ2.Active:=False;
  SubsOper.IBQ2.SQL.Clear;
  SubsOper.IBQ2.SQL.add('update main set ');
  for i:=1 to 18 do
  begin
    SubsOper.IBQ2.SQL.add('zk'+IntToStr(i)+'='+Cells[2,i]+', ');
    SubsOper.IBQ2.SQL.add('ls'+IntToStr(i)+'='+Cells[3,i]+', ');
  end;
  SubsOper.IBQ2.SQL.add('zk19='+Cells[2,19]+', ');
  SubsOper.IBQ2.SQL.add('ls19='+Cells[3,19]+' where idd='+inttostr(SubsOper.IDD));
  SubsOper.IBQ2.ExecSQL;

  //3. ������ "���"
  //4. ������ "������"
  //5. ������ "����"
  //6. ������ "��������"
  SubsOper.IBQ2.Active:=False;
  SubsOper.IBQ2.SQL.Clear;
  SubsOper.IBQ2.SQL.add('update main set ');
  for i:=1 to 19 do
  begin
    SubsOper.IBQ2.SQL.add('sn'+inttostr(i)+'='+Cells[4,i]+', ');
    SubsOper.IBQ2.SQL.add('lg'+inttostr(i)+'='+Cells[5,i]+', ');
    SubsOper.IBQ2.SQL.add('pl'+IntToStr(i)+'='+Cells[6,i]+', ');
    SubsOper.IBQ2.SQL.add('sb'+IntToStr(i)+'='+Cells[7,i]+', ');
    SubsOper.IBQ2.SQL.add('pn'+IntToStr(i)+'='+Cells[8,i]+', ');
  end;
  SubsOper.IBQ2.SQL.add('sn='+Cells[4,i]+', ');
  SubsOper.IBQ2.SQL.add('lg='+Cells[5,i]+', ');
  SubsOper.IBQ2.SQL.add('pl='+Cells[6,i]+', ');
  SubsOper.IBQ2.SQL.add('sb='+Cells[7,i]+', ');
  SubsOper.IBQ2.SQL.add('pn='+Cells[8,i]+', ');
  SubsOper.IBQ2.SQL.add('d_max='+FloatToStr(SubsOper.Dmax)+' ');
  SubsOper.IBQ2.SQL.add('where idd='+IntToStr(SubsOper.IDD));
  SubsOper.IBQ2.ExecSQL;
  SubsOper.SetDpRData;
end;
end;

{������ �� Ini-�����}
procedure TSubsGrid.ReadIniFile(Fl: TIniFile);
var i  : Integer;
    nom: String;
begin
for i:=1 to 20 do
begin
nom:=IntToStr(i);
Cells[2,i]:=Fl.ReadString('���','2.'+nom,'0');
Cells[3,i]:=Fl.ReadString('���','3.'+nom,'0');
Cells[4,i]:=Fl.ReadString('���','4.'+nom,'0');
Cells[5,i]:=Fl.ReadString('���','5.'+nom,'0');
Cells[6,i]:=Fl.ReadString('���','6.'+nom,'');
Cells[7,i]:=Fl.ReadString('���','7.'+nom,'');
Cells[8,i]:=Fl.ReadString('���','8.'+nom,'');
SubsOper.ZKUOldSubs[i]:=Fl.ReadFloat('���','9.'+nom,0);
end;
end;

{������ � Ini-�����}
procedure TSubsGrid.WriteIniFile(Fl: TIniFile);
var i  : Integer;
    nom: String;
begin
for i:=1 to 20 do
begin
nom:=IntToStr(i);
Fl.WriteString('���','2.'+nom, Cells[2,i]);
Fl.WriteString('���','3.'+nom, Cells[3,i]);
Fl.WriteString('���','4.'+nom, Cells[4,i]);
Fl.WriteString('���','5.'+nom, Cells[5,i]);
Fl.WriteString('���','6.'+nom, Cells[6,i]);
Fl.WriteString('���','7.'+nom, Cells[7,i]);
Fl.WriteString('���','8.'+nom, Cells[8,i]);
Fl.WriteFloat('���','9.'+nom, SubsOper.ZKUOldSubs[i]);
end;
end;

{���������������}
procedure TSubsGrid.WMSize(var Message: TWMSize);
begin
  SetWidth(Width);
  SetHeight(Height);
  inherited;
end;

{������: TSubsRound ***********************************************************}

{������� ���������� ��������� ��������}
function TSubsRound.RoundReal(VReal: Variant; const Decimals: Integer=2): Real;
var
  Factor: extended;
begin
try
  Factor:=Int(Exp(Decimals*Ln(10)));
  Result:=Round(Factor*VReal)/Factor;
except
  Result:=0
end;
end;

{������� ���������� �������� ��������}
function TSubsRound.FloatText(VText: String; const Decimals: Integer=2): String;
var i      : integer;
    t_zn, z: string;
begin
t_zn:='';
for i:=1 to length(VText) do
begin
  z:=Copy(VText, i, 1);
  if z=',' then z:='.';
  t_zn:=t_zn+z;
end;
VText:=t_zn;
try
  result:=FloatToStr(RoundReal(StrToFloat(VText), Decimals));
except
  on E: EConvertError do
  Result:='0';
end;
end;

{������:  TSubsUsers **********************************************************}
{������: ������������ � ����������� �����������}

constructor TSubsUsers.Create(AOwner: TComponent);
begin
  inherited;
  IBQ:=TIBQuery.Create(IBQ);
  BDEQ:=TQuery.Create(BDEQ);
  Default;
end;

destructor TSubsUsers.Destroy;
begin
  IBQ:=nil; IBQ.Free;
  BDEQ:=nil;BDEQ.Free;
  inherited;
end;

{������: ������ ����������� �����������}

{��������� �� ���������}
procedure TSubsUsers.Default;
begin
  user_stat:='5';
  user_rai:='8';

  user_del:=False;
  user_vp:=False;
  user_vip:=False;
  user_active:=True;
  user_history_mod:=False;
  user_dh10:=False;  

  user_0:='�������������';
  user_1:='��������� ����������';
  user_2:='������� ���������';
  user_3:='��������� ������';
  user_get:=False;
end;

function TSubsUsers.GetRai: TRaion;
begin
Result:=R8;
case StrToInt(user_rai) of
1: Result:=R1;
2: Result:=R2;
3: Result:=R3;
4: Result:=R4;
5: Result:=R5;
6: Result:=R6;
7: Result:=R7;
8: Result:=R8;
end;
end;

{��������� ��������� � �����������}
procedure TSubsUsers.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if(Operation=opRemove)and(AComponent=BDEQ)then BDEQ:=nil;
  if(Operation=opRemove)and(AComponent=IBQ)then IBQ:=nil;
end;

{���������� ��������������� ������}
procedure TSubsUsers.SetIBQ(AValue: TIBQuery);
begin
  if AValue<>IBQ then
  begin
    if AValue<>nil then
    begin
      if Assigned(IBQ)and(IBQ.Owner=Self)then IBQ.Free;
      IBQ:=AValue;  
      IBQ.FreeNotification(self);
    end else //nil value
    begin
      if Assigned(IBQ)and(IBQ.Owner<>Self)then
      begin
        IBQ.Name:='IBQ'; //optional bit, but makes result much nicer
        IBQ.SetSubComponent(True);
        IBQ.FreeNotification(Self);
      end;
    end;
  end;
end;

{���������� ��������������� ������}
procedure TSubsUsers.SetBDEQ(AValue: TQuery);
begin
  if AValue<>BDEQ then
  begin
    if AValue<>nil then
    begin
      if Assigned(BDEQ)and(BDEQ.Owner=Self)then BDEQ.Free;
      BDEQ:=AValue;
      BDEQ.FreeNotification(self);
    end else //nil value
    begin
      if Assigned(BDEQ)and(BDEQ.Owner<>Self)then
      begin
        BDEQ.Name:='BDEQ'; //optional bit, but makes result much nicer
        BDEQ.SetSubComponent(True);
        BDEQ.FreeNotification(Self);

      end;
    end;
  end;
end;

function TSubsUsers.GetStat: TStatus;
begin
Result:=S5;
case StrToInt(user_stat) of
1: Result:=S1;
2: Result:=S2;
3: Result:=S3;
4: Result:=S4;
5: Result:=S5;
end;
end;

procedure TSubsUsers.SetRai(ARefreshValue: TRaion);
begin
case ARefreshValue of
R1: user_rai:='1';
R2: user_rai:='2';
R3: user_rai:='3';
R4: user_rai:='4';
R5: user_rai:='5';
R6: user_rai:='6';
R7: user_rai:='7';
R8: user_rai:='8';
end;
end;

procedure TSubsUsers.SetStat(ARefreshValue: TStatus);
begin
case ARefreshValue of
S1: user_stat:='1';
S2: user_stat:='2';
S3: user_stat:='3';
S4: user_stat:='4';
S5: user_stat:='5';
end;
end;

{������� ��������� ����������}
procedure TSubsUsers.GetUsers;
begin
  If Assigned(IBDataSet) then
  begin
    try    User_Name:=IBQ.Database.Params.Values['user_name']
    except User_Name:='SYSDBA' end;
    IBQ.Active:=False;
    IBQ.SQL.Text:='select * from s_user u, s_rayon r '+
                  'where(u.inp_us='''+user_name+''')and(u.rai=r.kod)';
    try IBQ.Active:=True except end;

    If(IBQ.Active=True)and(IBQ.RecordCount>0)then
    begin
      try user_rai:=   IBQ.FieldValues['rai']         except end;
      try user_stat:=  IBQ.FieldValues['stat']        except end;
      try user_0:=     IBQ.FieldValues['fio']         except end;
      try user_del:=GV(IBQ.FieldValues['del'])        except end;
      try user_vp:= GV(IBQ.FieldValues['vp'])         except end;
      try user_vip:=GV(IBQ.FieldValues['vip'])        except end;
      try user_history_mod:=GV(IBQ.FieldValues['his'])except end;
      try user_active:=GV(IBQ.FieldValues['vkl'])     except end;

      try Tel:= GetVNN(IBQ.FieldValues['Tel'])        except end;
      try Rayon:= IBQ.FieldValues['rayon']            except end;
      try Rayonu:=IBQ.FieldValues['rayonu']           except end;

      //��������� �� ���� ������ ������������� �� ������� �����
      IBQ.Active:=False;
      IBQ.SQL.Text:='select * from s_user where(rai='+user_rai+')or(stat=5)';
      IBQ.Active:=True;

      if not VarIsNull(IBQ.Lookup('stat', 3, 'fio'))
        then user_1:=IBQ.Lookup('stat', 3, 'fio')
        else user_1:='��������� ����������';
      if not VarIsNull(IBQ.Lookup('stat', 1, 'fio'))
        then user_2:=IBQ.Lookup('stat', 1, 'fio')
        else user_2:='������� ���������';
      if not VarIsNull(IBQ.Lookup('stat', 2, 'fio'))
        then user_3:=IBQ.Lookup('stat', 2, 'fio')
        else user_3:='��������� ������';
      user_get:=True;

      if Assigned(BDEDataSet) then
      begin
        //�������� �� ������� "S_USER" ������ �������
        BDEQ.Active:=False;
        BDEQ.close;
        BDEQ.SQL.Clear;
        BDEQ.SQL.Add('delete from s_user');
        try
          BDEQ.ExecSQL;
        except
          Default;
          user_get:=True;
          Exit;
        end;

        //���������� � ������� "S_USER" ����� �������
        IBQ.First;
        with IBQ do
        while not Eof do
        begin
          BDEQ.Active:=False;
          BDEQ.SQL.Clear;
          BDEQ.SQL.add('insert into s_user (inp_us, fio, rai, stat)values ('''+
          Trim(IBQ.FieldValues['inp_us'])+''', '''+
               IBQ.FieldValues['fio']+''', '+
          Trim(IBQ.FieldValues['rai'])+', '+
          Trim(IBQ.FieldValues['stat'])+')');
          BDEQ.ExecSQL;
          IBQ.Next;
        end;
        BDEQ.Active:=False;
      end;
    end else
      Default;
      user_get:=True;
  end else
    Default;
    user_get:=True;
end;

{���������� "��"/"���"}
function TSubsUsers.GV(ARefreshValue: Variant): Boolean;
var YesOrNo: String;
begin
  Result:=False;
  if not VarIsNull(ARefreshValue) then
  begin
    try YesOrNo:=ARefreshValue Except End;
    if  YesOrNo='��' then Result:=True;
  end;
end;

{ TSubsXLSReport }

constructor TSubsXLSReport.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  IBQ:=TIBQuery.Create(IBQ);
  PrBar:=TProgressBar.Create(PrBar);
  CaptionXLS:=TStringList.Create;
  CaptionXLSEnd:=TStringList.Create;
  Cptn:=TStringList.Create;
  ThreadXLS:=False;
  VisibleXLS:=True;
  ShwInf:=True;
  PageSetupXLS:=1;
  TFormat:=xlRangeAutoFormatClassic1;

  FCaptionXLS:=TFont.Create;
  FCaptionXLS.Size:=9;
  FCaptionXLS.Name:='Arial';
  FCaptionXLSEnd:=TFont.Create;
  FCaptionXLSEnd.Size:=9;
  FCaptionXLSEnd.Name:='Arial';
  FTextXLS:=TFont.Create;
  FTextXLS.Size:=10;
  FTextXLS.Name:='Arial';

  TmStart:=Now;
  TmEnd:=Now;
  TmDelta:=TmEnd-TmStart;
  ListsCountXLS:=0;

  SizeXLS:=60000;
  FMax:=0;
  FNom:=0;
end;

destructor TSubsXLSReport.Destroy;
begin
  IBQ:=Nil;  IBQ.Free;
  PrBar:=Nil;PrBar.Free;
  CaptionXLS.Free;
  CaptionXLSEnd.Free;
  FCaptionXLS.Free;
  FCaptionXLSEnd.Free;
  FTextXLS.Free;
  inherited;
end;

{������ � Caption}
procedure TSubsXLSReport.SetCaptionXLS(AValue: Tstrings);
begin
  if CaptionXLS.Text <> AValue.Text then
  begin
    CaptionXLS.BeginUpdate;
    try
      CaptionXLS.Assign(AValue);
    finally
      CaptionXLS.EndUpdate;
    end;
  end;
end;

{������ � CaptionEnd}
procedure TSubsXLSReport.SetCaptionXLSEnd(AValue: TStrings);
begin
  if CaptionXLSEnd.Text <> AValue.Text then
  begin
    CaptionXLSEnd.BeginUpdate;
    try
      CaptionXLSEnd.Assign(AValue);
    finally
      CaptionXLSEnd.EndUpdate;
    end;
  end;
end; 

{������ � FCaption}
procedure TSubsXLSReport.SetFCaptionXLS(AValue: TFont);
begin
  try FCaptionXLS.Assign(AValue) finally end;
end;

{������ � FCaptionEnd}
procedure TSubsXLSReport.SetFCaptionXLSEnd(AValue: TFont);
begin
  try FCaptionXLSEnd.Assign(AValue) finally end;
end;

{������ � FText}
procedure TSubsXLSReport.SetFTextXLS(AValue: TFont);
begin
  try FTextXLS.Assign(AValue) finally end;
end;

{������ � Size}
procedure TSubsXLSReport.SetSizeXLS(AValue: Integer);
begin
  SizeXLS:=AValue;
  If AValue<10    then SizeXLS:=10;
  if AValue>60000 then SizeXLS:=60000;
end;

{������ ���������� �����}
function TSubsXLSReport.GetPageSetupXLS: TPageSetup;
begin
Result:=Vertical;
case PageSetupXLS of
1: Result:=Vertical;
2: Result:=Horizontal;
end;
end;

{������ ���������� �����}
procedure TSubsXLSReport.SetPageSetupXLS(AValue: TPageSetup);
begin
PageSetupXLS:=1;
case AValue of
Vertical  : PageSetupXLS:=1;
Horizontal: PageSetupXLS:=2;
end;
end;

{������ ������}
procedure TSubsXLSReport.SetIBQ(AValue: TDataSet);
begin
  if AValue<>IBQ then
  begin
    if AValue<>nil then
    begin
      if Assigned(IBQ)and(IBQ.Owner=Self)then IBQ.Free;
      IBQ:=AValue;
      IBQ.FreeNotification(self);
    end else //nil value
    begin
      if Assigned(IBQ)and(IBQ.Owner<>Self)then
      begin      
        IBQ.Name:='IBQ'; //optional bit, but makes result much nicer
        IBQ.SetSubComponent(True);
        IBQ.FreeNotification(Self);
      end;
    end;
  end;
end;

{������ ProgressBar}
procedure TSubsXLSReport.SetPrBar(AValue: TProgressBar);
begin
  if AValue<>PrBar then
  begin
    if AValue<>nil then
    begin
      if Assigned(PrBar)and(PrBar.Owner=Self)then PrBar.Free;
      PrBar:=AValue;
      PrBar.FreeNotification(Self);
    end else //nil value
    begin
      if Assigned(PrBar)and(PrBar.Owner<>Self)then
      begin   
        PrBar.Name:='PrBar'; //optional bit, but makes result much nicer
        PrBar.SetSubComponent(True);
        PrBar.FreeNotification(Self);
      end;
    end;
  end;
end;

{�������� ��� �����������}
procedure TSubsXLSReport.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if(Operation=opRemove)and(AComponent=IBQ)then IBQ:=nil;
  if(Operation=opRemove)and(AComponent=PrBar)then PrBar:=nil;
end;

{������ TFormat}
function TSubsXLSReport.GetTFormat: TAFormat;
begin
Result:=xlClassic1;
Case TFormat of
  xlRangeAutoFormat3DEffects1:        Result:=xl3DEffects1;
  xlRangeAutoFormat3DEffects2:        Result:=xl3DEffects2;
  xlRangeAutoFormatAccounting1:       Result:=xlAccounting1;
  xlRangeAutoFormatAccounting2:       Result:=xlAccounting2;
  xlRangeAutoFormatAccounting3:       Result:=xlAccounting3;
  xlRangeAutoFormatAccounting4:       Result:=xlAccounting4;
  xlRangeAutoFormatClassic1:          Result:=xlClassic1;
  xlRangeAutoFormatClassic2:          Result:=xlClassic2;
  xlRangeAutoFormatClassic3:          Result:=xlClassic3;
  xlRangeAutoFormatClassicPivotTable: Result:=xlClassicPivotTable;
  xlRangeAutoFormatColor1:            Result:=xlColor1;
  xlRangeAutoFormatColor2:            Result:=xlColor2;
  xlRangeAutoFormatColor3:            Result:=xlColor3;
  xlRangeAutoFormatList1:             Result:=xlList1;
  xlRangeAutoFormatList2:             Result:=xlList2;
  xlRangeAutoFormatList3:             Result:=xlList3;
  xlRangeAutoFormatLocalFormat1:      Result:=xlLocalFormat1;
  xlRangeAutoFormatLocalFormat2:      Result:=xlLocalFormat2;
  xlRangeAutoFormatLocalFormat3:      Result:=xlLocalFormat3;
  xlRangeAutoFormatLocalFormat4:      Result:=xlLocalFormat4;
  xlRangeAutoFormatNone:              Result:=xlNone;
  xlRangeAutoFormatPTNone:            Result:=xlPTNone;
  xlRangeAutoFormatReport1:           Result:=xlReport1;
  xlRangeAutoFormatReport10:          Result:=xlReport10;
  xlRangeAutoFormatReport2:           Result:=xlReport2;
  xlRangeAutoFormatReport3:           Result:=xlReport3;
  xlRangeAutoFormatReport4:           Result:=xlReport4;
  xlRangeAutoFormatReport5:           Result:=xlReport5;
  xlRangeAutoFormatReport6:           Result:=xlReport6;
  xlRangeAutoFormatReport7:           Result:=xlReport7;
  xlRangeAutoFormatReport8:           Result:=xlReport8;
  xlRangeAutoFormatReport9:           Result:=xlReport9;
  xlRangeAutoFormatSimple:            Result:=xlSimple;
  xlRangeAutoFormatTable1:            Result:=xlTable1;
  xlRangeAutoFormatTable10:           Result:=xlTable10;
  xlRangeAutoFormatTable2:            Result:=xlTable2;
  xlRangeAutoFormatTable3:            Result:=xlTable3;
  xlRangeAutoFormatTable4:            Result:=xlTable4;
  xlRangeAutoFormatTable5:            Result:=xlTable5;
  xlRangeAutoFormatTable6:            Result:=xlTable6;
  xlRangeAutoFormatTable7:            Result:=xlTable7;
  xlRangeAutoFormatTable8:            Result:=xlTable8;
  xlRangeAutoFormatTable9:            Result:=xlTable9;
end;
end;

{������ � TFormat}
procedure TSubsXLSReport.SetTFormat(AValue: TAFormat);
begin
Case AValue of
  xl3DEffects1:       TFormat:=xlRangeAutoFormat3DEffects1;
  xl3DEffects2:       TFormat:=xlRangeAutoFormat3DEffects2;
  xlAccounting1:      TFormat:=xlRangeAutoFormatAccounting1;
  xlAccounting2:      TFormat:=xlRangeAutoFormatAccounting2;
  xlAccounting3:      TFormat:=xlRangeAutoFormatAccounting3;
  xlAccounting4:      TFormat:=xlRangeAutoFormatAccounting4;
  xlClassic1:         TFormat:=xlRangeAutoFormatClassic1;
  xlClassic2:         TFormat:=xlRangeAutoFormatClassic2;
  xlClassic3:         TFormat:=xlRangeAutoFormatClassic3;
  xlClassicPivotTable:TFormat:=xlRangeAutoFormatClassicPivotTable;
  xlColor1:           TFormat:=xlRangeAutoFormatColor1;
  xlColor2:           TFormat:=xlRangeAutoFormatColor2;
  xlColor3:           TFormat:=xlRangeAutoFormatColor3;
  xlList1:            TFormat:=xlRangeAutoFormatList1;
  xlList2:            TFormat:=xlRangeAutoFormatList2;
  xlList3:            TFormat:=xlRangeAutoFormatList3;
  xlLocalFormat1:     TFormat:=xlRangeAutoFormatLocalFormat1;
  xlLocalFormat2:     TFormat:=xlRangeAutoFormatLocalFormat2;
  xlLocalFormat3:     TFormat:=xlRangeAutoFormatLocalFormat3;
  xlLocalFormat4:     TFormat:=xlRangeAutoFormatLocalFormat4;
  xlNone:             TFormat:=xlRangeAutoFormatNone;
  xlPTNone:           TFormat:=xlRangeAutoFormatPTNone;
  xlReport1:          TFormat:=xlRangeAutoFormatReport1;
  xlReport10:         TFormat:=xlRangeAutoFormatReport10;
  xlReport2:          TFormat:=xlRangeAutoFormatReport2;
  xlReport3:          TFormat:=xlRangeAutoFormatReport3;
  xlReport4:          TFormat:=xlRangeAutoFormatReport4;
  xlReport5:          TFormat:=xlRangeAutoFormatReport5;
  xlReport6:          TFormat:=xlRangeAutoFormatReport6;
  xlReport7:          TFormat:=xlRangeAutoFormatReport7;
  xlReport8:          TFormat:=xlRangeAutoFormatReport8;
  xlReport9:          TFormat:=xlRangeAutoFormatReport9;
  xlSimple:           TFormat:=xlRangeAutoFormatSimple;
  xlTable1:           TFormat:=xlRangeAutoFormatTable1;
  xlTable10:          TFormat:=xlRangeAutoFormatTable10;
  xlTable2:           TFormat:=xlRangeAutoFormatTable2;
  xlTable3:           TFormat:=xlRangeAutoFormatTable3;
  xlTable4:           TFormat:=xlRangeAutoFormatTable4;
  xlTable5:           TFormat:=xlRangeAutoFormatTable5;
  xlTable6:           TFormat:=xlRangeAutoFormatTable6;
  xlTable7:           TFormat:=xlRangeAutoFormatTable7;
  xlTable8:           TFormat:=xlRangeAutoFormatTable8;
  xlTable9:           TFormat:=xlRangeAutoFormatTable9;
end;
end;

procedure TSubsXLSReport.Start;
var tms,t,Itog: String;
    i         : Integer;
begin
{���� ��� �����������}
if FNom>0 then Exit;
{���� Excel �� ���������� }
if IsExcelInstalled=False then
begin
  raise Exception.Create(
      '��� �������� ������ ��������� "Excel"!'+#13+#10+#13+#10+
      '[���������� "Excel" �� ������ "Microsoft Office XP" ��� �����]');
  Exit;
end;
{���� ������ ������}
TmStart:=Now;
FNom:=0;
FMax:=0;
TmEnd:=TmStart;
PrBar.Position:=FNom;
TmDelta:=TmEnd-TmStart;
ListsCountXLS:=0;
if not Assigned(DataSet) then Exit;
if(IBQ.Active=False)or(IBQ.RecordCount=0)then Exit;

{���� ������ �������!!!}
begin
  IBQ.Last;
  IBQ.First;
  PathXLS:=Trim(PathXLS);
  NameXLS:=Trim(NameXLS);

  {1.����������}
  if PathXLS='' then PathXLS:=GetWindowsTempPath;
  {2.��������}
  if NameXLS='' then
  begin
    {����������� �� ":" � �������� ������}
    t:='';
    tms:=TimeToStr(now);
    for i:=1 to length(tms) do
    if copy(tms,i,1)=':' then t:=t+'.' else t:=t+copy(tms,i,1);
    Name:='O_'+DateToStr(now)+'_'+t+'.XLS'
  end else
    Name:=NameXLS;
  {3.���������}
  Itog:='[����������� '+DateToStr(now)+'�. � '+TimeToStr(now)+
        ', ����� '+IntToStr(IBQ.RecordCount)+' ���.]';
  Cptn.Clear;
  if Trim(CaptionXLS.Text)=''
  then Cptn.Add('����� �� ����������� ���������� ������� �� ��')
  else Cptn.Assign(CaptionXLS);
  If ShwInf then Cptn.Add(Itog);
  {4.�������� ������ ������}
  if FileExists(PathXLS+Name)then
  begin
    Try
      DeleteFile(PathXLS+Name);
    except
    PrBar.Position:=0;
    ListsCountXLS:=0;
    FNom:=0;
    TmEnd:=TmStart;
    TmDelta:=TmEnd-TmStart;
    Exit;
    end;
  end;
  {5.������������}
  Excel(PathXLS+Name);
  {6.����������}
  FNom:=0;
  TmEnd:=Now;
  TmDelta:=TmEnd-TmStart;
  PrBar.Position:=FNom;
  if Assigned(OnReportCreateLoop) then FOnReportCreateLoop(self);
end;
end;

{���������� � �������}
procedure TSubsXLSReport.StartVA(VarArrayOfValues: Variant);
var tms,t,Itog: String;
    i         : Integer;
begin
{���� ��� �����������}
if FNom>0 then Exit;
{���� Excel �� ���������� }
if IsExcelInstalled=False then
begin
  raise Exception.Create(
      '��� �������� ������ ��������� "Excel"!'+#13+#10+#13+#10+
      '[���������� "Excel" �� ������ "Microsoft Office XP" ��� �����]');
  Exit;
end;
{���� ������ ������}
TmStart:=Now;
TmEnd:=TmStart;
TmDelta:=TmEnd-TmStart;
ListsCountXLS:=0;
If not VarIsArray(VarArrayOfValues) then Exit;

PathXLS:=Trim(PathXLS);
NameXLS:=Trim(NameXLS);

{1.����������}
if PathXLS='' then PathXLS:=GetWindowsTempPath;
{2.��������}
if NameXLS='' then
begin
  {����������� �� ":" � �������� ������}
  t:='';
  tms:=TimeToStr(now);
  for i:=1 to length(tms) do
  if copy(tms,i,1)=':' then t:=t+'.' else t:=t+copy(tms,i,1);
  Name:='O_'+DateToStr(now)+'_'+t+'.XLS'
end else
  Name:=NameXLS;
{3.���������}
Itog:='[����������� '+DateToStr(now)+'�. � '+TimeToStr(now)+
      ', �����, ������ � ����. �����, '+
      IntToStr(VarArrayHighBound(VarArrayOfValues,1)-VarArrayLowBound(VarArrayOfValues,1))+
      ' ���.]';
Cptn.Clear;
if Trim(CaptionXLS.Text)=''
then Cptn.Add('����� �� ����������� ���������� ������� �� ��')
else Cptn.Assign(CaptionXLS);
If ShwInf then Cptn.Add(Itog);
{4.�������� ������ ������}
if FileExists(PathXLS+Name)then
begin
  Try
    DeleteFile(PathXLS+Name);
  except
  TmEnd:=TmStart;
  TmDelta:=TmEnd-TmStart;
  Exit;
  end;
end;
  {5.������������}
  ExcelVA(PathXLS+Name,VarArrayOfValues);
  {6.����������}
  TmEnd:=Now;
  TmDelta:=TmEnd-TmStart;
  if Assigned(OnReportCreateLoop) then FOnReportCreateLoop(self);
end;

{���������� ����� EXCEL}
procedure TSubsXLSReport.Excel(Path: String);
var ExcelApp, Workbook, Range, Cell1, Cell2, ArrayData: Variant;
    BeginCol, BeginRow,j,i: integer;
    RowCount, ColCount, k : integer;
begin
  //�������� Excel
  ExcelApp:=CreateOleObject('Excel.Application');
  //��������� ������� Excel �� �������, ����� �������� ����� ����������
  ExcelApp.Application.EnableEvents:=false;
  Workbook:=ExcelApp.WorkBooks.Add;
  WorkBook.Worksheets[3].Delete;
  WorkBook.Worksheets[2].Delete;

  FMax:=IBQ.RecordCount;
  PrBar.Max:=FMax;
  //���������� ������ �������� ���� � �������, � ������� ����� �������� ������
  BeginCol:=1;
  BeginRow:=Cptn.Count+2;
  //������� ���������� ������� ������
  ColCount:=IBQ.FieldCount+1;
  //���-�� ������
  ListsCountXLS:=IBQ.RecordCount div SizeXLS+1;

  //��������� ������
  for k:=1 to ListsCountXLS do
  begin
    If k>1 then WorkBook.Worksheets.Add(EmptyParam,Workbook.Worksheets[k-1]);
    If k<>ListsCountXLS then RowCount:=SizeXLS+1
    else RowCount:=IBQ.RecordCount mod SizeXLS+1;

    //������� ���������� ������, ������� �������� ��������� �������
    ArrayData := VarArrayCreate([1, RowCount+1, 1, ColCount], varVariant);
    //��������� �����
    for i:=2 to ColCount do
      ArrayData[1, i]:=IBQ.FieldDefs.Items[i - 2].DisplayName;
    ArrayData[1, 1]:='�';
    for j:=2 to RowCount do
    begin
      for i:=2 to ColCount do
      begin
        ArrayData[j,i]:=
          IBQ.FieldbyName(IBQ.FieldDefs.Items[i - 2].DisplayName).value;
        if not VarIsNull(ArrayData[j,i])then ArrayData[j,i]:=Trim(ArrayData[j,i]);
      end;
      ArrayData[j,1]:=IBQ.RecNo;
      TmEnd:=Now;
      TmDelta:=TmEnd-TmStart;
      FNom:=IBQ.RecNo;
      if Assigned(ProgressBarSet)     then PrBar.Position:=FNom;
      if Assigned(OnReportCreateLoop) then FOnReportCreateLoop(self);
      IBQ.Next;
      //�������� �� �������
      if ThreadXLS=True then
      begin
        Application.ProcessMessages;
      end;
      if IBQ.Active=False then
      begin
        ExcelApp.ActiveWorkbook.SaveAs(Path);
        ExcelApp.ActiveWorkbook.Close;
        try DeleteFile(Path) except end;
        Exit;
      end;
    end;
    //�������� =================================================================
    If ShwInf then
    begin
      WorkBook.Worksheets[k].cells[1,1].value:=
        '�'+IntToStr(k)+'/'+IntToStr(ListsCountXLS);
      WorkBook.Worksheets[k].cells[1,1].Font.Size:=7;
    end;

    for i:=0 to Cptn.Count-1 do
    begin
      WorkBook.Worksheets[k].cells[i+1,2].value:=Cptn.Strings[i];
      WorkBook.Worksheets[k].cells[i+1,2].Font.Size:=FCaptionXLS.Size;
      WorkBook.Worksheets[k].cells[i+1,2].Font.Name:=FCaptionXLS.Name;
      WorkBook.Worksheets[k].cells[i+1,2].Font.Color:=FCaptionXLS.Color;
      WorkBook.Worksheets[k].cells[i+1,2].Font.Bold:=(fsBold in FCaptionXLS.Style);
      WorkBook.Worksheets[k].cells[i+1,2].Font.Italic:=(fsItalic in FCaptionXLS.Style);
      WorkBook.Worksheets[k].cells[i+1,2].Font.Underline:=(fsUnderline in FCaptionXLS.Style);
      WorkBook.Worksheets[k].cells[i+1,2].Font.Strikethrough:=(fsStrikeOut in FCaptionXLS.Style);
    end;
    for i:=0 to CaptionXLSEnd.Count-1 do
    begin
      WorkBook.Worksheets[k].cells[BeginRow+RowCount+i,2].value:=CaptionXLSEnd.Strings[i];
      WorkBook.Worksheets[k].cells[BeginRow+RowCount+i,2].Font.Size:=FCaptionXLSEnd.Size;
      WorkBook.Worksheets[k].cells[BeginRow+RowCount+i,2].Font.Name:=FCaptionXLSEnd.Name;
      WorkBook.Worksheets[k].cells[BeginRow+RowCount+i,2].Font.Color:=FCaptionXLSEnd.Color;
      WorkBook.Worksheets[k].cells[BeginRow+RowCount+i,2].Font.Bold:=(fsBold in FCaptionXLSEnd.Style);
      WorkBook.Worksheets[k].cells[BeginRow+RowCount+i,2].Font.Italic:=(fsItalic in FCaptionXLSEnd.Style);
      WorkBook.Worksheets[k].cells[BeginRow+RowCount+i,2].Font.Underline:=(fsUnderline in FCaptionXLSEnd.Style);
      WorkBook.Worksheets[k].cells[BeginRow+RowCount+i,2].Font.Strikethrough:=(fsStrikeOut in FCaptionXLSEnd.Style);
    end;
    //�������� �����
    WorkBook.Worksheets[k].Name:='����'+IntToStr(k);
    //���������� �����
    If PageSetupXLS=2 then
    WorkBook.WorkSheets[k].PageSetup.Orientation:=PageSetupXLS;
    //��������� �������� � ������� �����
    Cell1 := WorkBook.WorkSheets[k].Cells[BeginRow,BeginCol];
    Cell2 := WorkBook.WorkSheets[k].Cells[BeginRow+RowCount-1,BeginCol+ColCount-1];
    Range := WorkBook.WorkSheets[k].Range[Cell1, Cell2];
    Range.value:=ArrayData;

    Range.Font.Size:=FTextXLS.Size;
    Range.Font.Name:=FTextXLS.Name;
    Range.Font.Color:=FTextXLS.Color;
    Range.Font.Bold:=(fsBold in FTextXLS.Style);
    Range.Font.Italic:=(fsItalic in FTextXLS.Style);
    Range.Font.Underline:=(fsUnderline in FTextXLS.Style);
    Range.Font.Strikethrough:=(fsStrikeOut in FTextXLS.Style);
    //�������������� �������
    try    Range.AutoFormat(TFormat, EmptyParam,
             False, True, True, EmptyParam, EmptyParam)
    except Range.AutoFormat(xlRangeAutoFormatClassic1, EmptyParam,
             False, True, True, EmptyParam, EmptyParam)
    end;
    Range.Borders.LineStyle:=bsSingle;

    //������ ������� ��������� �����
    Cell1 := WorkBook.WorkSheets[k].Cells[BeginRow, BeginCol];
    Cell2 := WorkBook.WorkSheets[k].Cells[BeginRow, BeginCol+ColCount-1];
    Range := WorkBook.WorkSheets[k].Range[Cell1, Cell2];
    Range.Font.Bold := True;
  end;
  WorkBook.WorkSheets[1].Activate;

  //���������� ���������
  k:=-1;
  while k=-1 do
  begin
    try    k:=0; ExcelApp.ActiveWorkbook.SaveAs(Path);
    except k:=-1
    end;
    Path:=PathCopy(Path);
  end;
  //������ Excel �������t
  if VisibleXLS=True then ExcelApp.Visible:=True
                     else ExcelApp.ActiveWorkbook.Close;  
end;

{���������� ����� EXCEL ������� �� ������������� �������}
procedure TSubsXLSReport.ExcelVA(Path: String; ArrayData: Variant);
var ExcelApp, Workbook, Range, Cell1, Cell2 : Variant;
    BeginCol, BeginRow, RowCount, ColCount,i: integer;
begin
  //�������� Excel
  ExcelApp:=CreateOleObject('Excel.Application');
  //��������� ������� Excel �� �������, ����� �������� ����� ����������
  ExcelApp.Application.EnableEvents:=false;
  Workbook:=ExcelApp.WorkBooks.Add;
  WorkBook.Worksheets[3].Delete;
  WorkBook.Worksheets[2].Delete;

  //���������� ������ �������� ���� � �������, � ������� ����� �������� ������
  BeginCol:=1;
  BeginRow:=Cptn.Count+2;
  //������� ���������� ������� ������
  ColCount:=VarArrayHighBound(ArrayData,2)-VarArrayLowBound(ArrayData,2);
  RowCount:=VarArrayHighBound(ArrayData,1)-VarArrayLowBound(ArrayData,1);

  //�������� =================================================================
  If ShwInf then
  begin
    WorkBook.Worksheets[1].cells[1,1].value:='�1/1';
    WorkBook.Worksheets[1].cells[1,1].Font.Size:=7;
  end;

  for i:=0 to Cptn.Count-1 do
  begin
    WorkBook.Worksheets[1].cells[i+1,2].value:=Cptn.Strings[i];
    WorkBook.Worksheets[1].cells[i+1,2].Font.Size:=FCaptionXLS.Size;
    WorkBook.Worksheets[1].cells[i+1,2].Font.Name:=FCaptionXLS.Name;
    WorkBook.Worksheets[1].cells[i+1,2].Font.Color:=FCaptionXLS.Color;
    WorkBook.Worksheets[1].cells[i+1,2].Font.Bold:=(fsBold in FCaptionXLS.Style);
    WorkBook.Worksheets[1].cells[i+1,2].Font.Italic:=(fsItalic in FCaptionXLS.Style);
    WorkBook.Worksheets[1].cells[i+1,2].Font.Underline:=(fsUnderline in FCaptionXLS.Style);
    WorkBook.Worksheets[1].cells[i+1,2].Font.Strikethrough:=(fsStrikeOut in FCaptionXLS.Style);
  end;
  for i:=0 to CaptionXLSEnd.Count-1 do
  begin
    WorkBook.Worksheets[1].cells[BeginRow+RowCount+i,2].value:=CaptionXLSEnd.Strings[i];
    WorkBook.Worksheets[1].cells[BeginRow+RowCount+i,2].Font.Size:=FCaptionXLSEnd.Size;
    WorkBook.Worksheets[1].cells[BeginRow+RowCount+i,2].Font.Name:=FCaptionXLSEnd.Name;
    WorkBook.Worksheets[1].cells[BeginRow+RowCount+i,2].Font.Color:=FCaptionXLSEnd.Color;
    WorkBook.Worksheets[1].cells[BeginRow+RowCount+i,2].Font.Bold:=(fsBold in FCaptionXLSEnd.Style);
    WorkBook.Worksheets[1].cells[BeginRow+RowCount+i,2].Font.Italic:=(fsItalic in FCaptionXLSEnd.Style);
    WorkBook.Worksheets[1].cells[BeginRow+RowCount+i,2].Font.Underline:=(fsUnderline in FCaptionXLSEnd.Style);
    WorkBook.Worksheets[1].cells[BeginRow+RowCount+i,2].Font.Strikethrough:=(fsStrikeOut in FCaptionXLSEnd.Style);
  end;
  //���������� �����
  If PageSetupXLS=2 then
  WorkBook.WorkSheets[1].PageSetup.Orientation:=PageSetupXLS;
  //��������� �������� � ������� �����
  Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow,BeginCol];
  Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow+RowCount-1,BeginCol+ColCount];
  Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
  Range.value:=ArrayData;

  Range.Font.Size:=FTextXLS.Size;
  Range.Font.Name:=FTextXLS.Name;
  Range.Font.Color:=FTextXLS.Color;
  Range.Font.Bold:=(fsBold in FTextXLS.Style);
  Range.Font.Italic:=(fsItalic in FTextXLS.Style);
  Range.Font.Underline:=(fsUnderline in FTextXLS.Style);
  Range.Font.Strikethrough:=(fsStrikeOut in FTextXLS.Style);
  //�������������� �������
  try    Range.AutoFormat(TFormat, EmptyParam,
           False, True, True, EmptyParam, EmptyParam)
  except Range.AutoFormat(xlRangeAutoFormatClassic1, EmptyParam,
           False, True, True, EmptyParam, EmptyParam);
  end;
  Range.Borders.LineStyle:=bsSingle;
  //���������� ���������
  i:=-1;
  while i=-1 do
  begin
    try    i:=0; ExcelApp.ActiveWorkbook.SaveAs(Path);
    except i:=-1
    end;
    Path:=PathCopy(Path);
  end;
  //������ Excel �������t
  if VisibleXLS=True then ExcelApp.Visible:=True
                     else ExcelApp.ActiveWorkbook.Close;
end;

{��������� ������� � ���������:}
{������� "����� ����������"    }
function SelectDirectory(s: string='�������� �����!'):String;
var TitleName  : string;
    lpItemID   : PItemIDList;
    BrowseInfo : TBrowseInfo;
    DisplayName: array[0..MAX_PATH] of char;
    TempPath   : array[0..MAX_PATH] of char;
begin
  FillChar(BrowseInfo, sizeof(TBrowseInfo),#0);
  BrowseInfo.pszDisplayName := @DisplayName;
  TitleName:=s;
  BrowseInfo.lpszTitle := PChar(TitleName);
  BrowseInfo.ulFlags := BIF_RETURNONLYFSDIRS;
  lpItemID := SHBrowseForFolder(BrowseInfo);
  if lpItemId <> nil then
  begin
    SHGetPathFromIDList(lpItemID, TempPath);
    GlobalFreePtr(lpItemID);
    Result:=TempPath;
  end;
end;

{������� "����������� �����"}
function WindowsCopyFile(FromFile,ToDir: String): Boolean;
var
  F:TShFileOpStruct;
begin
  F.Wnd:= 0;
  F.wFunc:=FO_COPY;
  FromFile:=FromFile+#0;
  F.pFrom:=pchar(FromFile);
  ToDir:=ToDir+#0; F.pTo:=pchar(ToDir);
  F.fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION;
  Result:=ShFileOperation(F)=0;
end;

{������� "�������� ������ ���� � ������"}
function GetDBPath(AliasName: string): TFileName;
var 
  ParamList: TStringList;
  file_n   : TFileName;
begin
try
  ParamList:=TStringList.Create; 
  with Session do
  try
    GetAliasParams(AliasName, ParamList);
    file_n:=UpperCase(ParamList.Values['PATH']);
  finally
    Paramlist.Free;  
  end;
  if copy(file_n, length(file_n),1)='\'
  then Result:=file_n else Result:=file_n+'\';
except
  on E: EDBEngineError do Result:=''
end;
end;

{��������� "�������� ������"}
procedure SetDBPath(const AliasName, AliasType, AliasPath: String);
var
  SList     : TStrings;
  i         : Integer;
  AliasFound: Boolean;
begin
  {�������� ������������� ����� BDE}
  try
    SList := TStringList.Create;
    Session.GetAliasNames(SList);
    AliasFound := False;
    for i:=0 to SList.Count-1 do
      if SList[i]=AliasName then
        begin
          AliasFound := True;
          Break;
        end;
  finally
    SList.Free;
  end;
  if AliasFound then
    begin
      try
        SList := TStringList.Create;
        Session.GetAliasParams(AliasName,SList);
        {��������� �� ����� ����}
        if SList[0]<> 'PATH='+AliasPath then
          begin
            SList[0] := 'PATH='+AliasPath;
            Session.ModifyAlias(AliasName,SList);
          end;
      finally
        SList.Free;
      end;
    end
  else
    {������� ����� �����}
    Session.AddStandardAlias(AliasName,AliasPath,AliasType);
  Session.SaveConfigFile;
end;

{��������� "���������� �� ��. � ������ ��."}
procedure GetKV(Kv: string; Var Kv1, Kv2: String);
var a1,a3:integer;
label Mt;
begin
  a3 :=1;
  Kv :=Trim(Kv);//����������� �������
  Kv1:='';      //�������� ����� ��������
  Kv2:='';      //�������� ������ ��������
  for a1:=1 to length(Kv) do
  begin
    if a3=1 then
    //���� �����, �� ...
    if (copy(kv,a1,1)='0')or(copy(kv,a1,1)='1')or(copy(kv,a1,1)='2')
    or (copy(kv,a1,1)='3')or(copy(kv,a1,1)='4')or(copy(kv,a1,1)='5')
    or (copy(kv,a1,1)='6')or(copy(kv,a1,1)='7')or(copy(kv,a1,1)='8')
    or (copy(kv,a1,1)='9')then goto Mt;
    a3:=0;
    //���� �� �����������, �� ...
    if (copy(kv,a1,1)<>'\')and(copy(kv,a1,1)<>',')and(copy(kv,a1,1)<>'/')
    and(copy(kv,a1,1)<>' ')and(copy(kv,a1,1)<>'_')and(copy(kv,a1,1)<>'-')
    and(copy(kv,a1,1)<>'.')and(copy(kv,a1,1)<>':')and(copy(kv,a1,1)<>';')
    then
    begin
      kv2:=copy(kv,a1,1);
      Exit;
    end;
Mt: if a3=1 then kv1:=kv1+copy(kv,a1,1);
  end;
end;

{������� "����������� ���� � ����� "Temp""}
function GetWindowsTempPath: string;
var
  Buffer: array[0..1023] of Char;
begin
  SetString(Result,Buffer,GetTempPath(Sizeof(Buffer)-1,Buffer));  
end;

{������� "����������� ���� � ����� "Temp""}
function GetWindowsPath: string;
var B: PChar;
begin
  GetMem(B, MAX_PATH + 1);
  try
    GetWindowsDirectory(B, MAX_PATH);
    Result := B;
  finally
    FreeMem(B);
  end;
end;

{������ ��������� ������������ ��� �������� ����� ������ ����� ���        }
{������������ �������� ����������                                         }
procedure AdjustResolution(oForm:TForm; X: Integer=0; Y: Integer=0);
var
  iPercentage:integer;
begin
  if Screen.Width > 800 then
  begin
    y:=Screen.Height;
    x:=Screen.Width;
    //iPercentage:=Round(((Screen.Width-800)/800)*100)+100;
    iPercentage:=Round(((Screen.Height-600)/600)*100)+100;
    oForm.ScaleBy(iPercentage,100);
  end;
end;

{������ ��������� �������� ���������� ������}
procedure ChangeResolution(X,Y: word);
var
  dm: TDEVMODE;
begin
  ZeroMemory(@dm,sizeof(TDEVMODE));
  dm.dmSize:=sizeof(TDEVMODE);
  dm.dmDisplayFrequency:=85;
  dm.dmPelsWidth:=x;
  dm.dmPelsHeight:=y;
  dm.dmFields:=DM_PELSWIDTH or DM_PELSHEIGHT or DM_DISPLAYFREQUENCY;
  ChangeDisplaySettings(dm, 0);
end;

{������ ������� ��������� ���������� �� Word}
function IsWordInstalled: Boolean;
var Reg: TRegistry;
begin
  Reg:=TRegistry.Create;
  try
    Reg.RootKey:=HKEY_CLASSES_ROOT;
    Result:=Reg.KeyExists('Word.Application');
  finally
    Reg.Free;
  end;
end;

{������ ������� ��������� ���������� �� Excel}
function IsExcelInstalled: Boolean;
var Reg: TRegistry;
begin
  Reg:=TRegistry.Create;
  try
    Reg.RootKey := HKEY_CLASSES_ROOT;
    Result := Reg.KeyExists('Excel.Application');
  finally
    Reg.Free;
  end;
end;

{������ ������� ��������� ���������� �� BDE}
function IsBDEInstalled: Boolean;
begin
  Result:=(dbiInit(nil)=0)
end;

{������� "����� ���������"}
function PathCopy(Path: String): String;
var p1, p2, p3: string;
{��������}
const
    Cp='�����';
begin
  p1:=ExtractFilePath(Path);
  p2:=ExtractFileName(Path);
  p3:=ExtractFileExt(Path);
  Result:=p1+copy(p2,1,length(p2)-length(p3))+Cp+p3;
end;

{������� "GetValueNotNull"}
function GetVNN(VarOfField: Variant; Money :Boolean=False):String;
var Money_val: Real;
    Money_val_last: String;
begin
if VarIsNull(VarOfField) then
begin
  Result:='';
  exit;
end;
if Money=False then
  try
    Result:=VarOfField;
  except
    Result:=DateToStr(VarOfField);
  end
else
begin
  Money_val:=VarOfField+0.0001;
  Money_val_last:=floattostr(Money_val);
  Result:=copy(Money_val_last, 1, length(Money_val_last)-2)+'���.';
end;
end;


end.


