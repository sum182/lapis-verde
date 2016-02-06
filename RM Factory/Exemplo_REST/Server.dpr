program Server;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  uFrmMain in 'uFrmMain.pas' {Form1},
  Controller.Contato in 'Controller.Contato.pas',
  Server.Container in 'Server.Container.pas' {ServerContainer1: TDataModule},
  Model.Contato in 'Model.Contato.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.Run;
end.

