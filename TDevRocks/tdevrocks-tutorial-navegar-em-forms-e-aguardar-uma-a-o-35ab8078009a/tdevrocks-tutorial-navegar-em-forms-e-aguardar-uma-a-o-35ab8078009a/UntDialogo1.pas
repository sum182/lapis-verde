unit UntDialogo1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts;

type
  TfrmDialogo1 = class(TForm)
    lytDialogo: TLayout;
    ToolBar1: TToolBar;
    spbVoltar: TSpeedButton;
    spbAvancar: TSpeedButton;
    lblDialogo: TLabel;
    procedure spbVoltarClick(Sender: TObject);
    procedure spbAvancarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.fmx}

uses
  UntPrincipal, UntCadastro;

procedure TfrmDialogo1.spbAvancarClick(Sender: TObject);
begin
  if not (Assigned(frmPrincipal.FCadastro)) then
    frmPrincipal.FCadastro := TfrmCadastro.Create(Self);

  frmPrincipal.tbitemCadastro.AddObject(frmPrincipal.FCadastro.lytCadastro);
  frmPrincipal.GoToTab(frmPrincipal.tbitemCadastro, Sender);
end;

procedure TfrmDialogo1.spbVoltarClick(Sender: TObject);
begin
  frmPrincipal.GoToTab(frmPrincipal.tbitemPrincipal, Sender);
end;

end.
