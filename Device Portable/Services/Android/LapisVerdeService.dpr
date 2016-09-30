program LapisVerdeService;

uses
  System.Android.ServiceApplication,
  AndroidServiceDMUnt in 'AndroidServiceDMUnt.pas' {AndroidServiceDM: TAndroidService},
  untTypes in '..\..\..\Lib\untTypes.pas',
  untLibGeral in '..\..\..\Lib\untLibGeral.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TAndroidServiceDM, AndroidServiceDM);
  Application.Run;
end.
