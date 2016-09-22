program LapisVerdeService;

uses
  System.Android.ServiceApplication,
  AndroidServiceDMUnt in 'AndroidServiceDMUnt.pas' {AndroidServiceDM: TAndroidService};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TAndroidServiceDM, AndroidServiceDM);
  Application.Run;
end.
