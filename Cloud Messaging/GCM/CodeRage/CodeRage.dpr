program CodeRage;

uses
  System.StartUpCopy,
  FMX.Forms,
  formMain in 'formMain.pas' {frmMain},
  gcmnotification in 'C:\Componentes\TGCMReceiver\gcmnotification.pas',
  uGCMReceiver in 'C:\Componentes\TGCMReceiver\uGCMReceiver.pas',
  datamodulePush in 'datamodulePush.pas' {dmPush: TDataModule},
  RestClientPost in 'C:\Source\Repos\LanHUB\LanHUB Mobile\LanHUB\RestClientPost.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmPush, dmPush);
  Application.Run;
end.
