unit untSobre;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  smFrmBaseToolBar, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts;

type
  TfrmSobre = class(TfrmBaseToolBar)
    Label1: TLabel;
    lblVersao: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    procedure SetVersao;
  public
    { Public declarations }
  end;

var
  frmSobre: TfrmSobre;

implementation

{$R *.fmx}

uses untDMStyles, smGeralFMX,FMX.Platform;

procedure TfrmSobre.FormCreate(Sender: TObject);
begin
  inherited;
  SetVersao;
end;

procedure TfrmSobre.SetVersao;
begin
  lblVersao.Text:= 'Versão: ' + GetVersion;
end;

end.
