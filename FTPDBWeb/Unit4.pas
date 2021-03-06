unit Unit4;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, UserSessionUnit,
  Controls, Forms, IWVCLBaseContainer, IWContainer, Math,
  IWHTMLContainer, IWRegion, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWGrids, IWDBGrids, ServerController, IWDBStdCtrls, IWHTMLControls,
  IWCompButton, IWCompListbox, IWExtCtrls;

type
  TIWFormLog = class(TIWAppForm)
    IWDBGridLog: TIWDBGrid;
    IWRegion1: TIWRegion;
    IWRegion4: TIWRegion;
    IWRegion2: TIWRegion;
    IWRegionList: TIWRegion;
    IWComboBoxList: TIWComboBox;
    IWButtonList1: TIWButton;
    IWButtonList2: TIWButton;
    IWLink1: TIWLink;
    IWImageButtonBackup: TIWImageButton;
    procedure LogClickBack(Sender: TObject);
    procedure IWListEnabled(Sender: TObject);
    procedure IWComboBoxListChange(Sender: TObject);
    procedure IWButtonList1Click(Sender: TObject);
    procedure IWButtonList2Click(Sender: TObject);
    procedure SetQueryLogReal(Sender: TObject);
  public
  end;

implementation

uses IBQuery;

{$R *.dfm}

procedure TIWFormLog.SetQueryLogReal(Sender: TObject);
var i, Count: Integer;
begin
  With UserSession.IBQueryLog do
  begin
    Active:=False;
    Active:=True;
    FetchAll;

    Count:=Ceil(RecordCount/IWDBGridLog.RowLimit);
    IWComboBoxList.Clear;
    for i:=1 to Count do IWComboBoxList.Items.Add(IntToStr(i));
    if Count>0 then IWComboBoxList.ItemIndex:=0;

    IWListEnabled(Self);
  end;
end;

procedure TIWFormLog.IWListEnabled(Sender: TObject);
begin
  if(IWComboBoxList.ItemIndex=0)or(IWComboBoxList.ItemIndex=-1)
    then IWButtonList1.Enabled:=False else IWButtonList1.Enabled:=True;
  if(IWComboBoxList.ItemIndex=IWComboBoxList.Items.Count-1)or(IWComboBoxList.Items.Count=0)
    then IWButtonList2.Enabled:=False else IWButtonList2.Enabled:=True;
end;

procedure TIWFormLog.LogClickBack(Sender: TObject);
begin
  UserSession.IBQuerylog.Active:=False;
  Hide;
end;

procedure TIWFormLog.IWButtonList2Click(Sender: TObject);
begin
  Try
    IWComboBoxList.ItemIndex:=IWComboBoxList.ItemIndex+1;
    IWDBGridLog.DataSource.DataSet.RecNo:=1+IWDBGridLog.RowLimit*IWComboBoxList.ItemIndex;
    IWListEnabled(Sender);
  finally
  End;
end;

procedure TIWFormLog.IWButtonList1Click(Sender: TObject);
begin
  Try
    IWComboBoxList.ItemIndex:=IWComboBoxList.ItemIndex-1;
    IWDBGridLog.DataSource.DataSet.RecNo:=1+IWDBGridLog.RowLimit*IWComboBoxList.ItemIndex;
    IWListEnabled(Sender);
  finally
  End;
end;

procedure TIWFormLog.IWComboBoxListChange(Sender: TObject);
begin
  IWDBGridLog.DataSource.DataSet.RecNo:=1+IWDBGridLog.RowLimit*IWComboBoxList.ItemIndex;
  IWListEnabled(Sender);
end;

end.
