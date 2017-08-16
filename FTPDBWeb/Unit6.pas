unit Unit6;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWHTMLControls,
  Controls, Forms, IWVCLBaseContainer, IWContainer, IWRegion,
  IWCompButton, ServerController, IWCompCheckbox, IWCompEdit, IWCompLabel,
  IWDBStdCtrls, IWHTMLContainer, IWGrids, IWDBGrids, Unit8,
  IWCompTabControl, IWExtCtrls, IWCompRectangle, IWCompListbox;

type
  TIWFormOptions = class(TIWAppForm)
    IWRegionOpt2: TIWRegion;
    IWLabel8: TIWLabel;
    IWRegion22: TIWRegion;
    IWDBGrid2: TIWDBGrid;
    IWDBNavigator2: TIWDBNavigator;
    IWRegion8: TIWRegion;
    IWDBEditLOGIN: TIWDBEdit;
    IWDBEditPASS: TIWDBEdit;
    IWDBCheckBoxACT: TIWDBCheckBox;
    IWLabel14: TIWLabel;
    IWLabel15: TIWLabel;
    IWRegion9: TIWRegion;
    IWDBEditPHOST: TIWDBEdit;
    IWDBEditPPASS: TIWDBEdit;
    IWDBEdit5: TIWDBEdit;
    IWDBEditPLOGIN: TIWDBEdit;
    IWDBEditREADTIMEOUT: TIWDBEdit;
    IWLabel16: TIWLabel;
    IWLabel17: TIWLabel;
    IWLabel18: TIWLabel;
    IWLabel19: TIWLabel;
    IWLabel20: TIWLabel;
    IWLabel21: TIWLabel;
    IWRegion14: TIWRegion;
    IWRegion21: TIWRegion;
    IWDBNavigator1: TIWDBNavigator;
    IWDBGrid1: TIWDBGrid;
    IWDBLabelHKod: TIWDBLabel;
    IWLabel10: TIWLabel;
    IWRegion7: TIWRegion;
    IWDBEditHost: TIWDBEdit;
    IWDBEditPort: TIWDBEdit;
    IWDBCheckBoxPassive: TIWDBCheckBox;
    IWLabel11: TIWLabel;
    IWLabel12: TIWLabel;
    IWRegion23: TIWRegion;
    IWDBGrid3: TIWDBGrid;
    IWDBNavigator3: TIWDBNavigator;
    IWDBLabel2: TIWDBLabel;
    IWLabel24: TIWLabel;
    IWRegion12: TIWRegion;
    IWDBEditAALL: TIWDBEdit;
    IWLabel23: TIWLabel;
    IWLinkScan: TIWLink;
    IWDBLabel1: TIWDBLabel;
    IWLabel22: TIWLabel;
    IWLabel25: TIWLabel;
    IWLabel26: TIWLabel;
    IWLabel27: TIWLabel;
    IWRegionApply: TIWRegion;
    IWImageButtonApply: TIWImageButton;
    IWImageButtonCancel: TIWImageButton;
    IWDBLookupComboBoxPROXYTYPE: TIWDBLookupComboBox;
    IWDBLookupComboBoxTRANSFERTYPE: TIWDBLookupComboBox;
    IWLabel13: TIWLabel;
    IWRectangle2: TIWRectangle;
    IWRectangle1: TIWRectangle;
    IWRegion3: TIWRegion;
    IWRegion10: TIWRegion;
    IWDBEditWebLOGIN: TIWDBEdit;
    IWDBEditWebPASS: TIWDBEdit;
    IWDBCheckBoxLAI: TIWDBCheckBox;
    IWDBCheckBoxDAI: TIWDBCheckBox;
    IWDBEditSRTO: TIWDBEdit;
    IWDBEditSTO: TIWDBEdit;
    IWLabel1: TIWLabel;
    IWLabel2: TIWLabel;
    IWLabel5: TIWLabel;
    IWLabel6: TIWLabel;
    IWDBEditLRL: TIWDBEdit;
    IWLabel3: TIWLabel;
    IWDBEditWebPORT: TIWDBEdit;
    IWLabel4: TIWLabel;
    IWLabel7: TIWLabel;
    IWDBCheckBoxRSN: TIWDBCheckBox;
    IWLabel28: TIWLabel;
    IWDBLookupComboBoxROWLIMIT: TIWDBLookupComboBox;
    IWRegion2: TIWRegion;
    IWLabel9: TIWLabel;
    IWRegion1: TIWRegion;
    IWLink1: TIWLink;
    IWImageButtonBackup: TIWImageButton;
    IWRegion13: TIWRegion;
    IWImageFile1: TIWImageFile;
    IWImageButtonScRestart: TIWImageButton;
    IWImageButtonScStart: TIWImageButton;
    IWImageButtonScStop: TIWImageButton;
    IWImageButtonSessions: TIWImageButton;
    IWLabelSessions: TIWLabel;
    IWImageButtonSynchr: TIWImageButton;
    procedure IWLink1Click(Sender: TObject);
    procedure IWImageButtonApplyClick(Sender: TObject);
    procedure IWDBGrid1Columns0Click(ASender: TObject; const AValue: string);
    procedure IWDBGrid2Columns0Click(ASender: TObject; const AValue: string);
    procedure IWLinkScanClick(Sender: TObject);
    procedure IWDBGrid3Columns0Click(ASender: TObject; const AValue: string);
    procedure IWDBLookupComboBoxPROXYTYPEChange(Sender: TObject);
    procedure IWDBLookupComboBoxTRANSFERTYPEChange(Sender: TObject);
    procedure IWDBLookupComboBoxROWLIMITChange(Sender: TObject);
    procedure IWButtonSessionsClick(Sender: TObject);
    procedure IWButtonScRestartClick(Sender: TObject);
    procedure IWButtonScStartClick(Sender: TObject);
    procedure IWButtonScStopClick(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWAppFormDestroy(Sender: TObject);
    procedure IWImageButtonSynchrClick(Sender: TObject);
  public
    FormSNHR: TIWFormSNHR;
  end;

Const
  Mess61='����������� ����������� � ��!';
  Mess62='�� ������� ������������ � FTP-�������!';
  IWButtonSessionsCaption='Sessions:  ';

implementation

uses IWBaseForm, DB, UserSessionUnit;

{$R *.dfm}

procedure TIWFormOptions.IWImageButtonApplyClick(Sender: TObject);
begin  
  Try
    UserSession.IBTableOptions.Edit;
    UserSession.IBTableOptions.Post;
    UserSession.IBTransaction1.CommitRetaining;
  Except
    try
      UserSession.IBTableOptions.Active:=False;
      UserSession.IBTableOptions.Active:=True;
    finally
    end;
  End;
  if UserSession.IBTableOptions.Modified=False then UserSession.IBTableOptions.Edit;
end;

procedure TIWFormOptions.IWImageButtonSynchrClick(Sender: TObject);
begin
  try
    UserSession.IBTableDIRS_HOST.Active:=False;
    UserSession.IBTableDIRS_HOST.Active:=True;
  Finally
    FormSNHR.Show;
  end;
end;

procedure TIWFormOptions.IWAppFormCreate(Sender: TObject);
begin
  FormSNHR:=TIWFormSNHR.Create(WebApplication);
end;

procedure TIWFormOptions.IWAppFormDestroy(Sender: TObject);
begin
  FormSNHR.Release;
end;

procedure TIWFormOptions.IWButtonScRestartClick(Sender: TObject);
begin UserSession.FScanRestart; end;

procedure TIWFormOptions.IWButtonScStartClick(Sender: TObject);
begin UserSession.FScanStart; end;

procedure TIWFormOptions.IWButtonScStopClick(Sender: TObject);
begin UserSession.FScanStop; end;   

procedure TIWFormOptions.IWButtonSessionsClick(Sender: TObject);
begin
  IWLabelSessions.Caption:=
    IWButtonSessionsCaption+IntToStr(IWServerController.count_sessions);
end;

procedure TIWFormOptions.IWDBGrid1Columns0Click(ASender: TObject;
  const AValue: string);
begin
  UserSession.IBTableFTP_HOST.Locate('KOD', AValue, []);
end;

procedure TIWFormOptions.IWDBGrid2Columns0Click(ASender: TObject;
  const AValue: string);
begin
  UserSession.EditFTP_HOST(UserSession.IBTableFTP_LOGIN);
  UserSession.IBTableFTP_LOGIN.Locate('KOD', AValue, []);
end;

procedure TIWFormOptions.IWDBGrid3Columns0Click(ASender: TObject;
  const AValue: string);
begin
  UserSession.EditFTP_LOGIN(UserSession.IBTableFTP_DIRS);
  UserSession.IBTableFTP_DIRS.Locate('KOD', AValue, []);
end;

procedure TIWFormOptions.IWDBLookupComboBoxPROXYTYPEChange(Sender: TObject);
begin
  UserSession.IBTableS_PROXYTYPE.Locate('kod', IWDBLookupComboBoxPROXYTYPE.KeyValue, []);
end;

procedure TIWFormOptions.IWDBLookupComboBoxROWLIMITChange(Sender: TObject);
begin
  UserSession.IBTableS_ROWLIMIT.Locate('kod', IWDBLookupComboBoxROWLIMIT.KeyValue, []);  
end;

procedure TIWFormOptions.IWDBLookupComboBoxTRANSFERTYPEChange(Sender: TObject);
begin
  UserSession.IBTableS_TRANSFERTYPE.Locate('kod', IWDBLookupComboBoxTRANSFERTYPE.KeyValue, []);
end;

procedure TIWFormOptions.IWLink1Click(Sender: TObject);
begin
  With UserSession do
  begin
    IBTableOptions.Active:=False;  
    IBTableFTP_HOST.Active:=True;
    IBTableHost.Active:=False;
    IBTableHost.Active:=True;
  end;
  Hide;
end;

procedure TIWFormOptions.IWLinkScanClick(Sender: TObject);
begin
  with UserSession do
  begin
    if IBDatabase1.Connected=False then
    begin
      WebApplication.ShowMessage(Mess61);
      Exit;
    end;

    with IdFTPDBScan1 do
    begin
      Disconnect;
      try
        IdUser:=IBTableFTP_LOGIN.FieldValues['kod'];
        LoadOptions;
        Connect;
      except
        WebApplication.ShowMessage(Mess62);
        Exit;
      end;
      Scan;
      SetDirectoriesToIB;
      Disconnect;
    end;
  end;
end;

end.
