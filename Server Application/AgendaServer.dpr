program AgendaServer;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  untFrmMainServer in 'untFrmMainServer.pas' {frmMainServer},
  untServerMetodos in 'untServerMetodos.pas' {SrvServerMetodos: TDataModule},
  untWebModulo in 'untWebModulo.pas' {webModulo: TWebModule},
  untSmTeste in 'untSmTeste.pas' {SmTeste: TDataModule},
  untSmMain in 'untSmMain.pas' {SmMain: TDataModule},
  untSmAgenda in 'untSmAgenda.pas' {SmAgenda: TDataModule},
  untSmEscola in 'untSmEscola.pas' {SmEscola: TDataModule},
  untSmResponsavel in 'untSmResponsavel.pas' {SmResponsavel: TDataModule},
  smDBFireDac in 'C:\Componentes\sum182\D15\Units\smDBFireDac.pas',
  smGeral in 'C:\Componentes\sum182\D15\Units\smGeral.pas',

  untResourceString in '..\Lib\untResourceString.pas',
  untLibServer in '..\Lib\untLibServer.pas',
  untLibGeral in '..\Lib\untLibGeral.pas' {$R *.res},
  untTypes in '..\Lib\untTypes.pas';

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TSmMain, SmMain);
  Application.CreateForm(TfrmMainServer, frmMainServer);
  Application.Run;
end.
