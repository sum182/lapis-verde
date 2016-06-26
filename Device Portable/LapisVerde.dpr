program LapisVerde;

uses
  System.StartUpCopy,
  FMX.Forms,
  FMX.MobilePreview,
  System.UITypes,
  System.SysUtils,
  untDM in 'DM\untDM.pas' {Dm: TDataModule},
  untDMStyles in 'DM\untDMStyles.pas' {DMStyles: TDataModule},
  untDmResponsavel in 'DM\untDmResponsavel.pas' {DmResponsavel: TDataModule},
  untDmAgenda in 'DM\untDmAgenda.pas' {DmAgenda: TDataModule},
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untRestClient in 'untRestClient.pas' {RestClient: TDataModule},
  untTesteClientes in 'Testes\untTesteClientes.pas' {frmTesteClientes},
  untTesteFornecedores in 'Testes\untTesteFornecedores.pas' {frmTesteFornecedores},
  untTesteProduto in 'Testes\untTesteProduto.pas' {frmTesteProduto},
  untTesteString in 'Testes\untTesteString.pas' {frmTesteString},
  untTesteJsonFdMem in 'Testes\untTesteJsonFdMem.pas' {frmTesteJsonFdMem},
  untTesteJsonXSqLite in 'Testes\untTesteJsonXSqLite.pas' {frmTesteJsonXSqLite},
  Proxy in 'Proxy.pas',
  untLogin in 'untLogin.pas' {frmLogin},
  smCrypt in 'C:\Componentes\sum182\D15\Units\smCrypt.pas',
  smFrmBase in 'C:\Componentes\sum182\D15\Forms\FireMonkey\smFrmBase.pas' {frmBase},
  smFrmBaseForAll in 'C:\Componentes\sum182\D15\Forms\FireMonkey\smFrmBaseForAll.pas' {frmBaseForAll},
  smFrmBaseToolBar in 'C:\Componentes\sum182\D15\Forms\FireMonkey\smFrmBaseToolBar.pas' {frmBaseToolBar},
  smGeralFMX in 'C:\Componentes\sum182\D15\Units\FMX\smGeralFMX.pas',
  smMensagensFMX in 'C:\Componentes\sum182\D15\Units\FMX\smMensagensFMX.pas',
  untAgendaView in 'Agenda\untAgendaView.pas' {frmAgendaView},
  untMensagens in 'Mensagens\untMensagens.pas' {frmMensagens},
  untCriarConta in 'Usuario\untCriarConta.pas' {frmCriarConta},
  untTesteString2 in 'Testes\untTesteString2.pas' {frmTesteString2},
  untAgendaSelect in 'Agenda\untAgendaSelect.pas' {frmAgendaSelect},
  smDBFireDac in 'C:\Componentes\sum182\D15\Units\smDBFireDac.pas',
  untAgendaAdd in 'Agenda\untAgendaAdd.pas' {frmAgendaAdd},
  untTestesA in 'Testes\untTestesA.pas' {frmTesteA},
  untTestesB in 'Testes\untTestesB.pas' {frmTesteB},
  untPrincipalTeste in 'untPrincipalTeste.pas' {frmPrincipalTeste},
  smTemplate in 'C:\Componentes\sum182\D15\Forms\FireMonkey\smTemplate.pas' {frmTemplate},
  untAgendaEscolaViewTestes in 'Testes\untAgendaEscolaViewTestes.pas' {frmAgendaEscolaViewTestes},
  untDmGetServer in 'DM\untDmGetServer.pas' {DmGetServer: TDataModule},
  untDmSaveServer in 'DM\untDmSaveServer.pas' {DmSaveServer: TDataModule},
  untLibGeral in '..\Lib\untLibGeral.pas',
  untLibServer in '..\Lib\untLibServer.pas',
  untTypes in '..\Lib\untTypes.pas',
  untTesteGeralApp in 'Testes\untTesteGeralApp.pas' {frmTesteGeralApp},
  untResourceString in '..\Lib\untResourceString.pas',
  untLibDevicePortable in 'Lib\untLibDevicePortable.pas',
  untSplashScreen in 'untSplashScreen.pas' {frmSplashScreen},
  untPerfilFuncionario in 'Perfil\untPerfilFuncionario.pas' {frmPerfilFuncionario};

{$R *.res}

begin
  //Modo Produção
  Application.Initialize;
  Application.CreateForm(TfrmSplashScreen, frmSplashScreen);
  Application.Run;
  Exit;


  //Modo Teste
  Application.Initialize;
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TDmResponsavel, DmResponsavel);
  Application.CreateForm(TDmAgenda, DmAgenda);
  Application.CreateForm(TDMStyles, DMStyles);
  Application.CreateForm(TDmGetServer, DmGetServer);
  Application.CreateForm(TDmSaveServer, DmSaveServer);
  Application.CreateForm(TRestClient, RestClient);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;

end.
