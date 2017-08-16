unit FormVKey;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFormKey = class(TForm)
    Panel1: TPanel;
    MemoKey: TMemo;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtnCancel: TBitBtn;
    BitBtnOk: TBitBtn;
    procedure BitBtnOkClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IsOk: Boolean;
    //IsFileName: String;
  end;

var
  FormKey: TFormKey;

implementation

{$R *.dfm}

procedure TFormKey.BitBtnCancelClick(Sender: TObject);
begin
  IsOk:=False;
  Close;
end;

procedure TFormKey.BitBtnOkClick(Sender: TObject);
begin
  ISOk:=True;
  Close;
end;

end.
