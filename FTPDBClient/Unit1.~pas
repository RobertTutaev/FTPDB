unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, Subs2, DB, IBCustomDataSet, IBQuery, Menus,
  ComCtrls, ExtCtrls, StdCtrls, INIFiles, Buttons;

type
  TUser=Record
    IDUser  : Integer;
    Host    : String;
    User    : String;
    Password: String;
  end;

type
  TFormMain = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheetFiles: TTabSheet;
    TabSheetLog: TTabSheet;
    Panel2: TPanel;
    SubsDBGridFiles: TSubsDBGrid;
    Panel3: TPanel;
    SubsDBGridLog: TSubsDBGrid;
    PanelFind: TPanel;
    Splitter1: TSplitter;
    ComboBoxSort: TComboBox;
    Label1: TLabel;
    Animate1: TAnimate;
    N7: TMenuItem;
    N8: TMenuItem;
    N10: TMenuItem;
    N4: TMenuItem;
    N09: TMenuItem;
    NModify: TMenuItem;
    N00: TMenuItem;
    N01: TMenuItem;
    N02: TMenuItem;
    N03: TMenuItem;
    N04: TMenuItem;
    N05: TMenuItem;
    N06: TMenuItem;
    N07: TMenuItem;
    N08: TMenuItem;
    N92: TMenuItem;
    N9: TMenuItem;
    N11: TMenuItem;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Panel5: TPanel;
    GroupBox2: TGroupBox;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    RadioButton8: TRadioButton;
    RadioButton9: TRadioButton;
    RadioButton10: TRadioButton;
    RadioButton11: TRadioButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Edit_s: TEdit;
    Edit_e: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Panel6: TPanel;
    GroupBox3: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure SubsDBGridFilesTitleClick(Column: TColumn);
    procedure SubsDBGridFilesColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure ComboBoxSortChange(Sender: TObject);
    procedure NModifyClick(Sender: TObject);
    procedure N00Click(Sender: TObject);
    procedure N01Click(Sender: TObject);
    procedure N02Click(Sender: TObject);
    procedure N03Click(Sender: TObject);
    procedure N04Click(Sender: TObject);
    procedure N05Click(Sender: TObject);
    procedure N06Click(Sender: TObject);
    procedure N07Click(Sender: TObject);
    procedure N08Click(Sender: TObject);
    procedure N92Click(Sender: TObject);
    procedure Edit_sEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f_ini      : TIniFile;
    ColumnMove : Boolean;
    Us         : TUser;
  end;

var
  FormMain: TFormMain;

implementation

uses Unit3, Unit2, IdFTPDBScan, IdTCPConnection, IdFTPScan, Unit4;

{$R *.dfm}

procedure TFormMain.N3Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFormMain.FormCreate(Sender: TObject);   
begin
  f_ini:=TIniFile.Create(Copy(Application.ExeName,1, length(Application.ExeName)-3)+'ini');

  SubsDBGridFiles.ReadIniFile(f_ini);
  SubsDBGridLog.ReadIniFile(f_ini);

  PageControl1.TabIndex:= f_ini.ReadInteger('Options', 'Page', 0);
  ComboBoxSort.ItemIndex:=f_ini.ReadInteger('Options', 'Sort', 0);
  PanelFind.Width:=       f_ini.ReadInteger('Options', 'Find', PanelFind.Width);

  ColumnMove:=False;
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin  
  SubsDBGridFiles.WriteIniFile(f_ini);
  SubsDBGridLog.WriteIniFile(f_ini);

  f_ini.WriteInteger('Options', 'Page', PageControl1.TabIndex);
  f_ini.WriteInteger('Options', 'Sort', ComboBoxSort.ItemIndex);
  f_ini.WriteInteger('Options', 'Find', PanelFind.Width);  

  f_ini.Free;
end;

procedure TFormMain.N7Click(Sender: TObject);
begin
try
  with FTPDB_GDB do
  begin
    if IBDatabase1.Connected=False then
    begin
      ShowMessage('Не выполнено подключение к БД!');
      Exit;
    end;

    Animate1.Active:=False;
    Animate1.CommonAVI:=aviFindFolder;
    with IdFTPDBScan1 do
    begin
      Animate1.Active:=True;
      Disconnect;
      IdUser:=Us.IDUser;
      LoadOptions;
      Connect;
      Scan;
      SetDirectoriesToIB;
      Disconnect;   
    end;

    IBQueryGet.Active:=False;
    IBQueryGet.SQL.Text
  end
finally
  Animate1.Active:=False;
  Animate1.CommonAVI:=aviNone;
end;
end;

procedure TFormMain.N8Click(Sender: TObject);
begin
  FormOptions.Visible:=True;
  FormMain.Enabled:=False;
end;

procedure TFormMain.N1Click(Sender: TObject);
Var Cn: Boolean;
begin
  Try
    Cn:=FTPDB_GDB.IBDatabase1.Connected;
    FTPDB_GDB.IBDatabase1.Connected:=not FTPDB_GDB.IBDatabase1.Connected;
  finally
    If(Cn=False)and(FTPDB_GDB.IBDatabase1.Connected=False)then
      ShowMessage('Неудалось подключится к серверу БД!');
  end;
end;

procedure TFormMain.SubsDBGridFilesTitleClick(Column: TColumn);
var
  Old: Integer;
  New: String;
begin
  if ColumnMove=False then
  begin
    New:=Column.FieldName;

    if New='Полный путь'         then ComboBoxSort.ItemIndex:=0;
    if New='Размер, Кб'          then ComboBoxSort.ItemIndex:=1;
    if(New='Дата')or(New='Время')then ComboBoxSort.ItemIndex:=2;
    if New='Файл'                then ComboBoxSort.ItemIndex:=3;

    if ComboBoxSort.ItemIndex<>Old then
    try
      ComboBoxSortChange(self);
    except
    end;  
  end;
  ColumnMove:=False;
end;

procedure TFormMain.SubsDBGridFilesColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
begin
  ColumnMove:=True;
end;

procedure TFormMain.ComboBoxSortChange(Sender: TObject);
begin
  Repaint;
  if FTPDB_GDB.IBDatabase1.Connected=False then Exit;
  try
    FTPDB_GDB.IBQuery1.Active:=False;
    FTPDB_GDB.IBQuery1.Active:=True;
  except
  end;
end;

procedure TFormMain.NModifyClick(Sender: TObject);
begin
  FormLogin.Visible:=True;
  FormMain.Enabled:=False;
end;

procedure TFormMain.N00Click(Sender: TObject);
begin FormLogin.SetP(Sender, 0); end;
procedure TFormMain.N01Click(Sender: TObject);
begin FormLogin.SetP(Sender, 1); end;
procedure TFormMain.N02Click(Sender: TObject);
begin FormLogin.SetP(Sender, 2); end;
procedure TFormMain.N03Click(Sender: TObject);
begin FormLogin.SetP(Sender, 3); end;
procedure TFormMain.N04Click(Sender: TObject);
begin FormLogin.SetP(Sender, 4); end;
procedure TFormMain.N05Click(Sender: TObject);
begin FormLogin.SetP(Sender, 5); end;
procedure TFormMain.N06Click(Sender: TObject);
begin FormLogin.SetP(Sender, 6); end;
procedure TFormMain.N07Click(Sender: TObject);
begin FormLogin.SetP(Sender, 7); end;
procedure TFormMain.N08Click(Sender: TObject);
begin FormLogin.SetP(Sender, 8); end;
procedure TFormMain.N92Click(Sender: TObject);
begin FormLogin.SetP(Sender, 9); end;

procedure TFormMain.Edit_sEnter(Sender: TObject);
begin
  Try StrToInt(Edit_e.Text)
  except Edit_e.Text:='0' end;
end;

end.
