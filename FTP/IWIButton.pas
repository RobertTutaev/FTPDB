unit IWIButton;

interface

uses
  SysUtils, Classes, Controls, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWExtCtrls;

type
  TIWImageButton1 = class(TIWImageButton)
  private
    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    constructor Create(ASender: Tobject); Override;
  published
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('FTP', [TIWImageButton1]);
end;

{ TIWImageButton1 }

constructor TIWImageButton1.Create;
begin
  inherited;
  ImageFile.Filename:='\files\ru\Enter.bmp';
end;

end.
