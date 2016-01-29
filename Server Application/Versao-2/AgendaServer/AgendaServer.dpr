program AgendaServer;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  untFrmMainServer in 'untFrmMainServer.pas' {frmMainServer},
  untServerMetodos in 'untServerMetodos.pas' {SrvServerMetodos: TDataModule},
  untWebModulo in 'untWebModulo.pas' {webModulo: TWebModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmMainServer, frmMainServer);
  Application.Run;
end.
