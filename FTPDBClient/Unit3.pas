unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ComCtrls, IdFTPFunctions, Subs2,
  Mask, DBCtrls;

type
  TFormOptions = class(TForm)
    PageControl1: TPageControl;
    TabSheetDB: TTabSheet;
    PanelDPLogin: TPanel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    EditLgn: TEdit;
    EditPsswrd: TEdit;
    PanelDBPath: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    SpeedButtonFind: TSpeedButton;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    EditPth: TEdit;
    EditHst: TEdit;
    TabSheetFTP_HOST: TTabSheet;
    OpenDialog1: TOpenDialog;
    PanelFTP_HOST: TPanel;
    GroupBox3: TGroupBox;
    DBLookupComboBoxPASSIVE: TDBLookupComboBox;
    DBLookupComboBoxTRANSFERTYPE: TDBLookupComboBox;
    Label7: TLabel;
    Label12: TLabel;
    GroupBox4: TGroupBox;
    DBEditHOST: TDBEdit;
    DBEditPORT: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    TabSheetFTP_LOGIN: TTabSheet;
    PanelFTP_LOGIN: TPanel;
    GroupBox5: TGroupBox;
    DBEdit2LOGIN: TDBEdit;
    DBLookupComboBox2ACT: TDBLookupComboBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    GroupBox6: TGroupBox;
    DBEdit2PHOST: TDBEdit;
    DBEdit2PLOGIN: TDBEdit;
    DBEdit2PPASS: TDBEdit;
    DBEdit2PPORT: TDBEdit;
    DBEdit2READTIMEOUT: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBNavigatorFTP_LOGIN: TDBNavigator;
    DBNavigatorFTP_HOST: TDBNavigator;
    SpeedButton2Pass: TSpeedButton;
    DBEdit2PASS: TDBEdit;
    SpeedButton2PPass: TSpeedButton;
    SpeedButtonPass: TSpeedButton;
    SpeedButtonAdd: TSpeedButton;
    SpeedButton2Add: TSpeedButton;
    DBText2HOST: TDBText;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonFindClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure AddHost(Sender: TObject);
    procedure AddLogin(Sender: TObject);
    procedure SpeedButton2PassClick(Sender: TObject);
    procedure SpeedButton2PPassClick(Sender: TObject);
    procedure SpeedButtonPassClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Opt  : TOpt;
  end;

var
  FormOptions: TFormOptions;

implementation

uses Unit2, Unit1, IBDatabase, DB;

{$R *.dfm}

procedure TFormOptions.FormShow(Sender: TObject);
begin
  LoadOptions(Opt);
  with Opt do
  begin
    EditLgn.Text:=Lgn;
    EditPsswrd.Text:=Psswrd;
    EditHst.Text:=Hst;
    EditPth.Text:=Pth;
  end;

  SetWindowsAlpha(Self.Handle, 220);
  FormOptions.PageControl1.TabIndex:=FormMain.f_ini.ReadInteger('FormOptions', 'Page', 0);

  if FTPDB_GDB.IBDatabase1.Connected=False then
  with PageControl1 do
  begin
    TabIndex:=0;
    Pages[1].TabVisible:=False;
    Pages[2].TabVisible:=False;
  end else
  with PageControl1 do
  begin
    TabIndex:=0;
    Pages[1].TabVisible:=True;
    Pages[2].TabVisible:=True;
  end
end;

procedure TFormOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with Opt do
  begin
    Lgn:=EditLgn.Text;
    Psswrd:=EditPsswrd.Text;
    Hst:=EditHst.Text;
    Pth:=EditPth.Text;
  end;
  SaveOptions(Opt);

  FormMain.f_ini.WriteInteger('FormOptions', 'Page', FormOptions.PageControl1.TabIndex);
  FormMain.Enabled:=True;
end;

procedure TFormOptions.SpeedButton1Click(Sender: TObject);
var Res: Boolean;
begin
  with FTPDB_GDB.IBDatabase2 do
  begin
    Connected:=False;
    Params.Clear;
    Params.Add('user_name='+EditLgn.Text);
    Params.Add('password='+EditPsswrd.Text);
    Params.Add('lc_ctype=WIN1251');
    DatabaseName:=EditHst.Text+ ':'+EditPth.Text;
    LoginPrompt:=False;

    try Connected:=True;
    except end;
    Res:=Connected;
    Connected:=False;
    if Res
    then ShowMessage('Соединение прошло удачно!')
    else ShowMessage('Соединение не удалось!');
  end;
end;


procedure TFormOptions.SpeedButtonFindClick(Sender: TObject);
begin
  OpenDialog1.InitialDir:=EditPth.Text;
  if OpenDialog1.Execute then EditPth.Text:=OpenDialog1.FileName;
end;

procedure TFormOptions.BitBtn1Click(Sender: TObject);
var k1, k2: Integer;
begin
  with FTPDB_GDB do
  begin
    if IBDatabase1.Connected=False then Exit;
    if DBEdit2LOGIN.text='' then
    begin
      ShowMessage('Добавьте минимум одного пользователя для данного сервера!');
      Exit;
    end;

    k1:=IBTable3.FieldValues['kod'];
    k2:=IBTable8.FieldValues['kod'];

    IBTransaction2.Commit;

    IBTable3.Active:=True;
    IBTable4.Active:=True;
    IBTable5.Active:=True;
    IBTable6.Active:=True;
    IBTable7.Active:=True;
    IBTable8.Active:=True;
    IBTable3.Locate('kod',k1, []);
    IBTable8.Locate('kod',k2, []);     
  end;
end;

procedure TFormOptions.BitBtn2Click(Sender: TObject);
var k1, k2: Integer;
begin
  with FTPDB_GDB do
  begin
    if IBDatabase1.Connected=False then Exit;

    k1:=IBTable3.FieldValues['kod'];
    if DBEdit2LOGIN.text<>''
    then k2:=IBTable8.FieldValues['kod']
    else k2:=0;

    IBTransaction2.Rollback;

    IBTable3.Active:=True;
    IBTable4.Active:=True;
    IBTable5.Active:=True;
    IBTable6.Active:=True;
    IBTable7.Active:=True;
    IBTable8.Active:=True;
    IBTable3.Locate('kod',k1, []);
    IBTable8.Locate('kod',k2, []);
  end;
end;

procedure TFormOptions.AddHost(Sender: TObject);
var
  kod: Integer;
  Txt: String;
begin
  Txt:=InputBox('Добавление нового FTP-сервера', 'IP сервера:', '');
  if Txt='' then Exit;

  with  FTPDB_GDB.IBQueryGet do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Text:='select kod from gethost('''+Txt+''')';
    Active:=True;
    kod:=FieldValues['kod'];
    Active:=False;
  end;

  with FTPDB_GDB.DataSource3.DataSet do
  begin
    Active:=False;
    Active:=True;
    Locate('kod',kod, []);
  end;
end;

procedure TFormOptions.AddLogin(Sender: TObject);
var
  kod: Integer;
  Txt: String;
begin
  Txt:=InputBox('Новый пользователь '+DBEditHOST.Text, 'Логин:', '');
  if Txt='' then Exit;

  with  FTPDB_GDB.IBQueryGet do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Text:='select kod from getlogin('''+DBEditHOST.Text+
              ''', '''+Txt+''')';
    Active:=True;
    kod:=FieldValues['kod'];
    Active:=False;
  end;

  with FTPDB_GDB.DataSource8.DataSet do
  begin
    Active:=False;
    Active:=True;
    Locate('kod',kod, []);
  end;
end;

procedure TFormOptions.SpeedButton2PassClick(Sender: TObject);
var Txt: String;
begin
  Txt:=InputBox('Ввод пароля', 'Пароль:', '');
  if Txt<>'' then
  begin
    DBEdit2PASS.DataSource.DataSet.Edit;
    DBEdit2PASS.Text:=CoDecModify(Txt, False);
  end;
end;

procedure TFormOptions.SpeedButton2PPassClick(Sender: TObject);
var Txt: String;
begin
  Txt:=InputBox('Ввод пароля', 'Пароль:', '');
  if Txt<>'' then
  begin
    DBEdit2PPASS.DataSource.DataSet.Edit;
    DBEdit2PPASS.Text:=CoDecModify(Txt, False);
  end;
end;

procedure TFormOptions.SpeedButtonPassClick(Sender: TObject);
var Txt: String;
begin
  Txt:=InputBox('Ввод пароля', 'Пароль:', '');
  if Txt<>'' then EditPsswrd.Text:=CoDecModify(Txt, False);
end;

end.
