program AgendaDevicePortableRX10;

uses
  System.StartUpCopy,
  FMX.Forms,
  System.UITypes,
  untDM in 'DM\untDM.pas' {Dm: TDataModule},
  untDMStyles in 'DM\untDMStyles.pas' {DMStyles: TDataModule},
  untDmResponsavel in 'DM\untDmResponsavel.pas' {DmResponsavel: TDataModule},
  untDmEscola in 'DM\untDmEscola.pas' {DmEscola: TDataModule},
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untModuloCliente in 'untModuloCliente.pas' {ModuloCliente: TDataModule},
  untTesteClientes in 'Testes\untTesteClientes.pas' {frmTesteClientes},
  untTesteFornecedores in 'Testes\untTesteFornecedores.pas' {frmTesteFornecedores},
  untTesteProduto in 'Testes\untTesteProduto.pas' {frmTesteProduto},
  untTesteString in 'Testes\untTesteString.pas' {frmTesteString},
  untTesteJsonFdMem in 'Testes\untTesteJsonFdMem.pas' {frmTesteJsonFdMem},
  untTesteJsonXSqLite in 'Testes\untTesteJsonXSqLite.pas' {frmTesteJsonXSqLite},
  Proxy in 'Proxy.pas',
  untLogin in 'untLogin.pas' {frmLogin},
  smCrypt in 'C:\Componentes\sum182\D15\Units\smCrypt.pas',
  untFuncoes in 'untFuncoes.pas',
  smFrmBase in 'C:\Componentes\sum182\D15\Forms\FireMonkey\smFrmBase.pas' {frmBase},
  smFrmBaseForAll in 'C:\Componentes\sum182\D15\Forms\FireMonkey\smFrmBaseForAll.pas' {frmBaseForAll},
  smFrmBaseToolBar in 'C:\Componentes\sum182\D15\Forms\FireMonkey\smFrmBaseToolBar.pas' {frmBaseToolBar},
  smGeralFMX in 'C:\Componentes\sum182\D15\Units\FMX\smGeralFMX.pas',
  untAgendaEscolaView in 'Agenda\untAgendaEscolaView.pas' {frmAgendaEscolaView},
  untMensagens in 'Mensagens\untMensagens.pas' {frmMensagens},
  untCriarConta in 'Usuario\untCriarConta.pas' {frmCriarConta},
  untTesteString2 in 'Testes\untTesteString2.pas' {frmTesteString2},
  untAgendaEscolaSelect in 'Agenda\untAgendaEscolaSelect.pas' {frmAgendaEscolaSelect},
  smDBFireDac in 'C:\Componentes\sum182\D15\Units\smDBFireDac.pas',
  untAgendaEscolaAdd in 'Agenda\untAgendaEscolaAdd.pas' {frmAgendaEscolaAdd},
  untTestesA in 'Testes\untTestesA.pas' {frmTesteA},
  untTestesB in 'Testes\untTestesB.pas' {frmTesteB},
  untPrincipalTeste in 'untPrincipalTeste.pas' {frmPrincipalTeste},
  smTemplate in 'C:\Componentes\sum182\D15\Forms\FireMonkey\smTemplate.pas' {frmTemplate},
  untAgendaEscolaViewTestes in 'Testes\untAgendaEscolaViewTestes.pas' {frmAgendaEscolaViewTestes};

{$R *.res}

begin
  //Modo Teste
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDmResponsavel, DmResponsavel);
  Application.CreateForm(TDmEscola, DmEscola);
  Application.CreateForm(TDMStyles, DMStyles);
  Application.CreateForm(TModuloCliente, ModuloCliente);
  Application.CreateForm(TfrmPrincipalTeste, frmPrincipalTeste);
  Application.CreateForm(TfrmAgendaEscolaViewTestes, frmAgendaEscolaViewTestes);
  //Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmPrincipalTeste, frmPrincipalTeste);
  Application.Run;
  Exit;
  // Fim do Teste



  //Modo Teste 2
  Application.Initialize;
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TDmResponsavel, DmResponsavel);
  Application.CreateForm(TDmEscola, DmEscola);
  Application.CreateForm(TDMStyles, DMStyles);
  Application.CreateForm(TModuloCliente, ModuloCliente);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
  Exit;
  // Fim do Teste



   //Modo Correto
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDmResponsavel, DmResponsavel);
  Application.CreateForm(TDmEscola, DmEscola);
  Application.CreateForm(TDMStyles, DMStyles);
  Application.CreateForm(TModuloCliente, ModuloCliente);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
