program AgendaDevicePortableRX10;

uses
  System.StartUpCopy,
  FMX.Forms,
  System.UITypes,
  untDM in 'DM\untDM.pas' {DM: TDataModule},
  untDMStyles in 'DM\untDMStyles.pas' {DMStyles: TDataModule},
  untDmResponsavel in 'DM\untDmResponsavel.pas' {DmResponsavel: TDataModule},
  untDmEscola in 'DM\untDmEscola.pas' {DmEscola: TDataModule} ,
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
  untAgenda in 'Agenda\untAgenda.pas' {frmAgenda},
  untMensagens in 'Mensagens\untMensagens.pas' {frmMensagens},
  untCriarConta in 'Usuario\untCriarConta.pas' {frmCriarConta},
  untTesteString2 in 'Testes\untTesteString2.pas' {frmTesteString2},
  untAgendaEscola in 'Agenda\untAgendaEscola.pas' {frmAgendaEscola};

{$R *.res}

begin
  //Modo Teste
  {Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDMStyles, DMStyles);
  Application.CreateForm(TModuloCliente, ModuloCliente);
  //Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);


  Application.CreateForm(TfrmBase, frmBase);
  Application.CreateForm(TfrmBaseForAll, frmBaseForAll);
  Application.CreateForm(TfrmBaseToolBar, frmBaseToolBar);
  Application.CreateForm(TfrmBaseToolBar, frmBaseToolBar);
  Application.Run;
  Exit;            }
  // Fim do Teste


   //Modo Correto
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TDmResponsavel, DmResponsavel);
  Application.CreateForm(TDmEscola, DmEscola);
  Application.CreateForm(TDMStyles, DMStyles);
  Application.CreateForm(TModuloCliente, ModuloCliente);
  Application.CreateForm(TfrmLogin, frmLogin);
  {Application.CreateForm(TfrmBase, frmBase);
  Application.CreateForm(TfrmBaseForAll, frmBaseForAll);
  Application.CreateForm(TfrmBaseToolBar, frmBaseToolBar);
  Application.CreateForm(TfrmBaseToolBar, frmBaseToolBar); }
  Application.Run;
end.
