program AgendaDevicePortable;

uses
  System.StartUpCopy,
  FMX.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  Proxy in 'Proxy.pas',
  untDM in 'untDM.pas' {DM: TDataModule},
  untModuloCliente in 'untModuloCliente.pas' {ModuloCliente: TDataModule},
  smGeralFMX in 'C:\Componentes\sum182\D15\Units\FMX\smGeralFMX.pas',
  smFrmBaseForAll in 'C:\Componentes\sum182\D15\Forms\FireMonkey\smFrmBaseForAll.pas' {frmBaseForAll},
  smFrmBase in 'C:\Componentes\sum182\D15\Forms\FireMonkey\smFrmBase.pas' {frmBase},
  untTesteClientes in 'Testes\untTesteClientes.pas' {frmTesteClientes},
  untTesteFornecedores in 'Testes\untTesteFornecedores.pas' {frmTesteFornecedores},
  untTesteProduto in 'Testes\untTesteProduto.pas' {frmTesteProduto},
  untTesteString in 'Testes\untTesteString.pas' {frmTesteString},
  untTesteJsonFdMem in 'Testes\untTesteJsonFdMem.pas' {frmTesteJsonFdMem},
  untTesteJsonXSqLite in 'Testes\untTesteJsonXSqLite.pas' {frmTesteJsonXSqLite};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TModuloCliente, ModuloCliente);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
  {
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TModuloCliente, ModuloCliente);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
}
end.
