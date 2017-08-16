unit FormFTPDBCP;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms, WinSvc,
  ComCtrls, StdCtrls, ExtCtrls, Buttons, Dialogs, Grids, ValEdit, Messages,
  ServiceManager, IdFTPFunctions, ShellAPI, HDDInfo, PCInfo, IpInfo, Crypt,
  IdSMTP, IdMessage, IdMessageClient, IdTCPClient, IdTCPConnection, IdComponent,
  FormMail, FormVKey, IdExplicitTLSClientServerBase, IdSMTPBase, IdBaseComponent,
  ExtDlgs, ShlObj;

const
   InputBoxMessage=WM_USER+200;
   CPLCaption='FTPDB Conrtol Panel';

type
  TValueListArray = array[1..4] of String;

type
  TFormFTPDBDaemon = class(TForm)
    OpenDialog1: TOpenDialog;
    Timer1: TTimer;
    Panel1: TPanel;
    BitBtnCancel: TBitBtn;
    BitBtnApply: TBitBtn;
    BitBtnSave: TBitBtn;
    BitBtnReload: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Image1: TImage;
    LabelStatus: TLabel;
    PanelDPLogin: TPanel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    EditLgn: TEdit;
    EditPsswrd: TEdit;
    PanelService: TPanel;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Labe5: TLabel;
    ComboBoxTpPr: TComboBox;
    ValueListEditorTm: TValueListEditor;
    ComboBoxStatus: TComboBox;
    PanelDBPath: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    SpeedButtonFind: TSpeedButton;
    Label2: TLabel;
    EditPth: TEdit;
    EditHst: TEdit;
    SpeedButton1: TSpeedButton;
    TabSheet3: TTabSheet;
    TabSheet2: TTabSheet;
    Image2: TImage;
    LabelStatus2: TLabel;
    Panel2: TPanel;
    GroupBox4: TGroupBox;
    Label10: TLabel;
    ComboBoxStatus2: TComboBox;
    LabelHTTP: TLabel;
    LabelURL: TLabel;
    Panel3: TPanel;
    GroupBox5: TGroupBox;
    EditFIO1: TEdit;
    EditFIO2: TEdit;
    EditFIO3: TEdit;
    MemoOrganization: TMemo;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    DateTimePickerDt: TDateTimePicker;
    LabelDataR: TLabel;
    Panel4: TPanel;
    GroupBox6: TGroupBox;
    IdSMTP1: TIdSMTP;
    Panel5: TPanel;
    GroupBox7: TGroupBox;
    Panel6: TPanel;
    GroupBox8: TGroupBox;
    SpeedButtonMail1: TSpeedButton;
    SpeedButtonMail2: TSpeedButton;
    SpeedButtonMail: TSpeedButton;
    SpeedButtonKey: TSpeedButton;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    SpeedButtonMail3: TSpeedButton;
    SaveTextFileDialog1: TSaveTextFileDialog;
    procedure SpeedButtonFindClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormSave(Sender: TObject);
    procedure FormLoad(Sender: TObject);
    procedure ConnectTestBefore(Sender: TObject);
    procedure ConnectTest(Sender: TObject);
    procedure ValueListEditorTmValidate(Sender: TObject; ACol,
      ARow: Integer; const KeyName, KeyValue: String);
    procedure FormDestroy(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ComboBoxStatusSelect(Sender: TObject);
    procedure BitBtnApplyClick(Sender: TObject);
    procedure ComboBoxStatus2Select(Sender: TObject);
    procedure LabelHTTPClick(Sender: TObject);
    procedure SpeedButtonMail1Click(Sender: TObject);
    procedure SpeedButtonMail2Click(Sender: TObject);
    procedure SpeedButtonMailClick(Sender: TObject);
    procedure SaveRMail(Sender: TObject);
    function GetBody(Sender: TObject;IsFile: Boolean=False): String;
    procedure SpeedButtonKeyClick(Sender: TObject);
    procedure FormKeyClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButtonMail3Click(Sender: TObject);
  private
    { Private declarations }
    SM   : TServiceManager;
    SM2  : TServiceManager;
    Opt  : TOpt;
    RMail: TRegMail;
    ValueListArray: TValueListArray;
    FormEmail: TFormEMail;
    FormKey: TFormKey;
    procedure InputBoxSetPasswordChar(var Msg: TMessage); message InputBoxMessage;
    procedure HelpShow(var Msg: TMessage); message WM_HELP;
  public
    { Public declarations }
    v:  Boolean;
    v2: Boolean;
  end;


implementation

uses DataModuleFTPDBDCP;

Const
  Mess1='FTPDBDaemonService: �� ������� ����������� � �������!';
  Mess2='FTPDBWeb: �� ������� ����������� � �������!';
  Mess3='������ ������ ����������!';

  Mess5='����������� � �� ������ �������!';
  Mess6='����������� � �� �� �������!';

  Mess7='������ �����!';

  Mess71='(����� �� ������ ���� ������ -1)';
  Mess72='(����� �� ������ ���� ������ 0)';
  Mess73='(�� �����, �� �����, ������� �����)';

  Mess81='����������:   ����������';
  Mess82='����������:   ���� (�������������)';
  Mess83='����������:   ��������� �� �����������';
  Mess84='����������:   ��������';
  Mess85='����������:   ������������� (�������������)';
  Mess86='����������:   ������������ (�������������)';
  Mess87='����������:   ������������';

  Mess9='������ ������� ����������.';
  Mess10='������ �� ������� ���������.'+#13#10+#13#10+'�������� ��������� ������:'+#13#10;

  HTTP='http://127.0.0.1';

{$R *.dfm}

procedure TFormFTPDBDaemon.SaveRMail(Sender: TObject);
begin
  with RMail do
  begin
    f1:=EditFIO1.Text;
    f2:=EditFIO2.Text;
    f3:=EditFIO3.Text;
    Dt:=DateTimePickerDt.Date;
    firm:=MemoOrganization.Text;
    FormEmail.GetUs(UsName, UsHost);
    UsPassword:=FormEmail.EditUsPassword.Text;
  end;

  SaveRegMail(RMail);  
end;

procedure TFormFTPDBDaemon.SpeedButtonFindClick(Sender: TObject);
begin
  OpenDialog1.InitialDir:=EditPth.Text;
  if OpenDialog1.Execute then EditPth.Text:=OpenDialog1.FileName;
end;

procedure TFormFTPDBDaemon.InputBoxSetPasswordChar(var Msg: TMessage);
var
  hInputForm, hEdit, hButton: HWND;
begin
  hInputForm := Screen.Forms[0].Handle;
  if (hInputForm <> 0) then
  begin
    hEdit := FindWindowEx(hInputForm, 0, 'TEdit', nil);
    {// Change button text:
    hButton := FindWindowEx(hInputForm, 0, 'TButton', nil);
    SendMessage(hButton, WM_SETTEXT, 0, Integer(PChar('Cancel')));}
    SendMessage(hEdit, EM_SETPASSWORDCHAR, Ord('*'), 0);
  end;
end;

procedure TFormFTPDBDaemon.SpeedButtonKeyClick(Sender: TObject);
begin
  FormKey.MemoKey.Text:=RMail.Key;
  FormKey.IsOk:=False;
  FormKey.Show;
end;

procedure TFormFTPDBDaemon.FormKeyClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormKey.IsOk then
  begin
    RMail.Key:=FormKey.MemoKey.Text;
    SaveReg(RMail);
  end;
end;

procedure TFormFTPDBDaemon.FormCreate(Sender: TObject);
begin
  FormEmail:=TFormEMail.Create(Self);
  FormKey:=TFormKey.Create(Self);
  FormKey.OnClose:=FormKeyClose;

  SM:=TServiceManager.Create;
  v:=False;
  if SM.Connect then
    if SM.OpenServiceConnection('FTPDBDaemonService') then v:=True;
  if v=False then ShowMessage(Mess1);

  SM2:=TServiceManager.Create;
  v2:=False;
  if SM2.Connect then
    if SM2.OpenServiceConnection('FTPDBWeb') then v2:=True;
  if v2=False then ShowMessage(Mess2);

  EditPsswrd.PasswordChar:='*'; 
  PageControl1.TabIndex:=0;
  FormLoad(Sender);
end;

procedure TFormFTPDBDaemon.FormLoad(Sender: TObject);
var v: Integer;
begin
  ValueListArray[1]:='10000';
  ValueListArray[2]:='300';
  ValueListArray[3]:='1000';
  ValueListArray[4]:='30';

  LoadRegMail(RMail);
  with RMail do
  begin
    EditFIO1.Text:=f1;
    EditFIO2.Text:=f2;
    EditFIO3.Text:=f3;
    DateTimePickerDt.Date:=Dt;
    MemoOrganization.Text:=firm;
    if(UsName<>'')or(UsHost<>'')
    then FormEmail.EditUsEmail.Text:=UsName+'@'+UsHost
    else FormEmail.EditUsEmail.Text:='';
    FormEmail.EditUsPassword.Text:=UsPassword;
    if IsRegister then Caption:=CPLCaption else Caption:=CPLCaption+' (Demo)';
  end;

  LoadOptions(Opt);     
  with Opt do
  begin
    EditLgn.Text:=Lgn;
    EditPsswrd.Text:=Psswrd;
    try ComboBoxTpPr.ItemIndex:=StrToInt(tpPr)
    except ShowMessage(Mess3) end;

    with ValueListEditorTm do
    begin
      If tryStrToInt(tmOut, v)
      then Cells[1,1]:=tmOut;

      If tryStrToInt(tmDelta, v)
      then Cells[1,2]:=tmDelta;

      If tryStrToInt(tmSleep, v)
      then Cells[1,3]:=tmSleep;

      If tryStrToInt(tmReCon, v)
      then Cells[1,4]:=tmReCon;   

      Timer1Timer(Sender);
    end;

    EditHst.Text:=Hst;
    EditPth.Text:=Pth;  
  end;
end;

procedure TFormFTPDBDaemon.FormSave(Sender: TObject);
begin
  with Opt do
  begin
    Lgn:=EditLgn.Text;
    Psswrd:=EditPsswrd.Text;
    tpPr:=IntToStr(ComboBoxTpPr.ItemIndex);
    with ValueListEditorTm do
    begin
      tmOut:=Cells[1,1];
      tmDelta:=Cells[1,2];
      tmSleep:=Cells[1,3];
      tmReCon:=Cells[1,4];
    end;
    Hst:=EditHst.Text;
    Pth:=EditPth.Text; 
  end;

  SaveOptions(Opt);
  SaveRMail(Sender);
end;

function TFormFTPDBDaemon.GetBody(Sender: TObject; IsFile: Boolean=False): String;
var Term: string;
const
  Term2='=====================================';
begin
  if IsFile then Term:=#13#10 else Term:=#14;
  Result:='Client Data '+Term;
  Result:=Result+'['+DateTimeToStr(Now)+']'+Term;
  Result:=Result+Term2+Term;
  Result:=Result+'Name='+EditFIO1.Text+' '+EditFIO2.Text+' '+EditFIO3.Text+';'+Term;
  Result:=Result+'D.o.b='+DateToStr(DateTimePickerDt.DateTime)+';'+Term;
  Result:=Result+'Organization='+MemoOrganization.Text+';'+Term;
  Result:=Result+GetOwnerAndCompanyName+';'+Term;
  Result:=Result+GetHardwareInfo+';'+Term;
  Result:=Result+'Value='+AllE(SNDA)+Term;
  Result:=Result+Term2+Term;
end;

procedure TFormFTPDBDaemon.HelpShow(var Msg: TMessage);
begin
  ShellExecute(Handle, nil, Pchar(ExtractFilePath(Opt.Pth)+'FTPDB.chm'), nil, nil, SW_SHOW);
end;

procedure TFormFTPDBDaemon.LabelHTTPClick(Sender: TObject);
var Port: String;
begin
  Try  
    DataModuleFTPDBDaemon:=TDataModuleFTPDBDaemon.Create(Self);
    LabelHTTP.Caption:=HTTP;
    ConnectTestBefore(Sender);
    with DataModuleFTPDBDaemon do
    begin
      try
        IBDatabase1.Connected:=True;
      except
        ShowMessage(Mess6);
        IBDatabase1.Connected:=False;
        Exit;
      end;

      try
        Port:=':'+IntToStr(IBTableOptions.FieldValues['Port']);
      except
        Port:='';
      end;
      IBDatabase1.Connected:=False;
      if LabelStatus2.Caption=Mess84 then
        ShellExecute(Handle, nil, Pchar(HTTP+Port), nil, nil, SW_SHOW);
    end;
    LabelHTTP.Caption:=HTTP+Port;
  Finally
    DataModuleFTPDBDaemon.Free;
  End;
end;

procedure TFormFTPDBDaemon.ConnectTestBefore(Sender: TObject);
begin
  with DataModuleFTPDBDaemon.IBDatabase1 do
  begin
    Connected:=False;
    Params.Clear;
    Params.Add('user_name='+EditLgn.Text);
    Params.Add('password='+EditPsswrd.Text);
    Params.Add('lc_ctype=WIN1251');
    DatabaseName:=EditHst.Text+ ':'+EditPth.Text;
    LoginPrompt:=False;
  end;
end;

procedure TFormFTPDBDaemon.ConnectTest(Sender: TObject);
begin
  ConnectTestBefore(Sender);
  with DataModuleFTPDBDaemon.IBDatabase1 do
  try
    Connected:=True;
    Connected:=False;
    ShowMessage(Mess5);
  except
    ShowMessage(Mess6);
    Connected:=False;
  end;
end;

procedure TFormFTPDBDaemon.ValueListEditorTmValidate(Sender: TObject; ACol,
  ARow: Integer; const KeyName, KeyValue: String);
var V   : Integer;
    Vld : Boolean;
begin
  Vld:=TryStrToInt(KeyValue,V);
  if Vld then
  begin
    if(ARow=1)and(v<-1)then
      ShowMessage(Mess7+#10#13+Mess71);
    if((ARow=2)or(ARow=3)or(ARow=4))and(v<0)then
      ShowMessage(Mess7+#10#13+Mess72);
  end else
  begin
    ShowMessage(Mess7+#10#13+Mess73);
  end;
  if(Vld=True)and not(((ARow=1)and(v<-1))or(((ARow=2)or(ARow=3)or(ARow=4))and(v<0)))
  then ValueListArray[ARow]:=KeyValue
  else ValueListEditorTm.Cells[ACol, ARow]:=ValueListArray[ARow];
end;

procedure TFormFTPDBDaemon.FormDestroy(Sender: TObject);
begin
  SaveRMail(Sender);
  FormEmail.Free;
  FormKey.Free;
  SM.Free;
  SM2.Free;
end;  

procedure TFormFTPDBDaemon.Timer1Timer(Sender: TObject);
begin
  LabelStatus.Caption:='';
  if v then
    Case SM.GetStatus of
    SERVICE_STOPPED:          LabelStatus.Caption:=Mess81;
    SERVICE_START_PENDING:    LabelStatus.Caption:=Mess82;
    SERVICE_STOP_PENDING:     LabelStatus.Caption:=Mess83;
    SERVICE_RUNNING:          LabelStatus.Caption:=Mess84;
    SERVICE_CONTINUE_PENDING: LabelStatus.Caption:=Mess85;
    SERVICE_PAUSE_PENDING:    LabelStatus.Caption:=Mess86;
    SERVICE_PAUSED:           LabelStatus.Caption:=Mess87;
    end;

  LabelStatus2.Caption:='';
  if v2 then
    Case SM2.GetStatus of
    SERVICE_STOPPED:          LabelStatus2.Caption:=Mess81;
    SERVICE_START_PENDING:    LabelStatus2.Caption:=Mess82;
    SERVICE_STOP_PENDING:     LabelStatus2.Caption:=Mess83;
    SERVICE_RUNNING:          LabelStatus2.Caption:=Mess84;
    SERVICE_CONTINUE_PENDING: LabelStatus2.Caption:=Mess85;
    SERVICE_PAUSE_PENDING:    LabelStatus2.Caption:=Mess86;
    SERVICE_PAUSED:           LabelStatus2.Caption:=Mess87;
    end;   
end;

procedure TFormFTPDBDaemon.SpeedButtonMail1Click(Sender: TObject);
var
  M: TIdMessage;
begin
  M:=TIdMessage.Create(self);

  SaveRMail(Sender);
  M.Body.Text:=GetBody(Sender);
  M.From.Text:=RMail.UsName+'@'+RMail.UsHost; //����������� - �� ����!!!
  M.Recipients.Add;
  M.Recipients.Items[0].Text:=
               RMail.FName+'@'+RMail.FHost;   //���������� - ����!!!
  M.Subject:=RMail.Subject;                   //���� ������
  IdSMTP1.AuthType:=satDefault;               //��� ������������
  IdSMTP1.Host:='smtp.'+RMail.UsHost;         //�������� ������ �������
  IdSMTP1.Port:=RMail.UsPortSMTP;             //���� ��������� ������� ������� (��� SMTP - 25)
  IdSMTP1.Username:=RMail.UsName;             //��� ������� �� ��� �������� �������
  IdSMTP1.Password:=RMail.UsPassword;;        //������ ������� �� ��� �������� �������

  try
    IdSMTP1.Connect();
    IdSMTP1.Send(M);
    MessageDlg(Mess9, mtInformation, [mbOK], 0);
  except
    On Exception do
      MessageDlg(Mess10+Exception(ExceptObject).Message, mtError, [mbOK], 0);
  End;
  If IdSMTP1.Connected then IdSMTP1.Disconnect;
  M.Free;
end;

procedure TFormFTPDBDaemon.SpeedButtonMail2Click(Sender: TObject);
begin
  SaveRMail(Sender);
  ShellExecute(Handle, 'open', PChar('mailto: '+RMail.FName+'@'+RMail.FHost+'&subject='+
    RMail.Subject+'&body='+GetBody(Sender)),
    nil, nil, SW_SHOWNORMAL);
end;

procedure TFormFTPDBDaemon.SpeedButtonMail3Click(Sender: TObject);
var F: TextFile;
    TempPath: array[0..MAX_PATH] of Char;
begin
  SaveRMail(Sender);
  try
    SHGetSpecialFolderPath(Handle, TempPath, CSIDL_PERSONAL, False);
    SaveTextFileDialog1.InitialDir:=TempPath;
  except
  end;

  if SaveTextFileDialog1.Execute  then
  begin
    AssignFile(F, SaveTextFileDialog1.FileName);
    Rewrite(F);
    Writeln(F, GetBody(Sender, True));
    CloseFile(F);
    ShellExecute(Handle, 'open', PChar(SaveTextFileDialog1.FileName),
      nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TFormFTPDBDaemon.SpeedButtonMailClick(Sender: TObject);
begin
  FormEmail.Show;
end;

procedure TFormFTPDBDaemon.ComboBoxStatus2Select(Sender: TObject);
begin
  Case ComboBoxStatus2.ItemIndex of
  0: begin
       Opt.StType2:='0';
       SaveOptions(Opt);
       SM2.StartService;
     end;
  1: begin
       Opt.StType2:='1';
       SaveOptions(Opt);
       SM2.StopService;
     end;
  2: begin
       SM2.StopService;
       Timer1Timer(Sender);
       while(SM2.GetStatus<>SERVICE_STOPPED)and
            (SM2.GetStatus in [SERVICE_START_PENDING,
                              SERVICE_STOP_PENDING,
                              SERVICE_RUNNING,
                              SERVICE_CONTINUE_PENDING,
                              SERVICE_PAUSE_PENDING,
                              SERVICE_PAUSED,
                              SERVICE_INACTIVE])do;
       Sleep(2000);                       
       SM2.StartService;
     end;
  end;
end;

procedure TFormFTPDBDaemon.ComboBoxStatusSelect(Sender: TObject);
begin
  Case ComboBoxStatus.ItemIndex of
  0: begin
       Opt.StType:='0';
       SaveOptions(Opt);
       SM.StartService;
     end;
  1: begin
       Opt.StType:='1';
       SaveOptions(Opt);
       SM.StopService;
     end;
  2: begin
       SM.StopService;
       Timer1Timer(Sender);
       while(SM.GetStatus<>SERVICE_STOPPED)and
            (SM.GetStatus in [SERVICE_START_PENDING,
                              SERVICE_STOP_PENDING,
                              SERVICE_RUNNING,
                              SERVICE_CONTINUE_PENDING,
                              SERVICE_PAUSE_PENDING,
                              SERVICE_PAUSED])do;
       SM.StartService;
     end;  
  end;
end;

procedure TFormFTPDBDaemon.BitBtnApplyClick(Sender: TObject);
begin
  FormSave(Sender);
  ComboBoxStatus.ItemIndex:=2;
  ComboBoxStatusSelect(Sender);
  ComboBoxStatus2.ItemIndex:=2;
  ComboBoxStatus2Select(Sender);
end;

end.
