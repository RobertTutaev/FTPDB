unit Unit8;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes,
  IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWHTMLControls,
  Controls, Forms, IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWRegion,
  IWCompEdit, IWDBStdCtrls, IWCompLabel, IWGrids, IWDBGrids, IWCompListbox,
  IWCompCheckbox, IWExtCtrls, ServerController, IWCompRectangle;

type
  TIWFormSNHR = class(TIWAppForm)
    IWRegion1: TIWRegion;
    IWLink1: TIWLink;
    IWRegion23: TIWRegion;
    IWDBGrid4: TIWDBGrid;
    IWDBNavigator3: TIWDBNavigator;
    IWDBLabel2: TIWDBLabel;
    IWLabel24: TIWLabel;
    IWRegion12: TIWRegion;
    IWDBEditAPATH: TIWDBEdit;
    IWLabel23: TIWLabel;
    IWDBEditLPATH: TIWDBEdit;
    IWDBCheckBoxDIRECTION: TIWDBCheckBox;
    IWLabel1: TIWLabel;
    IWRegionApply: TIWRegion;
    IWImageButtonApply: TIWImageButton;
    IWImageButtonCancel: TIWImageButton;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    IWDBGrid1: TIWDBGrid;
    IWImageButtonBackup: TIWImageButton;
    IWDBLookupComboBoxPARAMS: TIWDBLookupComboBox;
    IWRegion2: TIWRegion;
    IWLabel9: TIWLabel;
    procedure IWLink1Click(Sender: TObject);
    procedure IWImageButtonApplyClick(Sender: TObject);
    procedure IWImageButtonCancelClick(Sender: TObject);
    procedure IWDBGrid1Columns0Click(ASender: TObject; const AValue: string);
    procedure IWDBGrid4Columns0Click(ASender: TObject; const AValue: string);
    procedure IWDBLookupComboBoxPARAMSChange(Sender: TObject);
  public
  end;

implementation

{$R *.dfm}


procedure TIWFormSNHR.IWDBGrid1Columns0Click(ASender: TObject;
  const AValue: string);
begin
  UserSession.IBTableDIRS_HOST.Locate('KOD', AValue, []);
end;

procedure TIWFormSNHR.IWDBGrid4Columns0Click(ASender: TObject;
  const AValue: string);
begin
  if UserSession.IBTableDIRS_HOST.Modified=False then UserSession.IBTableDIRS_HOST.Edit;
  UserSession.IBTableDIRS_SNHR.Locate('KOD', AValue, []);
end;

procedure TIWFormSNHR.IWDBLookupComboBoxPARAMSChange(Sender: TObject);
begin
  UserSession.IBTableS_PARAMS.Locate('kod', IWDBLookupComboBoxPARAMS.KeyValue, []);
end;

procedure TIWFormSNHR.IWImageButtonApplyClick(Sender: TObject);
begin
  Try
    UserSession.IBTableDIRS_SNHR.Edit;
    UserSession.IBTableDIRS_SNHR.Post;
    UserSession.IBTransaction1.CommitRetaining;
  Except
    try
      UserSession.IBTableDIRS_SNHR.Active:=False;
      UserSession.IBTableDIRS_SNHR.Active:=True;
    finally
    end;
  End;
end;

procedure TIWFormSNHR.IWImageButtonCancelClick(Sender: TObject);
begin
  Try UserSession.IBTransaction1.RollbackRetaining Except End;
  if UserSession.IBTableDIRS_SNHR.Modified=False then UserSession.IBTableDIRS_SNHR.Edit;
end;

procedure TIWFormSNHR.IWLink1Click(Sender: TObject);
begin
  UserSession.IBTableDIRS_HOST.Active:=False;
  Hide;
end;

end.
