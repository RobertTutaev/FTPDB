unit Unit2;

interface

uses
  Classes, SysUtils, IWAppForm, IWApplication, IWColor, IWTypes, DateUtils,
  IWVCLBaseControl, IWCompLabel, IWCompListbox, Controls, ServerController,
  IWVCLBaseContainer, IWContainer, IWHTMLContainer, IWRegion, Unit4, Math,
  IWCompButton, IWGrids, IWDBGrids, IWHTMLControls, Graphics, IWExtCtrls,
  IWCompText, IWCompEdit, IWBaseControl, IWBaseHTMLControl, IWControl, Forms,
  IWCompRectangle, IWDBStdCtrls;

type
  TIWFormMain = class(TIWAppForm)
    IWRegionMain: TIWRegion;
    IWRegion3: TIWRegion;
    IWRegion1: TIWRegion;
    IWComboBoxSort: TIWComboBox;
    IWLabel1: TIWLabel;
    IWRegion5: TIWRegion;
    IWRegion4: TIWRegion;
    IWDBGridFiles: TIWDBGrid;
    IWRegion7: TIWRegion;
    IWLabelF1: TIWLabel;
    IWEdit11: TIWEdit;
    IWEdit12: TIWEdit;
    IWLabel11: TIWLabel;
    IWLabel12: TIWLabel;
    IWRegion8: TIWRegion;
    IWRegion9: TIWRegion;
    IWLabeF2: TIWLabel;
    IWEdit21: TIWEdit;
    IWEdit22: TIWEdit;
    IWLabel4: TIWLabel;
    IWLabel5: TIWLabel;
    IWLabelF3: TIWLabel;
    IWEdit31: TIWEdit;
    IWRegion6: TIWRegion;
    IWRadioGroup1: TIWRadioGroup;
    IWRadioGroup2: TIWRadioGroup;
    IWRadioGroup3: TIWRadioGroup;
    IWLabelFilesCount: TIWLabel;
    IWText1: TIWText;
    IWLabel10: TIWLabel;
    IWRegionList: TIWRegion;
    IWComboBoxList: TIWComboBox;
    IWButtonList1: TIWButton;
    IWButtonList2: TIWButton;
    IWRegion10: TIWRegion;
    IWLinkLogin: TIWLink;
    IWLinkScan: TIWLink;
    IWLinkExit: TIWLink;
    IWLink1: TIWLink;
    IWImageButton1: TIWImageButton;
    IWImageButton2: TIWImageButton;
    IWDBLookupComboBoxRowLimit: TIWDBLookupComboBox;
    IWImage2: TIWImage;
    IWLabel2: TIWLabel;
    IWImageFile: TIWImageFile;
    IWLabelDemo: TIWLabel;
    procedure SetQueryFiles(Sender: TObject);
    procedure SetQueryFilesReal(Sender: TObject);
    procedure LogClick(Sender: TObject);
    procedure IWButtonList1Click(Sender: TObject);
    procedure IWButtonList2Click(Sender: TObject);
    procedure IWAppFormCreate(Sender: TObject);
    procedure IWComboBoxListChange(Sender: TObject);
    procedure IWListEnabled(Sender: TObject);
    procedure IWLinkLoginClick(Sender: TObject);
    procedure IWLinkExitClick(Sender: TObject);
    procedure IWLinkScanClick(Sender: TObject);
    procedure IWLink1Click(Sender: TObject);
    procedure IWAppFormDestroy(Sender: TObject);
  public
    FormLog: TIWFormLog;
    function GetFilters: String;
    function GetRowLimit: Integer;
  end;

Const
  URLExit='/files/Exit.htm';
  Mess21= '����������� ����������� � ��!';
  Mess22= '�� ������� ������������ � FTP-�������!';
  Mess23= '����������� ������� ��������� ���������!'+#13#10+
          '��� ���������� ������ ������ ������� ������ "���������".';
  Mess24= '����������� ������� ��������� ���������!';
  Mess25= '������ ����� � �������� ���!'+#13#10+'B������ ��� ������!';
  Mess26= '������ ����� � �������� ��������!'+#13#10+'B������ ��� ������!';
  Mess27= '������ ����� � �������� �����!'+#13#10+'B������ ��� ������!';

implementation

uses IBQuery, DB, IWBaseForm, LibraryWeb, HTTPApp, IdTCPConnection,
  UserSessionUnit, IWForm, Unit1;

{$R *.dfm}

procedure TIWFormMain.LogClick(Sender: TObject);
begin
  With FormLog do
  begin
    SetQueryLogReal(Sender);
    Show;
  end;
end;

procedure TIWFormMain.SetQueryFiles(Sender: TObject);
begin
  //����������
  CookiesSet(WebApplication,'Sort',IntToStr(IWComboBoxSort.ItemIndex));
  CookiesSet(WebApplication,'RowLimit',IntToStr(IWDBLookupComboBoxRowLimit.KeyValue));

  //������ - ����
  CookiesSet(WebApplication,'FilterDate0',IntToStr(IWRadioGroup1.ItemIndex));
  CookiesSet(WebApplication,'FilterDate1',GetText(IWEdit11.Text));
  CookiesSet(WebApplication,'FilterDate2',GetText(IWEdit12.Text));

  //������ - ������
  CookiesSet(WebApplication,'FilterSize0',IntToStr(IWRadioGroup2.ItemIndex));
  CookiesSet(WebApplication,'FilterSize1',GetText(IWEdit21.Text));
  CookiesSet(WebApplication,'FilterSize2',GetText(IWEdit22.Text));

  //������ - ��������
  CookiesSet(WebApplication,'FilterName0',IntToStr(IWRadioGroup3.ItemIndex));
  CookiesSet(WebApplication,'FilterName1',GetText(IWEdit31.Text));

  SetQueryFilesReal(Sender);
end;

procedure TIWFormMain.SetQueryFilesReal(Sender: TObject);
var i, Count, RLimit: Integer;
begin
try
  With UserSession do
  begin
    RSort:=IWComboBoxSort.ItemIndex;
    RFilters:=GetFilters;
    IBQueryFiles.Active:=False;
    IBQueryFiles.Active:=True;
    IBQueryFiles.FetchAll;
    IWLabelFilesCount.Text:=C2+IntToStr(IBQueryFiles.RecordCount)+']';

    RLimit:=GetRowLimit;
    if RLimit<>0 then
      Count:=Ceil(IBQueryFiles.RecordCount/GetRowLimit) else
      if IBQueryFiles.RecordCount>0 then
        Count:=1 else Count:=0;
    IWComboBoxList.Clear;
    for i:=1 to Count do IWComboBoxList.Items.Add(IntToStr(i));
    if Count>0 then IWComboBoxList.ItemIndex:=0;
    IWListEnabled(Self);
  end;
except
  IWLabelFilesCount.Text:=C2;
end;
end;

procedure TIWFormMain.IWAppFormCreate(Sender: TObject);
begin
  FormLog:=TIWFormLog.Create(WebApplication);
  IWLabelDemo.Visible:=not IWServerController.IsReg;
end;

procedure TIWFormMain.IWAppFormDestroy(Sender: TObject);
begin
  FormLog.Release;
end;

procedure TIWFormMain.IWLink1Click(Sender: TObject);
var FAll: string;
begin
  FAll:=UserSession.GETTEXTFILE;
  if FAll<>'' then
    WebApplication.SendFile(FAll, True, '','');
end;

procedure TIWFormMain.IWLinkExitClick(Sender: TObject);
begin
  WebApplication.TerminateAndRedirect(URLExit)
end;

procedure TIWFormMain.IWLinkScanClick(Sender: TObject);
begin
  with UserSession do
  begin
    if IBDatabase1.Connected=False then
    begin
      WebApplication.ShowMessage(Mess21);
      Exit;
    end;

    with IdFTPDBScan1 do
    begin
      Disconnect;
      IdUser:=Us.IDUser;
      LoadOptions;
      try
        Connect;
      except
        WebApplication.ShowMessage(Mess22);
        Exit;
      end;
      if DIRS_AUTO_INSERT then
        WebApplication.ShowMessage(Mess23) else
        WebApplication.ShowMessage(Mess24);
      Disconnect;
    end;
  end;
end;

procedure TIWFormMain.IWLinkLoginClick(Sender: TObject);
begin
  Hide;
end;

procedure TIWFormMain.IWListEnabled(Sender: TObject);
begin
  if(IWComboBoxList.ItemIndex=0)or(IWComboBoxList.ItemIndex=-1)
    then IWButtonList1.Enabled:=False else IWButtonList1.Enabled:=True;
  if(IWComboBoxList.ItemIndex=IWComboBoxList.Items.Count-1)or(IWComboBoxList.Items.Count=0)
    then IWButtonList2.Enabled:=False else IWButtonList2.Enabled:=True;
end;

procedure TIWFormMain.IWComboBoxListChange(Sender: TObject);
begin
  IWDBGridFiles.DataSource.DataSet.RecNo:=1+IWDBGridFiles.RowLimit*IWComboBoxList.ItemIndex;
  IWListEnabled(Sender);
end;

procedure TIWFormMain.IWButtonList2Click(Sender: TObject);
begin
  Try
    IWComboBoxList.ItemIndex:=IWComboBoxList.ItemIndex+1;
    IWDBGridFiles.DataSource.DataSet.RecNo:=1+IWDBGridFiles.RowLimit*IWComboBoxList.ItemIndex;
    IWListEnabled(Sender);
  finally
  End;
end;

procedure TIWFormMain.IWButtonList1Click(Sender: TObject);
begin
  Try
    IWComboBoxList.ItemIndex:=IWComboBoxList.ItemIndex-1;
    IWDBGridFiles.DataSource.DataSet.RecNo:=1+IWDBGridFiles.RowLimit*IWComboBoxList.ItemIndex;
    IWListEnabled(Sender);
  finally
  End;
end;

function TIWFormMain.GetRowLimit: Integer;
begin
  Result:=50;
  case IWDBLookupComboBoxRowLimit.KeyValue of
  0: Result:=50;
  1: Result:=100;
  2: Result:=200;
  3: Result:=300;
  4: Result:=500;
  5: Result:=1000;
  6: Result:=2000;
  7: Result:=5000;
  8: Result:=0;
  end;
  IWDBGridFiles.RowLimit:=Result; 
end;

function TIWFormMain.GetFilters: String;
Var TempValue, Temp: String;
begin
  Result:='';

  //������ - ����
  Case IWRadioGroup1.ItemIndex of
  0: TempValue:='';
  1: TempValue:='(v_date='''+DateToStr(Now)+''')';
  2: TempValue:='(v_date<='''+DateToStr(Now)+''')and(v_date>'''+DateToStr(IncDay(Now,-7))+''')';
  3: begin
       try
         StrToDate(IWEdit11.Text);
         StrToDate(IWEdit12.Text);
         TempValue:='(v_date>='''+IWEdit11.Text+''')and(v_date<='''+IWEdit12.Text+''')';
       except
         WebApplication.ShowMessage(Mess25);
       end;
     end;
  End;
  if(Result<>'')and(TempValue<>'')then
    Result:=Result+'and'+TempValue else
    Result:=Result+TempValue;

  //������ - ������
  Case IWRadioGroup2.ItemIndex of
  0: TempValue:='';
  1: TempValue:='(v_size<=100)';
  2: TempValue:='(v_size<=1024)';
  3: TempValue:='(v_size>1024)';
  4: begin
       try
         StrToInt(IWEdit21.Text);
         StrToInt(IWEdit22.Text);
         TempValue:='(v_size>='+IWEdit21.Text+')and(v_size<='+IWEdit22.Text+')';
       except
         WebApplication.ShowMessage(Mess26);
       end;
     end;
  End;
  if(Result<>'')and(TempValue<>'')then
    Result:=Result+'and'+TempValue else
    Result:=Result+TempValue;

  //������ - ��������
  Case IWRadioGroup3.ItemIndex of
  0: TempValue:='';
  1: if Trim(IWEdit31.Text)='' then
       WebApplication.ShowMessage(Mess27)else
       begin
         Temp:=GetTextSQL(IWEdit31.Text);
         if(Copy(Temp,1,1)<>'%')and(Copy(Temp,Length(Temp),1)<>'%')then
           Temp:='%/'+Temp+'%';
         TempValue:='(locase(v_all) like ('''+Temp+'''))';
       end;
  End;
  if(Result<>'')and(TempValue<>'')then
    Result:=Result+'and'+TempValue else
    Result:=Result+TempValue;

  if(Result<>'')then Result:=' where'+Result;
end;

end.
