unit UntCadastro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.StdCtrls;

type
  TfrmCadastro = class(TForm)
    ToolBar1: TToolBar;
    spbVoltar: TSpeedButton;
    spbGravar: TSpeedButton;
    lytCadastro: TLayout;
    lblDialogo: TLabel;
    procedure spbGravarClick(Sender: TObject);
    procedure spbVoltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

{$R *.fmx}

uses
  UntPrincipal;

procedure TfrmCadastro.spbGravarClick(Sender: TObject);
begin
  ShowMessage('Dados Gravados com sucesso!');
  frmPrincipal.GoToTab(frmPrincipal.tbitemPrincipal, Sender);
end;

procedure TfrmCadastro.spbVoltarClick(Sender: TObject);
begin
  frmPrincipal.GoToTab(frmPrincipal.tbitemDialogo1, Sender);
end;

end.
