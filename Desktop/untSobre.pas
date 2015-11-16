unit untSobre;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, dxGDIPlusClasses,
  Vcl.ExtCtrls;

type
  TFrmSobre = class(TForm)
    Panel2: TPanel;
    img_logo: TImage;
    label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblModulo: TLabel;
    lblVersao: TLabel;
    Panel3: TPanel;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSobre: TFrmSobre;

implementation

{$R *.dfm}

uses smGeral;

procedure TFrmSobre.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FrmSobre:=nil;
end;

procedure TFrmSobre.FormShow(Sender: TObject);
begin
 lblVersao.Caption:= smGeral.GetVersion(Application.ExeName);
end;

end.
