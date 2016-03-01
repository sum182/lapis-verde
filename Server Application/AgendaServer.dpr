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
  untSmEscola in 'untSmEscola.pas' {SmEscola: TDataModule},
  untSmResponsavel in 'untSmResponsavel.pas' {SmResponsavel: TDataModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TSmMain, SmMain);
  Application.CreateForm(TfrmMainServer, frmMainServer);
  Application.Run;
end.
