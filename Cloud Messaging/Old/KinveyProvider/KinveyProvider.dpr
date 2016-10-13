program KinveyProvider;

uses
  System.StartUpCopy,
  FMX.Forms,
  untPrincipal in 'untPrincipal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
