unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Registry, Crypt, IdFTPFunctions, ToolWin, ActnMan, HDDInfo,
  ActnCtrls;

type
  TForm1 = class(TForm)
    ButtonEasyCode: TButton;
    ButtonEasyDecode: TButton;
    ButtonGenKey: TButton;
    MemoIn: TMemo;
    ButtonHardCode: TButton;
    ButtonHardDecode: TButton;
    LabelText: TLabel;
    Button1: TButton;
    procedure ButtonEasyCodeClick(Sender: TObject);
    procedure ButtonEasyDecodeClick(Sender: TObject);
    procedure ButtonGenKeyClick(Sender: TObject);
    procedure ButtonHardCodeClick(Sender: TObject);
    procedure ButtonHardDecodeClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var v,w: string;
    i: integer;
begin
  v:=MemoIn.Text;
  for i:=1 to length(v) do
    w:=v[i]+w;
  MemoIn.Text:=w;
end;

procedure TForm1.ButtonEasyCodeClick(Sender: TObject);
begin
  MemoIn.Text:=CoDecModify(MemoIn.Text, False)
end;

procedure TForm1.ButtonEasyDecodeClick(Sender: TObject);
begin
  MemoIn.Text:=CoDecModify(MemoIn.Text, True)
end;

procedure TForm1.ButtonGenKeyClick(Sender: TObject);
begin
  MemoIn.Text:=GenKey;
end;

procedure TForm1.ButtonHardCodeClick(Sender: TObject);
begin
  MemoIn.Text:=AllE(MemoIn.Text);
end;

procedure TForm1.ButtonHardDecodeClick(Sender: TObject);
begin
  MemoIn.Text:=AllD(MemoIn.Text);
end;

end.
