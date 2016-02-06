program ServidorDataSnap;
{$APPTYPE GUI}

{$R *.dres}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  UntMainServer in 'UntMainServer.pas' {frmMainServer},
  UntServerMetodos in 'UntServerMetodos.pas' {SrvServerMetodos: TDataModule},
  UntWebModulo in 'UntWebModulo.pas' {webModulo: TWebModule};

{$R *.res}

begin
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Initialize;
  Application.CreateForm(TfrmMainServer, frmMainServer);
  Application.Run;
end.
