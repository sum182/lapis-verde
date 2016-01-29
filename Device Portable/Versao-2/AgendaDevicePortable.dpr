program AgendaDevicePortable;

uses
  System.StartUpCopy,
  FMX.Forms,
  untTestes in 'untTestes.pas' {Form1},
  Proxy in 'Proxy.pas',
  untModuloCliente in 'untModuloCliente.pas' {ModuloCliente: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TModuloCliente, ModuloCliente);
  Application.Run;
end.
