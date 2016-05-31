library mod_lapis_verde;

uses
  Winapi.ActiveX,
  System.Win.ComObj,
  Web.WebBroker,
  Web.ApacheApp,
  Web.HTTPD24Impl,
  Data.DBXCommon,
  Datasnap.DSSession,
  untServerMetodos in '..\Server Module\untServerMetodos.pas' {SrvServerMetodos: TDataModule},
  untSmAgenda in '..\Server Module\untSmAgenda.pas' {SmAgenda: TDataModule},
  untSmEscola in '..\Server Module\untSmEscola.pas' {SmEscola: TDataModule},
  untSmMain in '..\Server Module\untSmMain.pas' {SmMain: TDataModule},
  untSmResponsavel in '..\Server Module\untSmResponsavel.pas' {SmResponsavel: TDataModule},
  untSmTeste in '..\Server Module\untSmTeste.pas' {SmTeste: TDataModule},
  untLibGeral in '..\..\Lib\untLibGeral.pas',
  untLibServer in '..\..\Lib\untLibServer.pas',
  untResourceString in '..\..\Lib\untResourceString.pas',
  untTypes in '..\..\Lib\untTypes.pas',
  untWebModule in 'untWebModule.pas' {WebModule1: TWebModule};

{$R *.res}

// httpd.conf entries:
//
(*
 LoadModule lapis_verde_module modules/mod_lapis_verde.dll

 <Location /lapis_verde>
    SetHandler mod_lapis_verde-handler
 </Location>
*)
//
// These entries assume that the output directory for this project is the apache/modules directory.
//
// httpd.conf entries should be different if the project is changed in these ways:
//   1. The TApacheModuleData variable name is changed
//   2. The project is renamed.
//   3. The output directory is not the apache/modules directory
//

// Declare exported variable so that Apache can access this module.
var
  GModuleData: TApacheModuleData;
exports
  GModuleData name 'lapis_verde_module';

procedure TerminateThreads;
begin
  TDSSessionManager.Instance.Free;
  Data.DBXCommon.TDBXScheduler.Instance.Free;
end;

begin
  CoInitFlags := COINIT_MULTITHREADED;
  Web.ApacheApp.InitApplication(@GModuleData);
  Application.Initialize;
  Application.WebModuleClass := WebModuleClass;
  TApacheApplication(Application).OnTerminate := TerminateThreads;
  Application.Run;
end.
