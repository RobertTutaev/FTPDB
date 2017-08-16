unit Unit5;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, ServerController,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWHTMLControls,
  Controls, Forms, IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWRegion,
  IWCompLabel, IWCompButton, IWCompEdit, LibraryWeb, Unit6, IWExtCtrls;

type
  TIWFormAdmin = class(TIWAppForm)
    IWRegion1: TIWRegion;
    IWLink1: TIWLink;
    IWRegion2: TIWRegion;
    IWEditUser: TIWEdit;
    IWEditPassword: TIWEdit;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    IWLinkSave: TIWLink;
    IWImageButton1: TIWImageButton;
    IWImageButtonBackup: TIWImageButton;
    procedure IWLink1Click(Sender: TObject);
    procedure IWLinkSaveClick(Sender: TObject);
    procedure IWButtonEnterClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormDestroy(Sender: TObject);
  public
    FormOptions: TIWFormOptions;
  end;

Const
  Mess51='������ ��������!';
  ST=3000;

implementation

uses IWFormDsn, IWBaseForm, UserSessionUnit;

{$R *.dfm}

procedure TIWFormAdmin.IWAppFormCreate(Sender: TObject);
var
  Val, SubVal: String;
  i: integer;
begin
  FormOptions:=TIWFormOptions.Create(WebApplication);  

  Val:=GetTextC(WebApplication.Request.CookieFields.Values['UsAdm']);
  i:=Pos(';',Val);
  SubVal:=Copy(Val, 0, i-1);
  Val:=Copy(Val, i+1, Length(Val));
  Try IWEditUser.Text:=SubVal;Except end;
  i:=Pos(';',Val);
  SubVal:=Copy(Val, 0, i-1);
  Val:=Copy(Val, i+1, Length(Val));
  Try IWEditPassword.Text:=SubVal;Except end;
end;

procedure TIWFormAdmin.IWAppFormDestroy(Sender: TObject);
begin
  FormOptions.Release;  
end;

procedure TIWFormAdmin.IWButtonEnterClick(Sender: TObject);
begin
  try
    UserSession.IBTableOptions.Active:=False;
    UserSession.IBTableOptions.Active:=True;

    if(Trim(IWEditUser.Text)=Trim(UserSession.IBTableOptions.FieldValues['LOGIN']))and
      (Trim(IWEditPassword.Text)=Trim(UserSession.IBTableOptions.FieldValues['PASS']))then
    begin
      UserSession.IBTableFTP_HOST.Active:=True;      
      FormOptions.Show;
      Hide;
      Exit;
    end;
  except
  end;
  Sleep(ST);
  WebApplication.ShowMessage(Mess51);
  UserSession.IBTableOptions.Active:=False;
end;

procedure TIWFormAdmin.IWLink1Click(Sender: TObject);
begin
  Hide;
end;

procedure TIWFormAdmin.IWLinkSaveClick(Sender: TObject);
begin
  CookiesSet(WebApplication,'UsAdm',
    GetText(LowerCase(IWEditUser.Text))+';'+
    GetText(LowerCase(IWEditPassword.Text))+';');
end;

end.
