unit Unit1;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, IWCompLabel,
  Controls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompEdit, IWCompRectangle, IWHTMLControls,
  IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWRegion,
  IWDBStdCtrls, UserSessionUnit, ServerController, Unit2, Unit5, IWCompListbox, Forms,
  IWExtCtrls, IWCompCheckbox;

type
  TIWFormLogin = class(TIWAppForm)
    IWRegion1: TIWRegion;
    IWEditUser: TIWEdit;
    IWEditPassword: TIWEdit;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    IWDBLookupComboBoxHost: TIWDBLookupComboBox;
    IWLabel4: TIWLabel;
    IWRegion2: TIWRegion;
    IWComboBoxNomer: TIWComboBox;
    IWLinkSave: TIWLink;
    IWLabel3: TIWLabel;
    IWEditPort: TIWEdit;
    IWLinkAdmin: TIWLink;
    IWImageButtonEnter: TIWImageButton;
    IWCheckBoxPassive: TIWCheckBox;
    IWLinkExit: TIWLink;
    IWLabelDemo: TIWLabel;
    procedure IWAppFormCreate(Sender: TObject);
    procedure CookiesLoad(Sender: TObject);
    procedure Start(Sender: TObject);
    procedure CookiesSave(Sender: TObject);
    procedure IWLinkAdminClick(Sender: TObject);

    function CheckPassive: String;
    procedure IWAppFormDestroy(Sender: TObject);
    procedure IWLinkExitClick(Sender: TObject);
  public
    FormMain: TIWFormMain;
    FormAdmin: TIWFormAdmin;
  end;

Const
  Mess11='������������ ������!';
  Mess12='������ ����������� ������� ���������!';
  Mess13='��������� ��������� � ������ ����-������!'+#13#10+#13#10+
         '������������ ���������� ������������� 1.'+#13#10+
         '����������� FTP-������/������������: ';

implementation

uses IWBaseForm, HTTPApp, LibraryWeb;

{$R *.dfm}

procedure TIWFormLogin.IWAppFormCreate(Sender: TObject);
begin
  FormMain:=TIWFormMain.Create(WebApplication);   
  Try    IWComboBoxNomer.ItemIndex:=StrToInt(WebApplication.Request.CookieFields.Values['Nm'])
  Except IWComboBoxNomer.ItemIndex:=0; end;
  CookiesLoad(Sender);
  IWLabelDemo.Visible:=not IWServerController.IsReg;
end;

procedure TIWFormLogin.IWAppFormDestroy(Sender: TObject);
begin
  FormMain.Release;
  if Assigned(FormAdmin) then
    FormAdmin.Release;
end;

procedure TIWFormLogin.IWLinkAdminClick(Sender: TObject);
begin
  if Not Assigned(FormAdmin) then
    FormAdmin:=TIWFormAdmin.Create(WebApplication);
  FormAdmin.Show;
end;

procedure TIWFormLogin.IWLinkExitClick(Sender: TObject);
begin
  WebApplication.TerminateAndRedirect(URLExit)
end;  

procedure TIWFormLogin.Start(Sender: TObject);
var v1,v2: String;
begin
  CookiesSet(WebApplication,'Nm',IntToStr(IWComboBoxNomer.ItemIndex));
  With UserSession.Us do
  begin
    Host:=IWDBLookupComboBoxHost.KeyValue;
    User:=LowerCase(IWEditUser.Text);
    Password:=LowerCase(IWEditPassword.Text);
    Port:=IWEditPort.Text;
    Passive:=CheckPassive;
  end;

  with FormMain do
  begin
    if UserSession.IsNotCorrect(v1,v2) then
    begin
      WebApplication.ShowMessage(Mess13+v1+'/'+v2);
      Exit;
    end;

    if UserSession.GETPASSWORD then
    begin
      try
        IWComboBoxSort.ItemIndex:=StrToInt(WebApplication.Request.CookieFields.Values['Sort']);
        IWDBLookupComboBoxRowLimit.KeyValue:=StrToInt(WebApplication.Request.CookieFields.Values['RowLimit']);

        IWRadioGroup1.ItemIndex:=StrToInt(WebApplication.Request.CookieFields.Values['FilterDate0']);
        IWEdit11.Text:=GetTextC(WebApplication.Request.CookieFields.Values['FilterDate1']);
        IWEdit12.Text:=GetTextC(WebApplication.Request.CookieFields.Values['FilterDate2']);

        IWRadioGroup2.ItemIndex:=StrToInt(WebApplication.Request.CookieFields.Values['FilterSize0']);
        IWEdit21.Text:=GetTextC(WebApplication.Request.CookieFields.Values['FilterSize1']);
        IWEdit22.Text:=GetTextC(WebApplication.Request.CookieFields.Values['FilterSize2']);

        IWRadioGroup3.ItemIndex:=StrToInt(WebApplication.Request.CookieFields.Values['FilterName0']);
        IWEdit31.Text:=GetTextC(WebApplication.Request.CookieFields.Values['FilterName1']);
      except
      end;

      Show;
      with UserSession do
      begin
        IdFTPDBScan1.Disconnect;
        IdFTPDBScan1.IdUser:=Us.IDUser;
        try
          IdFTPDBScan1.DIRS_IS_INSERT;
        except
          WebApplication.ShowMessage(Mess12);
        end;
      end;
      SetQueryFilesReal(Sender);
    end else
      WebApplication.ShowMessage(Mess11);
  end;
end;

function TIWFormLogin.CheckPassive: String;
begin
  Case IWCheckBoxPassive.Checked of
  True:  Result:='2';
  False: Result:='1';
  End;
end;

procedure TIWFormLogin.CookiesLoad(Sender: TObject);
var
  Val, SubVal: String;
  i: integer;
begin      
  Val:=GetTextC(WebApplication.Request.CookieFields.Values['UsNm'+IntToStr(IWComboBoxNomer.ItemIndex)]);
  i:=Pos(';',Val);
  SubVal:=Copy(Val, 0, i-1);
  Val:=Copy(Val, i+1, Length(Val));
  Try
    IWCheckBoxPassive.Checked:=False;
    if SubVal='2' then IWCheckBoxPassive.Checked:=True; Except end;
  i:=Pos(';',Val);
  SubVal:=Copy(Val, 0, i-1);
  Val:=Copy(Val, i+1, Length(Val));
  Try IWEditPort.Text:=SubVal;Except end;
  i:=Pos(';',Val);
  SubVal:=Copy(Val, 0, i-1);
  Val:=Copy(Val, i+1, Length(Val));
  Try IWDBLookupComboBoxHost.KeyValue:=SubVal;Except end;
  i:=Pos(';',Val);
  SubVal:=Copy(Val, 0, i-1);
  Val:=Copy(Val, i+1, Length(Val));
  Try IWEditUser.Text:=SubVal;Except end;
  i:=Pos(';',Val);
  SubVal:=Copy(Val, 0, i-1);
  Val:=Copy(Val, i+1, Length(Val));
  Try IWEditPassword.Text:=SubVal;Except end;
  If IWEditPort.Text='' then IWEditPort.Text:='21';  
end;

procedure TIWFormLogin.CookiesSave(Sender: TObject);
var N: string;
begin
  N:=IntToStr(IWComboBoxNomer.ItemIndex);
  CookiesSet(WebApplication,'Nm',N);
  CookiesSet(WebApplication,'UsNm'+N,
    CheckPassive+';'+
    GetText(IWEditPort.Text)+';'+
    IWDBLookupComboBoxHost.KeyValue+';'+
    GetText(LowerCase(IWEditUser.Text))+';'+
    GetText(LowerCase(IWEditPassword.Text))+';')
end;

initialization
  TIWFormLogin.SetAsMainForm;

end.
