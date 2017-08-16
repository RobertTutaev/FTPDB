unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Subs2, IdFTPFunctions;

Const
  pLabLeft=10;
  pLabTop=24;
  pLabColor=$00880202;
  pLeft=20;
  pTop=20;
  pDeltaHeight=10;
  pDeltaWidth=10;

type
  TArrLabel = array[0..CountEdit] of TLabel;

type
  TFormLogin = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    SelValue: Integer;
    ArrLabel: TArrLabel;
    ArrEdit : TArrEdit;  
  public
    { Public declarations }
    procedure SetP(Sender: TObject; Nom: Integer);
    procedure GetP(Sender: TObject);
    procedure GetMenu(Sender: TObject);    
  end;

var  
  FormLogin: TFormLogin;

implementation

uses Unit1, Types, VarUtils, Unit2, Math;

{$R *.dfm}

procedure TFormLogin.GetMenu(Sender: TObject);

  function getit(t1, t2: string): string;
  begin
    if(Trim(t1)='')or(Trim(t2)='')
    then Result:='......'
    else Result:=t1+'/'+t2;
  end;

var i: Integer;
begin
  for i:=0 to CountEdit do
    FormMain.MainMenu1.Items[1].Items[i].Caption:=
      IntToStr(i)+'  '+getit(ArrEdit[0, i].Text, ArrEdit[1, i].Text);
end;

procedure TFormLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GetMenu(Sender);
  SetP(Sender, SelValue); 
  FormMain.Enabled:=True;

  SaveOptionsClient(ArrEdit);
end;

procedure TFormLogin.FormCreate(Sender: TObject);
var i, j: Integer; 
begin
  for j:=0 to CountEdit do
    for i:=0 to 2 do
    begin
      ArrEdit[i,j]:=TEdit.Create(ArrEdit[i,j]);
      with ArrEdit[i,j] do
      begin
        Parent:=Panel1;
        Text:='';
        Left:=pLeft+i*Width+pDeltaWidth;
        Top:=pTop+j*Height+pDeltaHeight; 
        Visible:=True;
      end;
    end;

  for j:=0 to CountEdit do
  begin
    ArrLabel[j]:=TLabel.Create(ArrLabel[j]);
    ArrEdit[2,j].PasswordChar:='*';
    with ArrLabel[j] do
    begin
      Parent:=Panel1;
      Caption:=IntToStr(j);
      Left:=pLabLeft;
      Top:=pLabTop+j*ArrEdit[1,1].Height+pDeltaHeight;
      Font.Color:=pLabColor;
      Visible:=True;
    end;
  end;

  SelValue:=FormMain.f_ini.ReadInteger('Options', 'SelNomHost', 0);

  SetWindowsAlpha(Self.Handle, 220);
  LoadOptionsClient(ArrEdit);
  GetMenu(Sender);
  SetP(Sender, SelValue);
end;

procedure TFormLogin.FormDestroy(Sender: TObject);
var i, j: Integer;
begin
  for j:=0 to CountEdit do
    ArrLabel[j].Free;
  for j:=0 to CountEdit do
    for i:=0 to 2 do ArrEdit[i,j].Free;
end;

procedure TFormLogin.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFormLogin.SetP(Sender: TObject; Nom: Integer);
var i: integer;
begin
  for i:=0 to CountEdit do
    FormMain.MainMenu1.Items[1].Items[i].Checked:=False;

  if(Nom>=0)and(Nom<=CountEdit)then SelValue:=Nom else SelValue:=0;

  FormMain.MainMenu1.Items[1].Items[SelValue].Checked:=True;
  FormMain.f_ini.WriteInteger('Options', 'SelNomHost', SelValue);
  GetP(Sender);
end;

procedure TFormLogin.GetP(Sender: TObject);
begin
  with FormMain do
  begin
    Us.Host    :=ArrEdit[0, SelValue].Text;
    Us.User    :=ArrEdit[1, SelValue].Text;
    Us.Password:=ArrEdit[2, SelValue].Text;
    Us.IDUser  :=0;

    With FTPDB_GDB do
      if IBDatabase1.Connected then
      Try
        IBQueryGet.Active:=False;
        IBQueryGet.SQL.Text:='select kod from getlogin('''+
          Us.Host+''','''+Us.User+''')';
        IBQueryGet.Active:=True;
        Us.IDUser:=IBQueryGet.FieldValues['kod'];
        IBQueryGet.Active:=False;

        IBEvents1.UnRegisterEvents;
        IBEvents1.Events.Text:='END_SCAN1_'+Us.Host;
        IBEvents1.RegisterEvents;

        IBQuery1.Active:=False;
        IBQuery1.Active:=True;
        IBQuery2.Active:=False;
        IBQuery2.Active:=True;
      except
      end;
  end;
end;


end.
