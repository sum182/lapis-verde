program AgendaServer;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  untFrmMainServer in 'untFrmMainServer.pas' {frmMainServer},
  untWebModule in 'untWebModule.pas' {webModulo: TWebModule},
  smDBFireDac in 'C:\Componentes\sum182\D15\Units\smDBFireDac.pas',
  smGeral in 'C:\Componentes\sum182\D15\Units\smGeral.pas',
  untLibGeral in '..\..\Lib\untLibGeral.pas',
  untLibServer in '..\..\Lib\untLibServer.pas',
  untResourceString in '..\..\Lib\untResourceString.pas',
  untTypes in '..\..\Lib\untTypes.pas',
  untServerMetodos in '..\Server Module\untServerMetodos.pas' {SrvServerMetodos: TDataModule},
  untSmAgenda in '..\Server Module\untSmAgenda.pas' {SmAgenda: TDataModule},
  untSmEscola in '..\Server Module\untSmEscola.pas' {SmEscola: TDataModule},
  untSmMain in '..\Server Module\untSmMain.pas' {SmMain: TDataModule},
  untSmResponsavel in '..\Server Module\untSmResponsavel.pas' {SmResponsavel: TDataModule},
  untSmTeste in '..\Server Module\untSmTeste.pas' {SmTeste: TDataModule},
  untSQLs in '..\..\Lib\untSQLs.pas',
  untServerContainer in '..\Server Container\untServerContainer.pas' {ServerContainer: TDataModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TServerContainer, ServerContainer);
  Application.CreateForm(TfrmMainServer, frmMainServer);
  Application.CreateForm(TSmAgenda, SmAgenda);
  Application.CreateForm(TSmEscola, SmEscola);
  Application.CreateForm(TSmMain, SmMain);
  Application.CreateForm(TSmResponsavel, SmResponsavel);
  Application.CreateForm(TSmTeste, SmTeste);
  Application.Run;
end.
