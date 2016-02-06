program NovaTecnicaNavegacao;

uses
  System.StartUpCopy,
  FMX.Forms,
  UntPrincipal in 'UntPrincipal.pas' {frmPrincipal},
  UntClientes in 'UntClientes.pas' {frmClientes},
  UntFornecedores in 'UntFornecedores.pas' {frmFornecedores},
  UntProdutos in 'UntProdutos.pas' {frmProdutos};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
