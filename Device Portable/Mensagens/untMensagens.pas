unit untMensagens;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseToolBar, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts;

type
  TfrmMensagens = class(TfrmBaseToolBar)
    procedure FormCreate(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmMensagens: TfrmMensagens;

implementation

{$R *.fmx}

uses untLibDevicePortable;

procedure TfrmMensagens.FormCreate(Sender: TObject);
begin
  inherited;
  SetStyle(Self);
end;

end.
