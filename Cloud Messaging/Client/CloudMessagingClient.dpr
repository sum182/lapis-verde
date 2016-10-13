program CloudMessagingClient;

uses
  System.StartUpCopy,
  FMX.Forms,
  untClient in 'untClient.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
